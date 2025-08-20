<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="module/header.jsp" />

<title>Stock Out Report</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f6f8;
        margin: 0;
        padding: 0;
    }

    .main-content {
        padding: 30px;
        margin-left: 250px;
        min-height: 100vh;
    }

    h2 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
        font-size: 28px;
    }

    /* Filter Form */
    .filter-form {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-bottom: 25px;
        position: relative;
        flex-wrap: wrap;
    }

    .filter-form input[type="text"],
    .filter-form input[type="date"] {
        padding: 8px 12px;
        font-size: 14px;
        width: 180px;
        border: 1px solid #ccc;
        border-radius: 4px;
        outline: none;
        transition: border-color 0.3s ease;
    }

    .filter-form input:focus {
        border-color: #3498db;
    }

    .filter-form button {
        background-color: #3498db;
        color: white;
        border: none;
        padding: 8px 15px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: background 0.3s ease;
    }

    .filter-form button[type="button"] {
        background-color: #7f8c8d;
    }

    .filter-form button:hover {
        opacity: 0.9;
    }

    /* Dropdown suggestions */
    .dropdown-suggestions {
        position: absolute;
        top: 35px;
        left: 0;
        background: white;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: 180px;
        max-height: 180px;
        overflow-y: auto;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        display: none;
        z-index: 1000;
    }

    .dropdown-suggestions div {
        padding: 8px 12px;
        cursor: pointer;
        font-size: 14px;
    }

    .dropdown-suggestions div:hover {
        background: #f1f1f1;
    }

    /* Table container */
    .scroll-container {
        overflow-x: auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    /* Table styles */
    table {
        width: 100%;
        border-collapse: collapse;
        min-width: 900px;
    }

    th, td {
        border: 1px solid #e0e0e0;
        padding: 12px;
        text-align: center;
        font-size: 14px;
        color: #34495e;
    }

    th {
        background-color: #ecf0f1;
        font-weight: 600;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    /* Scrollbar customization */
    .scroll-container::-webkit-scrollbar {
        height: 8px;
    }

    .scroll-container::-webkit-scrollbar-thumb {
        background: #bbb;
        border-radius: 4px;
    }
</style>

<div class="main-content">
    <h2>Stock Out Report</h2>

    <!-- Filter Form -->
    <form action="Viewstocks" method="get" class="filter-form">
 <%--        <!-- Start Date -->
        <input type="date" name="startDate" value="${param.startDate}">
        
        <!-- End Date -->
        <input type="date" name="endDate" value="${param.endDate}"> --%>

        <!-- Product Search with Dropdown -->
        <div style="position: relative;">
            <input type="text" id="productSearch" name="productName" placeholder="Search Product" autocomplete="off" value="${param.productName}">
            <div id="suggestions" class="dropdown-suggestions"></div>
        </div>

        <!-- Buttons -->
       <button type="button" id="filterBtn">Filter</button>
        <a href="Viewstocks"><button type="button">Reset</button></a>
    </form>

    <!-- Table -->
    <div class="scroll-container">
        <table>
            <thead>
                <tr>
                    <th>Stock Out ID</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity Sold</th>
                    <th>Sale Date</th>
                    <th>Customer Name</th>
                    <th>Created By (ID)</th>
                    <th>Created By (Name)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="stock" items="${stockOutList}">
                    <tr>
                        <td>${stock.stockOutId}</td>
                        <td>${stock.productId}</td>
                        <td>${stock.productName}</td>
                        <td>${stock.quantitySold}</td>
                        <td>${stock.saleDate}</td>
                        <td>${stock.customerName}</td>
                        <td>${stock.createdBy}</td>
                        <td>${stock.createdByName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="module/footer.jsp" />

<!-- AJAX for dropdown -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$("#productSearch").keyup(function () {
    let keyword = $(this).val().trim();
    console.log("Keyup Triggered, keyword:", keyword);

    if (keyword.length >= 2) {
        $.ajax({
            url: "http://localhost:8085/report/productSearch",
            type: 'GET',
            data: { keyword: keyword },
            success: function (data) {
                console.log("AJAX Success - Response Data:", data);

                let suggestionsDiv = $("#suggestions");
                suggestionsDiv.empty();

                if (data && data.length > 0) {
                    suggestionsDiv.show();

                    $.each(data, function (index, item) {
                       
                        let text = (typeof item === "string") ? item : item.productName;

                        $("<div></div>")
                            .text(text)
                            .addClass("list-group-item")
                            .css({ padding: "8px", cursor: "pointer" })
                            .on("click", function () {
                                $("#productSearch").val(text);
                                suggestionsDiv.hide();
                            })
                            .appendTo(suggestionsDiv);
                    });
                } else {
                    suggestionsDiv.hide();
                }
            },
            error: function (xhr, status, error) {
                console.log("AJAX Error:", xhr.status, xhr.statusText, error);
                $("#suggestions").hide();
            }
        });
    } else {
        $("#suggestions").hide();
    }
});

// report fltering

$("#filterBtn").click(function (e) {
    e.preventDefault();

    let productName = $("#productSearch").val().trim();
    console.log("Product Name:", productName);

    $.ajax({
        url: "http://localhost:8085/report/filterStockOut",
        type: 'GET',
        data: { productName: productName }, 
        success: function (data) {
            console.log("AJAX Success - Response Data in filter :", data);
            
            let tableBody = $("table tbody");
            tableBody.empty();

            if (data && data.length > 0) {
                $.each(data, function (index, stock) {
                    let row = `<tr>
                        <td>\${stock.stockOutId}</td>
                        <td>\${stock.productId}</td>
                        <td>\${stock.productName}</td>
                        <td>\${stock.quantitySold}</td>
                        <td>\${stock.saleDate}</td>
                        <td>\${stock.customerName}</td>
                        <td>\${stock.createdBy}</td>
                        <td${stock.createdByName ? stock.createdByName : 'N/A'}</td>
                        
                    </tr>`;
                    tableBody.append(row);
                });
            } else {
                tableBody.append('<tr><td colspan="8">No records found</td></tr>');
            }
        },
        error: function (xhr, status, error) {
            console.log("AJAX Error:", xhr.status, xhr.statusText, error);
        }
    });
});



</script>

