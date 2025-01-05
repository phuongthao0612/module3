<%--
  Created by IntelliJ IDEA.
  User: Thao
  Date: 1/5/2025
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/utils/bootstrap.jsp" %>
<%@include file="/WEB-INF/utils/header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h1>Danh Sách</h1>
    <form action="/purchase?action=search" method="get">
            <input type="text" name="search" placeholder="Nhập tên khách hàng" value="${param.search}">
            <button class="btn btn-primary" type="submit">Tìm kiếm</button>
    </form>

    <button class="btn btn-primary m-4" onclick="window.location.href='/purchase?action=create'">Thêm mới</button>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>customer name</th>
            <th>card name</th>
            <th>date</th>
            <th>price</th>
            <th>untilDate</th>
            <th style="text-align: center" colspan="2">Chức năng</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="purchase" items="${purchases}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${purchase.customerName}</td>
                <td>${purchase.cardName}</td>
                <td>${purchase.purchaseDate}</td>
                <td>${purchase.totalPrice}</td>
                <td>${purchase.validUntil}</td>
                <td>
                    <button class="btn btn-warning"
                            onclick="window.location.href='/purchase?action=update&id=${purchase.purchaseId}'">Cập nhật
                    </button>
                </td>
                <td>
                    <button class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#modalDelete${purchase.purchaseId}">
                        Xóa
                    </button>
                </td>
                <div class="modal fade" id="modalDelete${purchase.purchaseId}" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Xóa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Bạn có chắc muốn xóa phiếu mua hàng có tên là ${purchase.customerName}
                                    và ID là ${purchase.purchaseId}?</p>
                                <small style="color: red; font-style: italic">Lưu ý hành động này không thể hoàn
                                    tác!</small>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="button" class="btn btn-danger"
                                        onclick="window.location.href='/purchase?action=delete&id=${purchase.purchaseId}'">
                                    Xác nhận
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${message != null}">
        <div class="alert alert-success" role="alert" id="message">
                ${message}
        </div>
    </c:if>
</div>

</body>
</html>
