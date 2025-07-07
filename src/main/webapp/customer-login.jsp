<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Login - Online Banking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #e6eff8;
            padding: 30px;
        }

        .login-wrapper {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .left-panel {
            padding: 40px;
        }

        .left-panel h3 {
            font-weight: bold;
            color: #5a3e5c;
        }

        .btn-login {
            background-color: #004080;
            color: white;
            font-weight: bold;
        }

        .btn-login:hover {
            background-color: #003366;
        }

        .form-control {
            border-radius: 6px;
        }

        .info-links a {
            font-size: 0.85rem;
            color: #004080;
            text-decoration: none;
        }

        .info-links a:hover {
            text-decoration: underline;
        }

        .right-panel {
            background-color: #f5f7fa;
            padding: 30px;
            border-left: 1px solid #ccc;
        }

        .steps h5 {
            color: #004080;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .steps ul {
            list-style: none;
            padding-left: 0;
        }

        .steps li {
            margin-bottom: 10px;
            padding-left: 25px;
            position: relative;
            color: #333;
        }

        .steps li::before {
            content: "✔";
            position: absolute;
            left: 0;
            color: green;
        }

        @media (max-width: 768px) {
            .login-wrapper {
                flex-direction: column;
            }

            .right-panel {
                border-left: none;
                border-top: 1px solid #ccc;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="d-flex login-wrapper flex-wrap">
                <!-- Left Side - Login Form -->
                <div class="col-md-6 left-panel">
                    <h3 class="mb-4">Customer Login</h3>

                    <form action="customer-login" method="post">
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                        </div>

                        <div class="mb-3">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                        </div>

                        <div class="d-grid mb-3">
                            <button type="submit" class="btn btn-login">LOGIN</button>
                        </div>


                        <div class="info-links">
                            Not Registered? <a href="customer-register.jsp">Register Here</a>
                        </div>

                        <!-- Message -->
                        <%
                            String msg = (String) request.getAttribute("msg");
                            if (msg != null) {
                        %>
                        <div class="alert alert-danger mt-3 text-center"><%= msg %></div>
                        <%
                            }
                        %>
                    </form>
                    <div class="steps">
                                            <h5>Steps to Login</h5>
                                            <ul>
                                                <li>Enter your registered Email</li>
                                                <li>Enter your account Password</li>
                                                <li>Click on the LOGIN button</li>
                                                <li>If registered, you will be redirected to your dashboard</li>
                                                <li>New user? Click on Register to create an account</li>
                                            </ul>
                                        </div>
                </div>

                <!-- Right Side  -->
                <div class="col-md-6 right-panel">
                    <div class="right-panel d-none d-md-block text-center">
                        <img src="image/Banner.png" alt="Secure Transactions"
                             style="max-width: 100%; height: 500px; object-fit: cover;">
                    </div>

                </div>
            </divR>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
