<%--
  Created by IntelliJ IDEA.
  User: Thao
  Date: 12/26/2024
  Time: 8:54 AM
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
    <button class="btn btn-primary m-4" onclick="window.location.href='/product?action=create'">Thêm mới</button>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Giá</th>
            <th>Miêu tả</th>
            <th colspan="2">Chức năng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td>
                    <a href="/product?action=update&id=${product.id}" class="btn btn-warning">Cập nhật</a>
                </td>
                <td>
                    <a href="/product?action=delete&id=${product.id}" class="btn btn-danger"
                       onclick="return confirm('Bạn chắc chắn muốn xóa sản phẩm này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
