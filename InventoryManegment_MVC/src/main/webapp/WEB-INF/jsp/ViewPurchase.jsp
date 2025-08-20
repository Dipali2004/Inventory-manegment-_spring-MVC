<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="module/header.jsp" />

<div class="page-wrapper">
    <div class="page-content">
        <div class="container-fluid mt-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="text-center mb-4">Purchase List</h2>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Purchase ID</th>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Supplier ID</th>
                                    <th>Supplier Name</th>
                                    <th>Quantity Purchased</th>
                                    <th>Purchase Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
                                <c:forEach var="purchase" items="${purchase}">
                                    <tr>
                                        <td>${purchase.purchaseId}</td>
                                        <td>${purchase.product.productId}</td>
                                        <td>${purchase.product.productName}</td>
                                        <td>${purchase.supplier.supplierId}</td>
                                        <td>${purchase.supplier.name}</td>
                                        <td>${purchase.quantityPurchased}</td>
                                        <td>${purchase.purchaseDate}</td>
                                        <td>
                                            <a href="updatepurchase?id=${purchase.purchaseId}" 
                                               class="btn btn-success btn-sm me-1">Update</a>
                                            <a href="/purchase/delete/${purchase.purchaseId}" 
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item"><a class="page-link" href="#" id="prevBtn">Previous</a></li>
                            <li class="page-item active"><a class="page-link" href="#" id="pageNumber">1</a></li>
                            <li class="page-item"><a class="page-link" href="#" id="nextBtn">Next</a></li>
                        </ul>
                    </nav>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery pagination script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    let rowsPerPage = 3;  
    let rows = $("#tableBody tr").toArray();  
    let totalPages = Math.ceil(rows.length / rowsPerPage);  
    let currentPage = 1;

    function displayTable(page) {
        let start = (page - 1) * rowsPerPage;
        let end = start + rowsPerPage;

        rows.forEach((row, index) => {
            if(index >= start && index < end) $(row).show();
            else $(row).hide();
        });

        $("#pageNumber").text(page);
        $("#prevBtn").parent().toggleClass("disabled", page === 1);
        $("#nextBtn").parent().toggleClass("disabled", page === totalPages);
    }

    $("#prevBtn").on("click", function(e) {
        e.preventDefault();
        if (currentPage > 1) {
            currentPage--;
            displayTable(currentPage);
        }
    });

    $("#nextBtn").on("click", function(e) {
        e.preventDefault();
        if (currentPage < totalPages) {
            currentPage++;
            displayTable(currentPage);
        }
    });

    displayTable(currentPage);
});
</script>

<jsp:include page="module/footer.jsp" />
