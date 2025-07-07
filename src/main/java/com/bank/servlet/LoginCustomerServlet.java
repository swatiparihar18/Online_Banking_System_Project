package com.bank.servlet;

import com.bank.model.Customer;
import com.bank.util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class LoginCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM customers WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();

                // ✅ Store accountNumber and Customer object
                String accountNumber = rs.getString("account_number");

                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setFirstName(rs.getString("firstname"));
                customer.setLastName(rs.getString("lastname"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setBranch(rs.getString("branch"));
                customer.setAccountNumber(accountNumber);
                customer.setBalance(rs.getDouble("balance"));

                session.setAttribute("accountNumber", accountNumber); // 🔥 Required for deposit/withdraw
                session.setAttribute("customer", customer);           // 🔥 For dashboard

                session.setAttribute("customerName", customer.getFirstName());
                session.setAttribute("email", customer.getEmail());

                response.sendRedirect("customer-dashboard.jsp");
            } else {
                request.setAttribute("msg", "❌ Invalid email or password.");
                request.getRequestDispatcher("customer-login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "❌ Error: " + e.getMessage());
            request.getRequestDispatcher("customer-login.jsp").forward(request, response);
        }
    }
}
