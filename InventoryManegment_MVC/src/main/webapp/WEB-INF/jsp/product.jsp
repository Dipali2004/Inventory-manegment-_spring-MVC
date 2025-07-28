<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        .form-container input[type="number"],
        .form-container select,
        .form-container input[type="submit"] {
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
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Product</h2>

    <form action="/saveProduct" id="registerForm" method="post">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required />

        <label for="category">Category:</label>
        <input type="text" id="category" name="category" required />

        <label for="supplierID">Supplier:</label>
        <select id="supplierId" name="supplierId" required>
            <option value="">-- Select Supplier --</option>
            <c:forEach var="supplier" items="${suppliers}">
                <option value="${supplier.supplierId}">${supplier.name}</option>
            </c:forEach>
        </select>

        <label for="quantityInStock">Quantity in Stock:</label>
        <input type="number" id="quantityInStock" name="quantityInStock" required />

        <label for="reorderLevel">Reorder Level:</label>
        <input type="number" id="reorderLevel" name="reorderLevel" required />

        <label for="pricePerUnit">Price per Unit:</label>
        <input type="number" step="0.01" id="pricePerUnit" name="pricePerUnit" required />

        <input type="submit" value="Save Product" />
    </form>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("registerForm");

    form.addEventListener("submit", function (e) {
        const productName = form.productName.value.trim();
        const category = form.category.value.trim();
        const quantityInStock = form.quantityInStock.value.trim();
        const reorderLevel = form.reorderLevel.value.trim();
        const pricePerUnit = form.pricePerUnit.value.trim();

        // Regex for only alphabets and spaces
        const nameRegex = /^[A-Za-z ]+$/;

        let errorMessages = [];

        if (!nameRegex.test(productName)) {
            errorMessages.push("Product Name must contain only letters and spaces.");
        }

        if (!nameRegex.test(category)) {
            errorMessages.push("Category must contain only letters and spaces.");
        }

        if (quantityInStock < 0) {
            errorMessages.push("Quantity in Stock cannot be negative.");
        }

        if (reorderLevel < 0) {
            errorMessages.push("Reorder Level cannot be negative.");
        }

        if (pricePerUnit <= 0) {
            errorMessages.push("Price per Unit must be greater than 0.");
        }

        if (errorMessages.length > 0) {
            e.preventDefault(); // Prevent form submission
            alert(errorMessages.join("\n")); // Show errors
        }
    });
});
</script>

</body>
</html>
