<%@ page import="java.sql.*, com.bank.util.DBConnection" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f1f1;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<div class="container">
<div class="d-flex justify-content-end mb-3">
    <a href="customer-dashboard.jsp" class="btn btn-outline-primary me-2">🏠 Dashboard</a>
    <a href="logout.jsp" class="btn btn-outline-danger">🚪 Logout</a>
</div>

    <h2>📜 Transaction History</h2>
    <%
        String email = (String) session.getAttribute("email");
        if (email == null) {
            response.sendRedirect("customer-login.jsp");
            return;
        }

        Connection conn = null;
        PreparedStatement pst1 = null, pst2 = null;
        ResultSet rs1 = null, rs2 = null;
        String accNo = null;

        try {
            conn = DBConnection.getConnection();

            // Get user's account number
            pst1 = conn.prepareStatement("SELECT account_number FROM customers WHERE email = ?");
            pst1.setString(1, email);
            rs1 = pst1.executeQuery();

            if (rs1.next()) {
                accNo = rs1.getString("account_number");

                // Fetch all transactions for that account
                pst2 = conn.prepareStatement("SELECT * FROM transactions WHERE account_number = ? ORDER BY date DESC");
                pst2.setString(1, accNo);
                rs2 = pst2.executeQuery();
    %>

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Remarks</th>
        </tr>
        </thead>
        <tbody>
        <%
            while (rs2.next()) {
        %>
            <tr>
                <td><%= rs2.getInt("id") %></td>
                <td><%= rs2.getString("type") %></td>
                <td>₹ <%= rs2.getDouble("amount") %></td>
                <td><%= rs2.getTimestamp("date") %></td>
                <td><%= rs2.getString("remarks") %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <%
            } else {
    %>
                <p class="text-danger text-center">❌ Account not found!</p>
    <%
            }
        } catch (Exception e) {
            out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
        } finally {
            try { if (rs1 != null) rs1.close(); } catch (Exception ignored) {}
            try { if (rs2 != null) rs2.close(); } catch (Exception ignored) {}
            try { if (pst1 != null) pst1.close(); } catch (Exception ignored) {}
            try { if (pst2 != null) pst2.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    %>
</div>

</body>
</html>
