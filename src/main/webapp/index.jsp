<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Online Banking System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #eef3f7;
    }

    /* Navbar */
    .navbar {
      background-color: #003366;
    }

    .navbar-brand {
      font-weight: bold;
      color: white;
      font-size: 1.4rem;
    }

    .navbar-brand img {
      height: 40px;
      margin-right: 10px;
    }

    .nav-link {
      color: #ffffff !important;
      margin-left: 15px;
    }

    .hero {
      background: linear-gradient(to right, #e0f0ff, #f8fbfd);
      padding: 80px 20px;
    }

    .hero h1 {
      font-size: 2.5rem;
      font-weight: 700;
      color: #003366;
    }

    .hero p {
      font-size: 1.1rem;
      color: #333;
      margin-top: 10px;
    }

    .hero img {
      max-width: 100%;
      height: auto;
      border-radius: 10px;
    }

    .security-tips h5 {
      font-size: 1.1rem;
      font-weight: bold;
    }

    .security-card {
      background-color: #ffffff;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    .footer-img {
      text-align: center;
      margin: 40px 0 20px;
    }

    .footer-img img {
      max-width: 90%;
      border-radius: 10px;
    }

    .section-title {
      text-align: center;
      margin-bottom: 30px;
      color: #003366;
      font-weight: bold;
    }

    ul li {
      margin-bottom: 8px;
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 1.8rem;
      }
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="https://png.pngtree.com/png-clipart/20190628/original/pngtree-vector-bank-icon-png-image_4046246.jpg" alt="Logo">
      Online Banking
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
        <li class="nav-item"><a class="nav-link" href="customer-login.jsp">Customer Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero">
  <div class="container">
    <div class="row align-items-center">
      <!-- Left -->
      <div class="col-md-6 mb-4 mb-md-0">
        <h1>Bank Smarter & Safer</h1>
        <p>Deposit, Withdraw & Transfer anytime, anywhere. <br> Experience a modern, secure, and fast banking system.</p>
      </div>
      <!-- Right -->
      <div class="col-md-6 text-center">
<img src="image/7990322.jpg" alt="Bank Illustration" class="img-fluid" style="max-width: 400px;">
      </div>
    </div>
  </div>
</section>

<!-- Security Tips -->
<section class="container my-5">
  <h3 class="section-title">Security Tips</h3>
  <div class="row text-center">
    <div class="col-md-3 mb-4">
      <div class="security-card">
        <h5 class="text-success">ALWAYS</h5>
        <p>Use strong passwords & keep your device secure.</p>
      </div>
    </div>
    <div class="col-md-3 mb-4">
      <div class="security-card">
        <h5 class="text-success">ALWAYS</h5>
        <p>Update your contact info & change passwords regularly.</p>
      </div>
    </div>
    <div class="col-md-3 mb-4">
      <div class="security-card">
        <h5 class="text-danger">NEVER</h5>
        <p>Share your OTP, CVV or password with anyone.</p>
      </div>
    </div>
    <div class="col-md-3 mb-4">
      <div class="security-card">
        <h5 class="text-danger">NEVER</h5>
        <p>Click suspicious links or download unknown apps.</p>
      </div>
    </div>
  </div>
</section>

<!-- Security Awareness -->
<section class="container mb-5">
  <h3 class="section-title">For Your Own Security</h3>
  <div class="row">
    <div class="col-md-6">
      <h6><strong>Before You Login</strong></h6>
      <ul>
        <li>Ensure the URL starts with <strong>http://localhost:8080/</strong> or secure domain.</li>
        <li>If deployed online, verify <strong>https://</strong> with padlock icon.</li>
        <li>Always use updated Chrome, Edge, Firefox, or Safari.</li>
      </ul>
    </div>
    <div class="col-md-6">
      <h6><strong>Beware of Phishing</strong></h6>
      <ul>
        <li>We never ask for password or OTP via call or mail.</li>
        <li>Never share login credentials even with bank staff.</li>
        <li>Change password if you feel suspicious activity.</li>
        <li>Report issues to <a href="mailto:support@onlinebanking.com">support@onlinebanking.com</a></li>
      </ul>
    </div>
  </div>
</section>

<!-- Footer Image -->
<div class="footer-img">
  <img src="image/payments.jpg" alt="Secure Transactions">
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
