<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="module/header.jsp" />

<title>Product List</title>

<style>
    .main-content {
        padding: 20px;
        margin-left: 250px; /* Adjust according to your sidebar width */
        background-color: #f9f9f9;
        min-height: 100vh;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .scroll-container {
        overflow-x: auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        min-width: 1000px;
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
        padding: 6px 12px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
    }

    a.delete-button {
        background-color: #f44336;
    }

    a:hover {
        opacity: 0.85;
    }

    /* Optional scrollbar style */
    .scroll-container::-webkit-scrollbar {
        height: 8px;
    }

    .scroll-container::-webkit-scrollbar-thumb {
        background: #bbb;
        border-radius: 4px;
    }
</style>

<div class="main-content">
    <h2>Product List</h2>

    <div class="scroll-container">
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
                            <a href="/product/delete/${product.productId}" class="button delete-button"
                               onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="module/footer.jsp" />
