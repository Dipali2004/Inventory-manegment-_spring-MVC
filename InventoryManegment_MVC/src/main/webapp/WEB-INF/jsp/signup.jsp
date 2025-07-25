<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Register - Secure Portal</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <style>
    body {
      background: url('https://plus.unsplash.com/premium_photo-1681426710520-7c56c9f563d2?fm=jpg&q=60&w=3000') no-repeat center center;
      background-size: cover;
      height: 100vh;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.95);
      padding: 30px 25px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
      max-width: 400px;
      width: 100%;
      border: 1px solid #ccc;
      backdrop-filter: blur(6px);
    }

    h3 {
      text-align: center;
      margin-bottom: 25px;
      font-weight: bold;
      font-size: 28px;
      color: #333;
      font-family: 'Segoe UI', sans-serif;
    }

    .form-control.underline-input {
      border: none;
      border-bottom: 2px solid #333;
      border-radius: 0;
      background: #fff;
      box-shadow: none;
      font-size: 16px;
      padding-left: 0;
      padding-right: 0;
    }

    .form-control.underline-input:focus {
      border-bottom: 2px solid #0d6efd;
      box-shadow: none;
      outline: none;
    }

    select.underline-input {
      background-image:
        linear-gradient(45deg, transparent 50%, black 50%),
        linear-gradient(135deg, black 50%, transparent 50%);
      background-position:
        calc(100% - 20px) calc(1em + 2px),
        calc(100% - 15px) calc(1em + 2px);
      background-size: 5px 5px;
      background-repeat: no-repeat;
      padding-right: 30px;
      appearance: none;
    }

    .btn-login {
      width: 100%;
      background-color: #0d6efd;
      color: white;
      border-radius: 8px;
      padding: 10px;
      font-size: 16px;
      border: none;
      transition: background-color 0.3s;
    }

    .btn-login:hover {
      background-color: #0a58ca;
    }

    .error-message {
      color: red;
      text-align: center;
      font-size: 14px;
      margin-bottom: 15px;
    }

    @media (max-width: 576px) {
      .login-container {
        margin: 0 15px;
        padding: 25px 20px;
      }
    }
  </style>
</head>
<body class="d-flex flex-column justify-content-center align-items-center vh-100">
  <div class="login-container">
    <h3>Register</h3>

    <% 
      String errorMsg = (String) request.getAttribute("errormsg");
      if (errorMsg != null) { 
    %>
      <p class="error-message"><%= errorMsg %></p>
    <% } %>

    <form action="signupPage" method="POST">
      <div class="mb-3">
        <input type="text" class="form-control underline-input" id="fullName" name="fullName" placeholder="Full Name" required />
      </div>

      <div class="mb-3">
        <input type="email" class="form-control underline-input" id="email" name="email" placeholder="Email Address" required />
      </div>

      <div class="mb-3">
        <input type="tel" class="form-control underline-input" id="phone" name="phone" placeholder="Phone Number" pattern="[0-9]{10}" required />
      </div>

      <div class="mb-3">
        <input type="password" class="form-control underline-input" id="password" name="password" placeholder="Password" required />
      </div>

      <div class="mb-3">
        <select class="form-control underline-input" name="role" required>
          <option value="">Select Role</option>
          <option value="admin">Admin</option>
          <option value="manager">Manager</option>
          <option value="staff">Staff</option>
        </select>
      </div>

      <button type="submit" class="btn-login">Register</button>
    </form>
  </div>
</body>
</html>
