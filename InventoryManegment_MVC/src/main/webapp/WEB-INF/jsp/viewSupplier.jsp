<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Suppliers</title>
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

    <h2 style="text-align:center;">Supplier List</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Contact Info</th>
                <th>Address</th>
                <<!-- th>Products Count</th> -->
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="supplier" items="${managers}">
                <tr>
                    <td>${supplier.supplierId}</td>
                    <td>${supplier.name}</td>
                    <td>${supplier.contactInfo}</td>
                    <td>${supplier.address}</td>
                  <%--   <td><c:out value="${fn:length(supplier.products)}"/></td> --%>
                    <td>
                        <a href="update?id=${supplier.supplierId}" class="button">Update</a>
                        <a href="/supplier/delete/${supplier.supplierId}" class="button delete-button" onclick="return confirm('Are you sure to delete?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>

