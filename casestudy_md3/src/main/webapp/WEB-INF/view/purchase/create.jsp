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
            margin-top: 135px;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }

        body {
            background-color: #FFFACD;
            font-family: Arial, sans-serif;
            padding: 0;
            margin: 0;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
        }

        .form-group label {
            font-size: 1.1rem;
            color: #495057;
        }

        .form-control {
            border-radius: 5px;
            box-shadow: none;
            border: 1px solid #ced4da;
            font-size: 1rem;
            padding: 10px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            border-radius: 5px;
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .mb-3 {
            margin-bottom: 1.5rem;
        }

        select.form-control {
            padding: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        option {
            font-size: 1rem;
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
            <label for="totalPrice">Tổng giá trị:</label>
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
