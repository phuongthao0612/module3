<%--
  Created by IntelliJ IDEA.
  User: Thao
  Date: 12/25/2024
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Máy tính</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: green;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #f0fff4;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .result {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }

        .error {
            color: red;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Máy tính</h2>
    <form action="/calculator" method="post">
        <label for="num1">Số 1:</label>
        <input type="text" id="num1" name="num1" value="${num1}" required/><br>

        <label for="num2">Số 2:</label>
        <input type="text" id="num2" name="num2" value="${num2}" required/><br>

        <label for="operation">Phép toán:</label>
        <select name="operation" id="operation">
            <option value="add" ${operation == 'add' ? 'selected' : ''}>Cộng</option>
            <option value="subtract" ${operation == 'subtract' ? 'selected' : ''}>Trừ</option>
            <option value="multiply" ${operation == 'multiply' ? 'selected' : ''}>Nhân</option>
            <option value="divide" ${operation == 'divide' ? 'selected' : ''}>Chia</option>
        </select><br>

        <input type="submit" value="Tính toán"/>
    </form>

    <c:if test="${not empty result}">
        <div class="result">${result}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
</div>
</body>
</html>
