<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Product Management</title>
    <style>
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        table, th, td {
            border: 1px solid #555;
            padding: 8px;
            text-align: center;
        }
        th {
            background: #333;
            color: white;
        }
        a {
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
        }
        .delete-btn {
            background: red;
            color: white;
        }
        .restore-btn {
            background: green;
            color: white;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Product Management - Soft Delete Example</h2>

    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Supplier ID</th>
            <th>Supplier Name</th>
            <th>Quantity In Stock</th>
            <th>Reorder Level</th>
            <th>Price Per Unit</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <tr th:each="product : ${products}">
            <td th:text="${product.productId}"></td>
            <td th:text="${product.productName}"></td>
            <td th:text="${product.category}"></td>
            <td th:text="${product.supplierId}"></td>
            <td th:text="${product.supplierName}"></td>
            <td th:text="${product.quantityInStock}"></td>
            <td th:text="${product.reorderLevel}"></td>
            <td th:text="${product.pricePerUnit}"></td>
            <td th:text="${product.status}"></td>
            <td>
                <a th:if="${product.status == 'ACTIVE'}"
                   th:href="@{/products/delete/{id}(id=${product.productId})}" 
                   class="delete-btn">Deactivate</a>

                <a th:if="${product.status == 'INACTIVE'}"
                   th:href="@{/products/restore/{id}(id=${product.productId})}" 
                   class="restore-btn">Restore</a>
            </td>
        </tr>
    </table>
</body>
</html>
