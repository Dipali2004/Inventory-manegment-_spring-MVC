<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Secure Portal</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background:
		url('/resources/assets/images/login-images/woocommerce-inventory-management.jpg');
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column; /* Added for vertical alignment */
}

h1 {
	color: black;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
	margin-bottom: 20px; /* Space below heading */
	font-size: 3rem;
	font-family: 'Playfair Display', serif;
}

.login-container {
	background: rgba(255, 255, 255, 0.2); /* Transparent white background */
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
	/* Stronger shadow for better visibility */
	max-width: 400px;
	width: 100%;
	border: 1px solid #ffffff; /* White border for clear separation */
	backdrop-filter: blur(8px); /* Frosted glass effect */
}

label {
	color: black; /* Dark color for better contrast */
	font-weight: 600; /* Bold text for emphasis */
	font-size: 18px; /* Bigger size for better visibility */
	text-transform: capitalize;
	/* Capitalizes first letter for a clean look */
}

.form-control {
	border-radius: 8px;
}

.btn-login {
	width: 50%; /* Maintain desired button size */
	background-color: #007bff;
	color: white;
	border-radius: 8px;
	padding: 10px;
	font-size: 16px;
	transition: background-color 0.3s;
	border: none;
	display: block; /* Converts button to block element */
	margin: 0 auto; /* Centers the button horizontally */
}
a{
margin: 0 auto;
border-radius: 8px;
	padding: 50px;
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
<body>
	<h1> INVENTORY MANAGEMENT SYSTEM </h1>
	<!-- Heading moved here -->

 <div class="login-container">
		<h3 class="text-center">Login</h3>

		<%
		String errorMsg = (String) request.getAttribute("errormsg");
		if (errorMsg != null) {
		%>
		<p class="error-message"><%=errorMsg%></p>
		<%
		}
		%>

		<form action="/h" method="POST">
			<div class="mb-3">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="email"
					placeholder="Enter your email" required>
			</div>

			<div class="mb-3">
				<label for="pass" class="form-label">Password</label> <input
					type="password" class="form-control" id="pass" name="pass"
					placeholder="Enter your password" required>
			</div>

			<div class="mb-3">
				<label for="role" class="form-label">Select Role</label> <select
					class="form-control" id="role" name="role" required>
					<option value="">Select Role</option>
					<option value="admin">Admin</option>
					<option value="user">User</option>
				</select>
			</div>

			<button type="submit" class="btn btn-login">Login</button>
			<a href="signup">signUp</a>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>
