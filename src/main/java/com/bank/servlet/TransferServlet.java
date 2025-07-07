package com.bank.servlet;

import com.bank.util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class TransferServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String senderEmail = (String) request.getSession().getAttribute("email");
        String receiverAcc = request.getParameter("receiverAccount");
        double amount = Double.parseDouble(request.getParameter("amount"));

        Connection conn = null;
        PreparedStatement pst1 = null, pst2 = null, pst3 = null, logSender = null, logReceiver = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();

            // Get sender's account number and balance
            pst1 = conn.prepareStatement("SELECT account_number, balance FROM customers WHERE email = ?");
            pst1.setString(1, senderEmail);
            rs = pst1.executeQuery();

            if (!rs.next()) {
                request.setAttribute("message", "❌ Sender not found.");
                request.getRequestDispatcher("transfer.jsp").forward(request, response);
                return;
            }

            String senderAcc = rs.getString("account_number");
            double senderBalance = rs.getDouble("balance");

            if (senderAcc.equals(receiverAcc)) {
                request.setAttribute("message", "❌ Cannot transfer to same account.");
                request.getRequestDispatcher("transfer.jsp").forward(request, response);
                return;
            }

            if (senderBalance < amount) {
                request.setAttribute("message", "❌ Insufficient balance.");
                request.getRequestDispatcher("transfer.jsp").forward(request, response);
                return;
            }

            // Start transaction
            conn.setAutoCommit(false);

            // Deduct from sender
            pst2 = conn.prepareStatement("UPDATE customers SET balance = balance - ? WHERE account_number = ?");
            pst2.setDouble(1, amount);
            pst2.setString(2, senderAcc);
            pst2.executeUpdate();

            // Add to receiver
            pst3 = conn.prepareStatement("UPDATE customers SET balance = balance + ? WHERE account_number = ?");
            pst3.setDouble(1, amount);
            pst3.setString(2, receiverAcc);
            int rows = pst3.executeUpdate();

            if (rows > 0) {
                // ✅ Log for sender (WITHDRAW)
                logSender = conn.prepareStatement(
                        "INSERT INTO transactions (account_number, type, amount, remarks) VALUES (?, 'WITHDRAW', ?, ?)");
                logSender.setString(1, senderAcc);
                logSender.setDouble(2, amount);
                logSender.setString(3, "Transfer to " + receiverAcc);
                logSender.executeUpdate();

                // ✅ Log for receiver (DEPOSIT)
                logReceiver = conn.prepareStatement(
                        "INSERT INTO transactions (account_number, type, amount, remarks) VALUES (?, 'DEPOSIT', ?, ?)");
                logReceiver.setString(1, receiverAcc);
                logReceiver.setDouble(2, amount);
                logReceiver.setString(3, "Received from " + senderAcc);
                logReceiver.executeUpdate();

                conn.commit();

                // ✅ Redirect to dashboard with success message
                response.sendRedirect("customer-dashboard.jsp?message=Transfer+successful");
            } else {
                conn.rollback();
                request.setAttribute("message", "❌ Receiver account not found. Transfer cancelled.");
                request.getRequestDispatcher("transfer.jsp").forward(request, response);
            }

        } catch (Exception e) {
            try { if (conn != null) conn.rollback(); } catch (Exception ignored) {}
            e.printStackTrace();
            request.setAttribute("message", "❌ Error: " + e.getMessage());
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (pst1 != null) pst1.close(); } catch (Exception ignored) {}
            try { if (pst2 != null) pst2.close(); } catch (Exception ignored) {}
            try { if (pst3 != null) pst3.close(); } catch (Exception ignored) {}
            try { if (logSender != null) logSender.close(); } catch (Exception ignored) {}
            try { if (logReceiver != null) logReceiver.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
