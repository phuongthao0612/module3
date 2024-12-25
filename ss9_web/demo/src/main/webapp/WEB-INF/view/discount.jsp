<%--
  Created by IntelliJ IDEA.
  User: Thao
  Date: 12/25/2024
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background-image: url('https://cdn.tgdd.vn/hoi-dap/1369909/200-anh-lam-slide-powerpoint-cuc-dep-chuyen-nghiep-khong%20(50)-800x500.jpg');
        }

        .container {
            text-align: center;
            padding: 30px;
            border: 2px solid #4CAF50;
            border-radius: 8px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            background-color: white;
            width: 350px;
        }

        h2 {
            margin-bottom: 20px;
            color: #4CAF50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin: 5px 0;
        }

        input[type="text"], input[type="number"], input[type="submit"] {
            padding: 10px;
            margin: 10px 0;
            width: 100%;
            box-sizing: border-box;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        p {
            font-size: 16px;
            color: #333;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Product Discount Calculator</h2>
    <form action="/discount" method="post">
        <table>
            <tr>
                <td>Product Description:</td>
                <td><input name="description"></td>
            </tr>
            <tr>
                <td>List Price:</td>
                <td><input name="price"></td>
            </tr>
            <tr>
                <td>Discount Percent:</td>
                <td><input name="percent"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Calculate Discount"></td>
            </tr>
        </table>
    </form>
    <c:if test="${not empty error}">
        <div style="color: red;">${error}</div>
    </c:if>
    <c:if test="${not empty description}">
        <p>Discount: ${discount}</p>
        <p>Price after Discount: ${discountPrice}</p>
    </c:if>
</div>
</body>
</html>
