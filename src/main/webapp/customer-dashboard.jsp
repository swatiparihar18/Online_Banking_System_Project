<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*, com.bank.model.Customer, com.bank.util.DBConnection" %>
<%@ page session="true" %>


<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("customer-login.jsp");
        return;
    }

    // ✅ Reload latest balance from DB
    try (Connection conn = DBConnection.getConnection()) {
        PreparedStatement ps = conn.prepareStatement("SELECT balance FROM customers WHERE account_number = ?");
        ps.setString(1, customer.getAccountNumber());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            customer.setBalance(rs.getDouble("balance"));
        }
        rs.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6fa;
            font-family: 'Segoe UI', sans-serif;
        }
        .dashboard-box {
            max-width: 900px;
            margin: auto;
            margin-top: 40px;
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .action-btn {
            margin-right: 10px;
        }
        .account-details {
            background: #f0f8ff;
            padding: 15px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<div class="dashboard-box">
    <h2>Welcome, <%= customer.getFirstName() %>!</h2>
    <p class="text-muted">Here is your account dashboard</p>

    <div class="account-details mt-4">
        <h5>Account Summary</h5>
        <table class="table table-bordered">
            <tr>
                <th>Account Number</th>
                <td><%= customer.getAccountNumber() %></td>
            </tr>
            <tr>
                <th>Full Name</th>
                <td><%= customer.getFirstName() + " " + customer.getLastName() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= customer.getEmail() %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= customer.getPhone() %></td>
            </tr>
            <tr>
                <th>Branch</th>
                <td><%= customer.getBranch() %></td>
            </tr>
            <tr>
                <th>Balance</th>
                <td>₹ <%= customer.getBalance() %></td>
            </tr>
        </table>
    </div>

    <div class="mt-4">
        <h5>Quick Actions</h5>
        <a href="deposit.jsp" class="btn btn-success action-btn">Deposit</a>
        <a href="withdraw.jsp" class="btn btn-danger action-btn">Withdraw</a>
        <a href="transfer.jsp" class="btn btn-primary action-btn">Transfer</a>
        <a href="transaction-histroy.jsp" class="btn btn-secondary action-btn">Transaction History</a>
        <a href="logout.jsp" class="btn btn-dark float-end">Logout</a>
    </div>
    <% String msg = request.getParameter("msg");
       if (msg != null) { %>
        <div class="alert alert-info mt-3"><%= msg %></div>
    <% } %>
    <% String msg = request.getParameter("message");
       if (msg != null) {
    %>
        <div class="alert alert-success text-center mt-3"><%= msg %></div>
    <% } %>


</div>

</body>
</html>
