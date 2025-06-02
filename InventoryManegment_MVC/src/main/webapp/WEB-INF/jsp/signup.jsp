<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Login - Secure Portal</title>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
/>
<style>
  body {
    background: url('https://plus.unsplash.com/premium_photo-1681426710520-7c56c9f563d2?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW52ZW50b3J5JTIwbWFuYWdlbWVudHxlbnwwfHwwfHx8MA%3D%3D') no-repeat center center;
    background-size: cover;
  }

  h1 {
    color: white;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
    margin-bottom: 20px;
    font-size: 2.5rem;
    font-family: 'Playfair Display', serif;
    text-align: center;
  }

  .login-container {
    background: rgba(255, 255, 255, 0.9); /* white, almost opaque */
    padding: 15px 20px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
    max-width: 400px;
    width: 100%;
    border: 1px solid #ffffff;
    backdrop-filter: blur(8px);
  }

  .login-container {
    max-height: 600px;
    overflow-y: auto;
  }

  form .mb-3 {
    margin-bottom: 10px;
  }

  label {
    color: black;
    font-weight: 600;
    font-size: 16px;
    text-transform: capitalize;
  }

  /* Underline input style with white background */
  .underline-input {
    border: none;
    border-bottom: 2px solid black;
    border-radius: 0;
    background: white;
    padding-left: 0;
    padding-right: 0;
    box-shadow: none;
    transition: border-color 0.3s;
    font-size: 16px;
    height: 38px;
  }

  .underline-input:focus {
    outline: none;
    border-bottom-color: #0056b3;
    box-shadow: 0 2px 0 0 #0056b3;
    background: white;
  }

  /* For select underline styling */
  select.underline-input {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background-image:
      linear-gradient(45deg, transparent 50%, black 50%),
      linear-gradient(135deg, black 50%, transparent 50%);
    background-position:
      calc(100% - 20px) calc(1em + 2px),
      calc(100% - 15px) calc(1em + 2px);
    background-size: 5px 5px;
    background-repeat: no-repeat;
    padding-right: 30px;
  }

  .btn-login {
    width: 50%;
    background-color: #007bff;
    color: white;
    border-radius: 8px;
    padding: 8px 12px;
    font-size: 14px;
    transition: background-color 0.3s;
    border: none;
    display: block;
    margin: 10px auto 0;
  }

  .btn-login:hover {
    background-color: #0056b3;
  }

  .error-message {
    color: red;
    font-size: 14px;
    text-align: center;
    margin-bottom: 10px;
  }
</style>
</head>

<body
  class="d-flex flex-column justify-content-center align-items-center vh-100"
>
 

  <div class="login-container">
    <h3 class="text-center">Register</h3>

    <% 
      String errorMsg = (String) request.getAttribute("errormsg");
      if (errorMsg != null) { 
    %>
      <p class="error-message"><%=errorMsg%></p>
    <% } %>

    <form action="singup" method="POST">
      <div class="mb-3">
        <input
          type="text"
          class="form-control underline-input"
          id="username"
          name="username"
          placeholder="Enter your username"
          required
        />
      </div>

      <div class="mb-3">
        <input
          type="text"
          class="form-control underline-input"
          id="fullName"
          name="fullName"
          placeholder="Enter your full name"
          required
        />
      </div>

      <div class="mb-3">
        <input
          type="email"
          class="form-control underline-input"
          id="email"
          name="email"
          placeholder="Enter your email"
          required
        />
      </div>

      <div class="mb-3">
        <input
          type="text"
          class="form-control underline-input"
          id="phone"
          name="phone"
          placeholder="Enter your phone number"
        />
      </div>

      <div class="mb-3">
        <input
          type="password"
          class="form-control underline-input"
          id="pass"
          name="pass"
          placeholder="Enter your password"
          required
        />
      </div>

      <div class="mb-3">
        <input
          type="password"
          class="form-control underline-input"
          id="confirmPass"
          name="confirmPass"
          placeholder="Confirm your password"
          required
        />
      </div>

      <div class="mb-3">
        <select
          class="form-control underline-input"
          id="role"
          name="role"
          required
        >
          <option value="">Select Role</option>
          <option value="admin">Admin</option>
          <option value="user">User</option>
        </select>
      </div>

      <button type="submit" class="btn-login">Register</button>
    </form>
  </div>

  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
  ></script>
</body>
</html>
