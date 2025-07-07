<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Us - Online Banking System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Favicon -->
  <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/190/190411.png">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f7fb;
    }

    .navbar {
      background-color: #003366;
    }

    .navbar-brand {
      color: #fff;
      font-weight: bold;
      display: flex;
      align-items: center;
    }

    .navbar-brand img {
      height: 40px;
      margin-right: 10px;
    }

    .nav-link {
      color: #fff !important;
      font-weight: 500;
      margin-left: 15px;
    }

    .hero {
      background: linear-gradient(to right, #e3f2fd, #ffffff);
      padding: 80px 0;
      text-align: center;
    }

    .hero h1 {
      font-size: 2.8rem;
      color: #003366;
      font-weight: bold;
    }

    .hero p {
      font-size: 1.2rem;
      margin-top: 20px;
      color: #333;
      max-width: 700px;
      margin-left: auto;
      margin-right: auto;
    }

    .about-img img {
      width: 100%;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .section {
      padding: 60px 0;
    }

    .footer {
      background-color: #003366;
      color: #fff;
      padding: 15px 0;
      text-align: center;
      margin-top: 40px;
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 2rem;
      }

      .hero p {
        font-size: 1rem;
      }
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
      <img src="https://png.pngtree.com/png-clipart/20190628/original/pngtree-vector-bank-icon-png-image_4046246.jpg" alt="Bank Logo">
      Online Banking System
    </a>
    <button class="navbar-toggler bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a href="index.jsp" class="nav-link">Back to Home</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero">
  <div class="container">
    <h1>About Our Banking System</h1>
    <p>
      Welcome to our secure and user-friendly Online Banking System. We empower you to manage your finances from anywhere, anytime — safely and efficiently.
    </p>
  </div>
</section>

<!-- About Content -->
<section class="section">
  <div class="container">
    <div class="row align-items-center">
      <!-- Text -->
      <div class="col-md-6">
        <h3 class="text-primary fw-bold mb-3">Secure. Smart. Seamless.</h3>
        <p>
          Our platform offers full control over your finances with services like deposits, withdrawals, transfers, and viewing transaction history. Whether you're at home or abroad, you can securely access your account 24/7.
        </p>
        <p>
          Developed with modern web technologies and strict security protocols, we ensure every transaction is encrypted and protected. Our goal is to make banking easy, fast, and safe for everyone.
        </p>
      </div>

      <!-- Image -->
      <div class="col-md-6 about-img">
        <img src="image/smart.jpg" alt="Digital Banking Illustration">
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<div class="footer">
  &copy; 2025 Online Banking System. All rights reserved.
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
