<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Supplier</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            color: #444;
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            font-size: 13px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Supplier</h2>

    <form action="/supplierform" method="post" onsubmit="return validateForm();">

        <label>Supplier Name:</label>
        <input type="text" name="name" id="name" required />
        <div id="nameError" class="error"></div>

        <label>Contact Info:</label>
        <input type="text" name="contactInfo" id="contactInfo" />
        <div id="contactError" class="error"></div>

        <label>Address:</label>
        <input type="text" name="address" id="address" />
        <div id="addressError" class="error"></div>

        <input type="submit" value="Save Supplier" />
    </form>
</div>

<script>
    function validateForm() {
        const name = document.getElementById("name").value.trim();
        const contactInfo = document.getElementById("contactInfo").value.trim();
        const address = document.getElementById("address").value.trim();

        let isValid = true;

        // Clear previous errors
        document.getElementById("nameError").textContent = "";
        document.getElementById("contactError").textContent = "";
        document.getElementById("addressError").textContent = "";

        // Name: Only characters
        const nameRegex = /^[A-Za-z\s]+$/;
        if (!nameRegex.test(name)) {
            document.getElementById("nameError").textContent = "Name must contain only letters.";
            isValid = false;
        }

        // Contact Info: Optional, but if entered, must be valid phone number or email
        if (contactInfo !== "") {
            const phoneRegex = /^[0-9]{10}$/;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!phoneRegex.test(contactInfo) && !emailRegex.test(contactInfo)) {
                document.getElementById("contactError").textContent = "Enter a valid 10-digit phone or email.";
                isValid = false;
            }
        }

        // Address: Allow letters, numbers, commas, periods, and spaces
        const addressRegex = /^[A-Za-z0-9\s,.-]{5,}$/;
        if (address !== "" && !addressRegex.test(address)) {
            document.getElementById("addressError").textContent = "Address must be at least 5 characters.";
            isValid = false;
        }

        return isValid;
    }
</script>

</body>
</html>
