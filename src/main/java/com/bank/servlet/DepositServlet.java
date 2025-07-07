package com.bank.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class DepositServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double amount = Double.parseDouble(request.getParameter("amount"));
        HttpSession session = request.getSession(false);
        String accountNumber = (String) session.getAttribute("accountNumber");

        if (session == null || accountNumber == null) {
            response.sendRedirect("error.jsp?msg=Session expired. Please login again.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            // Update balance
            PreparedStatement ps = conn.prepareStatement(
                    "UPDATE customers SET balance = balance + ? WHERE account_number = ?"
            );
            ps.setDouble(1, amount);
            ps.setString(2, accountNumber);
            ps.executeUpdate();

            // Record transaction
            PreparedStatement tx = conn.prepareStatement(
                    "INSERT INTO transactions(account_number, type, amount) VALUES (?, 'DEPOSIT', ?)"
            );
            tx.setString(1, accountNumber);
            tx.setDouble(2, amount);
            tx.executeUpdate();

            System.out.println("Deposit successful: " + accountNumber + " → ₹" + amount);
            response.sendRedirect("customer-dashboard.jsp?msg=Deposit+Successful");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Deposit+Failed");
        }
    }
}
