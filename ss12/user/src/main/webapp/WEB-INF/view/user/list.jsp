<%--
  Created by IntelliJ IDEA.
  User: Thao
  Date: 12/27/2024
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/bootstrap.jsp"%>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<div class="container">
    <h2>List of Users</h2>
    <form action="/user" method="get">
        <button type="submit" name="action" value="sortByName" class="sort-button">Sort by Name</button>
    </form>
    <form action="/user" method="get">
        <input type="text" name="country" value="${countrySearch}" placeholder="Search by country">
        <button type="submit">Search</button>
    </form>
    <button class="btn btn-primary m-4" onclick="window.location.href='/user?action=create'">Add New User</button>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th colspan="2">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td><button class="btn btn-warning" onclick="window.location.href='/user?action=update&id=${user.id}'">Update</button></td>
                <td><button class="btn btn-danger" onclick="window.location.href='/user?action=delete&id=${user.id}'">Delete</button></td>


            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
