 <jsp:include page="module/header.jsp" />
  <title>Register - Secure Portal</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <style>
    body {
      background: url('https://source.unsplash.com/1600x900/?technology,abstract') no-repeat center center;
      background-size: cover;
      height: 100vh;
	 margin-top:4%;
      margin-left:30%;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.95);
      padding: 30px 25px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
       max-width: 700px; 
      width: 70vw !important;
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
    <h3>Add Maneger</h3>

    <% 
      String errorMsg = (String) request.getAttribute("errormsg");
      if (errorMsg != null) { 
    %>
      <p class="error-message"><%= errorMsg %></p>
    <% } %>

   <form action="add_maneger" method="POST">
  <!-- Row 1: Full Name + Email -->
  <div class="row mb-3">
    <div class="col-md-6">
      <input type="text" class="form-control underline-input" name="fullName" placeholder="Full Name" required />
    </div>
    <div class="col-md-6">
      <input type="email" class="form-control underline-input" name="email" placeholder="Email Address" required />
    </div>
  </div>

  <!-- Row 2: Phone + Password -->
  <div class="row mb-3">
    <div class="col-md-6">
      <input type="tel" class="form-control underline-input" name="phone" placeholder="Phone Number"  required />
    </div>
    <div class="col-md-6">
      <input type="password" class="form-control underline-input" name="password" placeholder="Password" required />
    </div>
  </div>

 <div class="row mb-3">
    <div class="col-md-6">
    <select class="form-control underline-input" name="role" required>
      <option value="">Select Role</option>
      <option value="admin">Admin</option>
      <option value="manager">Manager</option>
      <option value="staff">Staff</option>
    </select>
  </div>
    <div class="col-md-6">
      <input type="address" class="form-control underline-input" name="address" placeholder="Address" required />
    </div>
  </div>

  <!-- Row 3: Role (full width) -->

  <!-- Row 4: Buttons - Submit, Update, Remove -->
  <div class="row">
    <div class="col-md-4">
      <button type="submit" class="btn btn-success w-100">Submit</button>
    </div>
    <div class="col-md-4">
  <a href="update" class="btn btn-warning w-100">Update</a>
</div>

    <div class="col-md-4">
      <button type="submit" class="btn btn-danger w-100">Remove</button>
    </div>
  </div>
</form>

  </div>

  <jsp:include page="module/footer.jsp" />

