<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="module/header.jsp" />

<title>Stock Out List</title>

<style>
    /* ===== Main Content ===== */
    .main-content {
        padding: 20px;
        margin-left: 250px; /* Sidebar width adjust */
        background-color: #f9f9f9;
        min-height: 100vh;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    /* ===== Scroll Container ===== */
    .scroll-container {
        overflow-x: auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    /* ===== Table Styling ===== */
    table {
        width: 100%;
        border-collapse: collapse;
        min-width: 800px;
    }

    th, td {
        border: 1px solid #999;
        padding: 10px;
        text-align: center;
        font-size: 14px;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    /* ===== Action Buttons ===== */
    a.button {
        padding: 6px 12px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 13px;
    }

    a.delete-button {
        background-color: #f44336;
    }

    a:hover {
        opacity: 0.85;
    }

    /* ===== Scrollbar Customization ===== */
    .scroll-container::-webkit-scrollbar {
        height: 8px;
    }

    .scroll-container::-webkit-scrollbar-thumb {
        background: #bbb;
        border-radius: 4px;
    }
</style>

<div class="main-content">
    <h2>Stock Out List</h2>

    <div class="scroll-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Quantity Sold</th>
                    <th>Sale Date</th>
                    <th>Customer Name</th>
                    <th>Created By</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="stockOut" items="${stockOutList}">
                    <tr>
                        <td>${stockOut.stockOutId}</td>
                        <td>${stockOut.productName}</td>
                        <td>${stockOut.quantitySold}</td>
                        <td>${stockOut.saleDate}</td>
                        <td>${stockOut.customerName}</td>
                        <td>${stockOut.createdByName}</td>
                        <td>
                            <a href="updateStock?id=${stockOut.stockOutId}" class="button">Update</a>
                            <a href="/stock/delete/${stockOut.stockOutId}" class="button delete-button"
                               onclick="return confirm('Are you sure to delete?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="module/footer.jsp" />
