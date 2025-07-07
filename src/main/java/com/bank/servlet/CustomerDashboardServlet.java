package com.bank.servlet;

import com.bank.dao.CustomerDAO;
import com.bank.model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CustomerDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerEmail") == null) {
            response.sendRedirect("customer-login.jsp");
            return;
        }

        String email = (String) session.getAttribute("customerEmail");

        // Debug log
        System.out.println("✅ Email from session: " + email);

        Customer customer = CustomerDAO.getCustomerByEmail(email);

        // More logging
        if (customer != null) {
            System.out.println("✅ Customer loaded: " + customer.getFirstName());
            session.setAttribute("customer", customer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer-dashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("❌ No customer found in DB for email: " + email);
            response.sendRedirect("customer-login.jsp");
        }
    }
}
