<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Withdraw</title>
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
<body class="container mt-5">
    <h3 class="mb-4">Withdraw Amount</h3>
    <form action="WithdrawServlet" method="post">
        <div class="mb-3">
            <label for="amount" class="form-label">Amount</label>
            <input type="number" step="0.01" name="amount" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-danger">Withdraw</button>
    </form>
</body>
</html>
