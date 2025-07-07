<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Register</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background: linear-gradient(to right, #dceefb, #f3f8fc);
      font-family: 'Segoe UI', sans-serif;
    }
    .register-container {
      max-width: 800px;
      margin: auto;
      margin-top: 50px;
      background-color: #ffffff;
      border-radius: 15px;
      padding: 40px;
      box-shadow: 0 0 25px rgba(0,0,0,0.1);
    }
    .register-header {
      text-align: center;
      margin-bottom: 30px;
    }
    .register-header img {
      width: 70px;
    }
    .register-header h2 {
      font-weight: bold;
      margin-top: 15px;
      color: #0072ce;
    }
    .step-indicator {
      display: flex;
      justify-content: space-between;
      margin-bottom: 30px;
    }
    .step {
      text-align: center;
      flex: 1;
      color: #0072ce;
      font-weight: 500;
    }
    .step span {
      display: inline-block;
      background-color: #0072ce;
      color: white;
      width: 32px;
      height: 32px;
      line-height: 32px;
      border-radius: 50%;
      font-weight: bold;
    }
    label span {
      color: red;
    }
    .btn-register {
      background-color: #0072ce;
      color: white;
      font-weight: 500;
    }
    .btn-register:hover {
      background-color: #0058a3;
    }
    .form-section {
      padding-top: 10px;
    }
    .modal-body {
      max-height: 400px;
      overflow-y: auto;
    }
  </style>
</head>
<body>

<div class="register-container">
  <div class="register-header">
    <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="Icon">
    <h2>Customer Registration</h2>
  </div>

  <!-- Step Indicator -->
  <div class="step-indicator mb-4">
    <div class="step">
      <span>1</span><br>Details
    </div>
    <div class="step">
      <span>2</span><br>Login Info
    </div>
    <div class="step">
      <span>3</span><br>Confirmation
    </div>
  </div>

  <!-- Registration Form -->
  <form method="post" action="customer-register" id="registerForm">
    <div class="row g-4 text-start">
      <div class="col-md-6">
        <label>First Name <span>*</span></label>
        <input type="text" name="firstName" class="form-control" placeholder="Enter first name" required>
      </div>
      <div class="col-md-6">
        <label>Last Name <span>*</span></label>
        <input type="text" name="lastName" class="form-control" placeholder="Enter last name" required>
      </div>

      <div class="col-md-6">
        <label>Date of Birth <span>*</span></label>
        <input type="date" name="dob" class="form-control" required>
      </div>
      <div class="col-md-6">
        <label>Mobile No. <span>*</span></label>
        <input type="tel" name="phone" class="form-control" placeholder="Enter phone number" required>
      </div>

      <div class="col-md-6">
        <label>Email ID <span>*</span></label>
        <input type="email" name="email" class="form-control" placeholder="Enter email" required>
      </div>
      <div class="col-md-6">
        <label>Gender <span>*</span></label>
        <select name="gender" class="form-select" required>
          <option value="">Select Gender</option>
          <option>Male</option>
          <option>Female</option>
          <option>Other</option>
        </select>
      </div>

      <div class="col-md-6">
        <label>Branch <span>*</span></label>
        <select name="branch" class="form-select" required>
          <option value="">Select Branch</option>
          <option>Delhi</option>
          <option>Mumbai</option>
          <option>Bangalore</option>
        </select>
      </div>
      <div class="col-md-6">
        <label>Password <span>*</span></label>
        <input type="password" name="password" class="form-control" placeholder="Enter password" required>
      </div>

      <div class="col-md-6">
        <label>Permanent Address <span>*</span></label>
        <textarea name="permanentAddress" class="form-control" rows="3" placeholder="Enter permanent address" required></textarea>
      </div>
      <div class="col-md-6">
        <label>Present Address <span>*</span></label>
        <textarea name="presentAddress" class="form-control" rows="3" placeholder="Enter present address" required></textarea>
      </div>

      <div class="col-12">
        <button type="button" class="btn btn-register w-100" data-bs-toggle="modal" data-bs-target="#termsModal">
          Register Customer
        </button>
      </div>

      <div class="text-center mt-3">
        <p>Already have an account? <a href="customer-login.jsp">Login here</a></p>
      </div>
    </div>
  </form>
</div>

<!-- Terms Modal -->
<div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="termsModalLabel">Online NetBanking Terms</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <ul>
          <li>Account must be active.</li>
          <li>Mobile & Email should be registered with bank.</li>
          <li>Debit/Credit Card should be active.</li>
          <li>Joint accounts should be Either/Former/Anyone or Survivor.</li>
        </ul>
        <p><strong>Note:</strong></p>
        <ul>
          <li>Only eligible accounts will be linked if registered via Debit Card.</li>
          <li>Visit <a href="https://www.onlinebankingsystem.in" target="_blank">onlinebankingsystem.in</a> for full terms.</li>
        </ul>

        <div class="form-check mt-3">
          <input class="form-check-input" type="checkbox" id="agreeTerms">
          <label class="form-check-label" for="agreeTerms">
            I agree to <a href="#">Terms & Conditions</a>
          </label>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary" onclick="submitIfAgreed()">Proceed</button>
      </div>

    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- JS Validation -->
<script>
  function submitIfAgreed() {
    const checkbox = document.getElementById("agreeTerms");
    if (checkbox.checked) {
      document.getElementById("registerForm").submit();
    } else {
      alert("⚠ Please agree to Terms & Conditions to proceed.");
    }
  }
</script>

</body>
</html>
