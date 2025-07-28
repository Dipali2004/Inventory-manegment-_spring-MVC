<jsp:include page="module/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <title>Add Purchase (Stock In)</title>
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

        .form-container input[type="number"],
        .form-container input[type="date"],
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
            background-color: #28a745;
            color: #ffffff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add Purchase (Stock In)</h2>

    <form action="/purchaseSave" method="post" id="purchaseForm">
        <label for="productId">Select Product:</label>
        <select name="productId" id="productId" required>
            <option value="">-- Select Product --</option>
            <c:forEach var="product" items="${products}">
                <option value="${product.productId}">${product.productName}</option>
            </c:forEach>
        </select>

        <label for="supplierID">Supplier:</label>
        <select id="supplierId" name="supplierId" required>
            <option value="">-- Select Supplier --</option>
            <c:forEach var="supplier" items="${suppliers}">
                <option value="${supplier.supplierId}">${supplier.name}</option>
            </c:forEach>
        </select>

        <label for="quantityPurchased">Quantity Purchased:</label>
        <input type="number" name="quantityPurchased" id="quantityPurchased" required min="1" />

        <label for="purchaseDate">Purchase Date:</label>
        <input type="date" name="purchaseDate" id="purchaseDate" required />

        <input type="submit" value="Save Purchase" />
    </form>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("purchaseForm");

    form.addEventListener("submit", function (e) {
        const productId = form.productId.value;
        const supplierId = form.supplierId.value;
        const quantity = form.quantityPurchased.value.trim();
        const purchaseDate = form.purchaseDate.value;

        let errors = [];

        if (!productId) {
            errors.push("Please select a product.");
        }

        if (!supplierId) {
            errors.push("Please select a supplier.");
        }

        if (quantity <= 0) {
            errors.push("Quantity must be greater than 0.");
        }

        if (!purchaseDate) {
            errors.push("Please select a purchase date.");
        }

        if (errors.length > 0) {
            e.preventDefault(); // Stop submission
            alert(errors.join("\n"));
        }
    });
});
</script>

  <jsp:include page="module/footer.jsp" />