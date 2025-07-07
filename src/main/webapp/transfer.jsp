<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" %>
<%
    String customerName = (String) session.getAttribute("customerName");
    if (customerName == null) {
        response.sendRedirect("customer-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transfer Funds</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin-top: 80px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .form-title {
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-title">Transfer Money</div>

    <!-- Show message from servlet -->
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <div class="alert alert-info text-center"><%= message %></div>
    <%
        }
    %>

    <form action="TransferServlet" method="post">
        <div class="mb-3">
            <label for="receiverAccount" class="form-label">Receiver Account Number</label>
            <input type="text" class="form-control" id="receiverAccount" name="receiverAccount" required>
        </div>

        <div class="mb-3">
            <label for="amount" class="form-label">Amount </label>
            <input type="number" class="form-control" id="amount" name="amount" min="1" required>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Transfer</button>
        </div>
    </form>
</div>

</body>
</html>
