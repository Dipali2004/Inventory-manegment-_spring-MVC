<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Stock Out (Sales Entry)</title>
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

        .form-group {
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
            color: #444444;
            font-weight: 500;
        }

        .form-container select,
        .form-container input[type="number"],
        .form-container input[type="text"],
        .form-container input[type="date"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #cccccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 15px;
        }

        .form-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #218838;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                margin: 20px;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Stock Out (Sales Entry)</h2>

    <form action="/saveStockOut" id="stockOutForm" method="post">

        <!-- Product Dropdown -->
        <div class="form-group">
            <label for="productId">Select Product:</label>
            <select id="productId" name="productId" required>
                <option value="">-- Select Product --</option>
                <c:forEach var="product" items="${products}">
                    <option value="${product.productId}">${product.productName}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Quantity Sold -->
        <div class="form-group">
            <label for="quantitySold">Quantity Sold:</label>
            <input type="number" id="quantitySold" name="quantitySold" required min="1" />
        </div>

        <!-- Customer Name -->
        <div class="form-group">
            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" placeholder="Enter customer name" />
        </div>

        <!-- Sale Date -->
        <div class="form-group">
            <label for="saleDate">Sale Date:</label>
          <input type="datetime-local" id="saleDate" name="saleDate" required />



        </div>

        <input type="submit" value="Save Stock Out" />
    </form>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("stockOutForm");

    form.addEventListener("submit", function (e) {
        const quantitySold = parseInt(form.quantitySold.value.trim(), 10);

        let errorMessages = [];

        if (isNaN(quantitySold) || quantitySold <= 0) {
            errorMessages.push("Quantity Sold must be greater than 0.");
        }

        if (!form.productId.value) {
            errorMessages.push("Please select a product.");
        }

        if (errorMessages.length > 0) {
            e.preventDefault();
            alert(errorMessages.join("\n"));
        }
    });
});
</script>

</body>
</html>
