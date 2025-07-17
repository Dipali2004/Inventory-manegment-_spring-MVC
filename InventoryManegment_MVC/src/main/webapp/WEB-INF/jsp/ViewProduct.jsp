<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <style>
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #999;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        a.button {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a.delete-button {
            background-color: #f44336;
        }

        a:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>

    <h2 style="text-align:center;">Product List</h2>

    <table>
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Supplier ID</th>
                <th>Supplier Name</th>
                <th>Quantity In Stock</th>
                <th>Reorder Level</th>
                <th>Price Per Unit</th>
                <th>User</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
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
                    <td>
                       <a href="updatedata?id=${product.productId}" class="button">Update</a>
                        <a href="/product/delete/${product.productId}" class="button delete-button" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
