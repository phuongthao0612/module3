<%--
  Created by IntelliJ IDEA.
  User: Thao
  Date: 12/27/2024
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/common/bootstrap.jsp"%>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<div class="container">
    <h2> Edit User</h2>
    <form method="post">
        <div class="form-group">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${user.id}">
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" name="email">
        </div>
        <div class="form-group">
            <label for="country">Country:</label>
            <input type="text" class="form-control" id="country" name="country">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

</body>
</html>
