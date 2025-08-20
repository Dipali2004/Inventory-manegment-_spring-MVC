<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="module/header.jsp" />
<!--start page wrapper -->
		<div class="page-wrapper">
			<div class="page-content">
    <title>Add New Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow-sm w-50">
        <div class="card-body">
            <h2 class="text-center mb-4">Add New Product</h2>

            <form action="/saveProduct" id="registerForm" method="post">
                <div class="mb-3">
                    <label for="productName" class="form-label">Product Name:</label>
                    <input type="text" id="productName" name="productName" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label for="category" class="form-label">Category:</label>
                    <input type="text" id="category" name="category" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label for="supplierID" class="form-label">Supplier:</label>
                    <select id="supplierId" name="supplierId" class="form-select" required>
                        <option value="">-- Select Supplier --</option>
                        <c:forEach var="supplier" items="${suppliers}">
                            <option value="${supplier.supplierId}">${supplier.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="quantityInStock" class="form-label">Quantity in Stock:</label>
                    <input type="number" id="quantityInStock" name="quantityInStock" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label for="reorderLevel" class="form-label">Reorder Level:</label>
                    <input type="number" id="reorderLevel" name="reorderLevel" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label for="pricePerUnit" class="form-label">Price per Unit:</label>
                    <input type="number" step="0.01" id="pricePerUnit" name="pricePerUnit" class="form-control" required />
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Save Product</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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

</div>
</div>

<jsp:include page="module/footer.jsp" />

