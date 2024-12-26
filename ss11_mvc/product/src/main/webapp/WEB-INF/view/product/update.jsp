<%--
  Created by IntelliJ IDEA.
  User: Thao
  Date: 12/26/2024
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/view/common/bootstrap.jsp" %>
<%@include file="/WEB-INF/view/common/navbar.jsp" %>
<html>
<head>
    <title>Quản lý sản phẩm</title>
</head>
<body>
<div class="container">
    <h2>Cập nhật sản phẩm</h2>
    <form method="post">
        <div class="form-group">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${product.id}">
        </div>
        <div class="form-group">
            <label for="name">Tên:</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="form-group">
            <label for="price">Giá:</label>
            <input type="number" class="form-control" id="price" name="price">
        </div>
        <div class="form-group">
            <label for="description">Miêu tả:</label>
            <input type="text" class="form-control" id="description" name="description">
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>


</body>
</html>
