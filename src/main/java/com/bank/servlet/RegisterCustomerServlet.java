package com.bank.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String dob = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String branch = request.getParameter("branch");
            String password = request.getParameter("password");
            String permanentAddress = request.getParameter("permanentAddress");
            String presentAddress = request.getParameter("presentAddress");

            // Generate unique account number
            String accountNumber = "AC" + System.currentTimeMillis();

            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO customers (firstname, lastname, dob, phone, email, gender, branch, password, permanent_address, present_address, account_number, balance) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, dob);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, gender);
            ps.setString(7, branch);
            ps.setString(8, password);
            ps.setString(9, permanentAddress);
            ps.setString(10, presentAddress);
            ps.setString(11, accountNumber);
            ps.setDouble(12, 0.0); // Initial balance

            int rows = ps.executeUpdate();
            conn.close();

            if (rows > 0) {
                request.setAttribute("msg", "✅ Registration successful. Please login.");
                request.getRequestDispatcher("customer-login.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "❌ Registration failed.");
                request.getRequestDispatcher("customer-register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "❌ Error: " + e.getMessage());
            request.getRequestDispatcher("customer-register.jsp").forward(request, response);
        }
    }
}
