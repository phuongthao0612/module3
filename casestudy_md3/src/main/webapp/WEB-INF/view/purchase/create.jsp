<%--
  Created by IntelliJ IDEA.
  User: Thao
  Date: 1/5/2025
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/utils/bootstrap.jsp" %> <!-- Gồm file bootstrap cho giao diện -->
<%@ include file="/WEB-INF/utils/header.jsp" %> <!-- Gồm file header cho trang web -->

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tạo Giao Dịch Mua Thẻ Gym</title>
    <style>
        .container{
            margin-top: 150px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Thêm Mới Giao Dịch</h2>
    <form method="post" action="/purchase">
        <input type="hidden" id="action" name="action" value="create">
        <div class="form-group">
            <label for="customerId">Chọn Khách Hàng</label>
            <select class="form-control" name="customerId" id="customerId" required>
                <c:forEach var="customer" items="${customers}">
                    <option value="${customer.id}">${customer.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="cardId">Chọn Thẻ</label>
            <select class="form-control" name="cardId" id="cardId" required>
                <c:forEach var="card" items="${gymCards}">
                    <option value="${card.cardId}">${card.cardName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="purchaseDate">Ngày đăng ký:</label>
            <input type="date" class="form-control" id="purchaseDate" name="purchaseDate" required>
        </div>
        <div class="form-group">
            <label for="totalPrice">Giá:</label>
            <input type="number" class="form-control" id="totalPrice" name="totalPrice" required>
        </div>
        <div class="form-group">
            <label for="validUntil">Ngày hết hạn:</label>
            <input type="date" class="form-control" id="validUntil" name="validUntil" required>
        </div>
        <button type="submit" class="btn btn-primary">Thêm mới</button>
    </form>
</div>
</body>
</html>
