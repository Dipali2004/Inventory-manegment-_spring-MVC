<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="module/header.jsp" />

<title>Product Stock Report</title>

<style>
    .main-content {
        padding: 20px;
        margin-left: 250px; /* Adjust if sidebar width differs */
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
        min-width: 800px;
    }

    th, td {
        border: 1px solid #999;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }

    /* Color highlight for Low Stock status */
    .low-stock {
        color: #d9534f;
        font-weight: bold;
    }

    .ok-stock {
        color: #5cb85c;
        font-weight: bold;
    }

    /* Optional scrollbar styling */
    .scroll-container::-webkit-scrollbar {
        height: 8px;
    }

    .scroll-container::-webkit-scrollbar-thumb {
        background: #bbb;
        border-radius: 4px;
    }
</style>

<div class="main-content">
    <h2>Product Stock Report</h2>

    <div class="scroll-container">
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Quantity In Stock</th>
                    <th>Reorder Level</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="report" items="${productReportList}">
                    <tr>
                        <td>${report.productId}</td>
                        <td>${report.productName}</td>
                        <td>${report.category}</td>
                        <td>${report.quantityInStock}</td>
                        <td>${report.reorderLevel}</td>
                        <td>
                            <span class="${report.status == 'Low Stock' ? 'low-stock' : 'ok-stock'}">
                                ${report.status}
                            </span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="module/footer.jsp" />
