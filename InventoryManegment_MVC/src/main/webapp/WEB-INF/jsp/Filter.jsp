<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory Filter</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="p-4">

<h2 class="text-center">Inventory List</h2>

<div class="d-flex mb-3">
    <!-- Filter Dropdown -->
    <select class="form-select w-auto me-2" id="filterType">
        <option value="">Select Here</option>
        <option value="product">Product</option>
        <option value="supplier">Supplier</option>
        <option value="category">Category</option>
    </select>

    <!-- Search Input with datalist -->
    <input type="text" id="name" class="form-control w-50 me-2" placeholder="Enter value" list="suggestions">
    <datalist id="suggestions"></datalist>

    <!-- Apply Button -->
    <button class="btn btn-primary" id="applyFilter">Apply</button>
</div>

<!-- Inventory Table -->
<table class="table table-bordered">
    <thead class="table-dark">
        <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Supplier ID</th>
                    <th>Supplier Name</th>
                    <th>Quantity In Stock</th>
                    <th>Reorder Level</th>
                    <th>Price Per Unit</th>
                   
        </tr>
    </thead>
   <tbody id="inventoryBody">
                <c:forEach var="product" items="${product}">
                    <tr>
                        <td>${product.productId}</td>
                        <td>${product.productName}</td>
                        <td>${product.category}</td>
                        <td>${product.supplierId}</td>
                        <td>${product.supplierName}</td>
                        <td>${product.quantityInStock}</td>
                        <td>${product.reorderLevel}</td>
                        <td>${product.pricePerUnit}</td>
                        <td>${product.user}</td>
                      
                    </tr>
                </c:forEach>
            </tbody>
</table>

<script>
document.getElementById("applyFilter").addEventListener("click", function () {
    let filterType = document.getElementById("filterType").value;
    let name = document.getElementById("name").value;

    if (!filterType) {
        alert("Please select filter type");
        return;
    }

    fetch(
    		  "http://localhost:8085/filter2/filterData?filterType=" +
    		  encodeURIComponent(filterType) +
    		  "&name=" +
    		  encodeURIComponent(name)
    		)

          .then(response => {
        console.log(response); 
        return response.json(); 
    })
        .then(data => {
        	let filteredData = data.filter(product =>
            (filterType === "product" && product.productName.toLowerCase().includes(name.toLowerCase())) ||
            (filterType === "supplier" && product.supplierName.toLowerCase().includes(name.toLowerCase()))
        );

        	 console.log(data); 
            let tableBody = document.querySelector("#inventoryBody");
            tableBody.innerHTML = "";

            data.forEach(product => {
                let row = `<tr>
                	 <td>\${product.productId}</td>
                    <td>\${product.productName}</td>
                    <td>\${product.category}</td>
                    <td>\${product.supplierId}</td>
                    <td>\${product.supplierName}</td>
                    <td>\${product.quantityInStock}</td>
                    <td>\${product.reorderLevel}</td>
                    <td>\${product.pricePerUnit}</td> 
                </tr>`;
                tableBody.innerHTML += row;
            });
        })
        .catch(error => console.error("Error fetching data:", error));
});
</script>

</body>
</html>
