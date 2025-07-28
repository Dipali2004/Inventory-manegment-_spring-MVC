<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Registration Form</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f6f8;
      margin: 0;
      padding: 0;
    }

    .form-container {
      max-width: 500px;
      margin: 50px auto;
      padding: 30px 40px;
      background-color: #ffffff;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      border-radius: 12px;
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #333333;
      font-size: 24px;
    }

    .form-container label {
      display: block;
      margin-bottom: 8px;
      color: #444444;
      font-weight: 500;
    }

    .form-container input[type="text"],
    .form-container input[type="email"],
    .form-container input[type="password"],
    .form-container input[type="submit"],
    .form-container select,
    .form-container textarea {
      width: 100%;
      padding: 10px 12px;
      margin-bottom: 20px;
      border: 1px solid #cccccc;
      border-radius: 8px;
      box-sizing: border-box;
      font-size: 15px;
    }

    .form-container input[type="submit"] {
      background-color: #007bff;
      color: #ffffff;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
      background-color: #0069d9;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>Registration Form</h2>

  <form id="registerForm" action="/submitForm" method="post">
    <label for="fullName">Full Name:</label>
    <input type="text" id="fullName" name="fullName" required />

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required />

    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" required />

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required />

    <label for="role">Role:</label>
    <select id="role" name="role" required>
      <option value="">Select Role</option>
      <option value="admin">Admin</option>
      <option value="user">User</option>
    </select>

    <label for="address">Address:</label>
    <textarea id="address" name="address" required></textarea>

    <input type="submit" value="Submit" />
  </form>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("registerForm");

    form.addEventListener("submit", function (e) {
      const fullname = form.fullName.value.trim();
      const email = form.email.value.trim();
      const phone = form.phone.value.trim();
      const password = form.password.value.trim();
      const role = form.role.value.trim();
      const address = form.address.value.trim();

      let errors = [];

      const nameRegex = /^[a-zA-Z\s]+$/;
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const phoneRegex = /^[0-9]{10}$/;
      const addressRegex = /^[a-zA-Z0-9\s,.-]{5,}$/;

      if (!nameRegex.test(fullname)) {
        errors.push("Full Name must contain only letters and spaces.");
      }

      if (!emailRegex.test(email)) {
        errors.push("Please enter a valid email address.");
      }

      if (!phoneRegex.test(phone)) {
        errors.push("Phone number must be exactly 10 digits.");
      }

      if (password.length < 6) {
        errors.push("Password must be at least 6 characters long.");
      }

      if (!addressRegex.test(address)) {
        errors.push("Address must be at least 5 characters and valid format.");
      }

      if (role === "") {
        errors.push("Please select a role.");
      }

      if (errors.length > 0) {
        e.preventDefault(); // Stop form submission
        alert(errors.join("\n"));
      }
    });
  });
</script>

</body>
</html>
