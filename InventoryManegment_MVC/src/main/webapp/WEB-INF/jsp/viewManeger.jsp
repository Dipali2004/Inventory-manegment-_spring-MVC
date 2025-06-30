<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager List</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ccc;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .btn-update {
        padding: 5px 10px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }
</style>
</head>
<body>

<h2>All Managers</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Password</th>
            <th>Role</th>
            <th>Address</th>
            <th>User</th>
            <th>Update</th> <!-- New column -->
        </tr>
    </thead>
    <tbody>
        <c:forEach var="manager" items="${managers}">
            <tr>
                <td>${manager.id}</td>
                <td>${manager.fullName}</td>
                <td>${manager.email}</td>
                <td>${manager.phone}</td>
                <td>${manager.password}</td>
                <td>${manager.role}</td>
                <td>${manager.address}</td>
                <td>${manager.user}</td>
                <td>
                    <a class="btn-update" href="update_maneger?id=${manager.id} ">Update</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<%-- <a href="update.jsp?id=${booking.id}&email=${booking.email}&source=${booking.source}
								&destination=${booking.destination}&journeyDate=${booking.journeyDate}&numberOfSeats=${booking.numberOfSeats}
								&busType=${booking.busType}" class="btn btn-warning btn-sm">Update</a>
 --%>
</body>
</html>
