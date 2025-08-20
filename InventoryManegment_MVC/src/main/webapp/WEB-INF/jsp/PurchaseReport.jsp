<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="module/header.jsp" />

<title>Search Purchases</title>

<style>
    .main-content {
        padding: 20px;
        margin-left: 250px;
        background-color: #f9f9f9;
        min-height: 100vh;
    }
    h2 { text-align: center; margin-bottom: 20px; }
    form {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-bottom: 20px;
    }
    label { margin-right: 5px; font-weight: bold; }
    input[type="text"], input[type="date"], select {
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    button {
        padding: 5px 12px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    button[type="button"] { background-color: #2196F3; }
    button:hover { opacity: 0.85; }
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
    th { background-color: #f2f2f2; }
    .scroll-container::-webkit-scrollbar { height: 8px; }
    .scroll-container::-webkit-scrollbar-thumb { background: #bbb; border-radius: 4px; }
</style>

<div class="main-content">
    <h2>Search Purchases</h2>

    <!-- Search Form (AJAX) -->
    <form id="filterForm" onsubmit="return false;">
        <div>
            <label for="date">Date:</label>
            <input type="date" id="dateFilter">
        </div>
        <div>
            <label for="supplier">Supplier:</label>
            <select id="supplierId" name="supplierId">
                <option value="">-- Select Supplier --</option>
                <c:forEach var="supplier" items="${suppliers}">
                    <option value="${supplier.supplierId}">${supplier.name}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <button type="button" id="searchBtn">Search</button>
            <button type="button" id="showAllBtn">Show All</button>
        </div>
    </form>

    <!-- Table Results -->
    <div class="scroll-container">
        <table>
            <thead>
                <tr>
                    <th>Purchase ID</th>
                    <th>Supplier</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Date</th>
                    <th>status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${purchase}">
                    <tr>
                        <td>${p.purchaseId}</td>
                        <td>${p.supplier.name}</td>
                        <td>${p.product.productName}</td>
                        <td>${p.quantityPurchased}</td>
                        <td>${p.purchaseDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- jQuery for AJAX -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    $("#searchBtn").click(function () {
        let date = $("#dateFilter").val();
        let supplierName = $("#supplierId option:selected").text(); 

        if (supplierName === "-- Select Supplier --") {
            supplierName = "";
        }

        $.ajax({
            url: "http://localhost:8085/report/filterPurchase",
            type: "GET",
            dataType: "json",
            data: {
                date: date,
                supplier: supplierName  
            },
            success: function (data) {
                console.log("Response Data:", data);

                let tableBody = $("table tbody");
                tableBody.empty();

                if (!data || data.length === 0) {
                    tableBody.append("<tr><td colspan='6'>No data found</td></tr>");
                } else {
                    data.forEach(p => {
                        tableBody.append(`
                            <tr>
                                <td>\${p.productId}</td>
                                <td>\${p.productName}</td>
                                <td>\${p.category}</td>
                                <td>\${p.quantityInStock}</td>
                                <td>\${p.reorderLevel}</td>
                                <td>\${p.status}</td>
                            </tr>
                        `);
                    });
                }
            },
            error: function (xhr, status, error) {
                console.log("Error Status:", status);
                console.log("Error Details:", error);
                console.log("Response:", xhr.responseText);
                alert("Error fetching data");
            }
        });
    });

    $("#showAllBtn").click(function () {
        $("#dateFilter").val("");
        $("#supplierId").val("");
        $("#searchBtn").click();
    });
});



</script>


<jsp:include page="module/footer.jsp" />


