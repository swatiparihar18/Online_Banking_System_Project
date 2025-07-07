<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <div class="alert alert-danger">
        <h4>Error Occurred</h4>
        <p><%= request.getParameter("msg") != null ? request.getParameter("msg") : "Something went wrong." %></p>
        <a href="index.jsp" class="btn btn-secondary mt-3">Go to Home</a>
    </div>
</body>
</html>
