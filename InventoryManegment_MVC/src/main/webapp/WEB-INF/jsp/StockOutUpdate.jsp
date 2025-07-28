<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.form-container select, .form-container input[type="number"],
	.form-container input[type="text"], .form-container input[type="datetime-local"]
	{
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

#errorMessages {
	color: red;
	margin-bottom: 15px;
	font-size: 14px;
}

@media ( max-width : 600px) {
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

		<div id="errorMessages"></div>

		<form action="<c:url value='/saveStockOut'/>" id="stockOutForm"
			method="post">
			<input type="hidden" name="stockOutId" value="${data.stockOutId}" />

			<!-- Product Dropdown -->
			<div class="form-group">
				<label for="productName">Product Name:</label> <input type="hidden"
					name="productId" value="${data.productId}" /> <input type="text"
					id="productName" name="productName" value="${data.productName}"
					required />
			</div>

			<!-- Quantity Sold -->
			<div class="form-group">
				<label for="quantitySold">Quantity Sold:</label> <input
					type="number" id="quantitySold" name="quantitySold"
					value="${data.quantitySold}" required min="1" />
			</div>

			<!-- Customer Name -->
			<div class="form-group">
				<label for="customerName">Customer Name:</label> <input type="text"
					id="customerName" name="customerName" value="${data.customerName}"
					placeholder="Enter customer name" required maxlength="50" />
			</div>

			<!-- Sale Date -->
			<div class="form-group">
				<label for="saleDate">Sale Date:</label> <input
					type="datetime-local" id="saleDate" name="saleDate"
					value="${data.saleDate}" required />
			</div>

			<input type="submit" value="Save Stock Out" />
		</form>
	</div>

	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							const form = document
									.getElementById("stockOutForm");
							const errorDiv = document
									.getElementById("errorMessages");
							const quantityInput = document
									.getElementById("quantitySold");
							const productSelect = document
									.getElementById("productId");

							form
									.addEventListener(
											"submit",
											function(e) {
												errorDiv.innerHTML = ""; // Clear errors
												const selectedOption = productSelect.options[productSelect.selectedIndex];
												const availableStock = parseInt(
														selectedOption
																.getAttribute("data-stock"),
														10);
												const quantitySold = parseInt(
														quantityInput.value
																.trim(), 10);

												let errors = [];

												if (!productSelect.value) {
													errors
															.push("Please select a product.");
												}

												if (isNaN(quantitySold)
														|| quantitySold <= 0) {
													errors
															.push("Quantity Sold must be greater than 0.");
												}

												if (availableStock
														&& quantitySold > availableStock) {
													errors
															.push(`Only ${availableStock} items available in stock.`);
												}

												if (errors.length > 0) {
													e.preventDefault();
													errorDiv.innerHTML = errors
															.join("<br>");
												}
											});
						});
	</script>

</body>
</html>
