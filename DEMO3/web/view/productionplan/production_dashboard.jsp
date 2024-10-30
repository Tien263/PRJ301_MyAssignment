<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Production Dashboard & Schedule Details</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #008cba;
            padding: 20px;
            color: white;
            font-size: 18px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .header-bar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .header-bar a:hover {
            background-color: #005f75;
        }
        .header-title {
            font-size: 24px;
            font-weight: bold;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            animation: fadeIn 0.5s ease;
        }
        h2, h1 {
            text-align: center;
            color: #008cba;
            margin-bottom: 30px;
            font-size: 28px;
        }
        .form-container {
            margin-bottom: 30px;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .form-group label {
            width: 25%;
            font-weight: 500;
            color: #555;
        }
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group select {
            width: 70%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border 0.3s;
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: #008cba;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #008cba;
            color: white;
            font-weight: 600;
        }
        td input[type="text"] {
            width: 80%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border 0.3s;
        }
        td input:focus {
            border-color: #008cba;
        }
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        .btn {
            padding: 15px 40px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            color: white;
        }
        .btn-save {
            background-color: #28a745;
        }
        .btn-save:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        .btn-list {
            background-color: #007bff;
        }
        .btn-list:hover {
            background-color: #0069d9;
            transform: translateY(-2px);
        }
        .btn-schedule {
            background-color: #f39c12;
        }
        .btn-schedule:hover {
            background-color: #e67e22;
            transform: translateY(-2px);
        }
        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }
    </style>
</head>
<body>
    <!-- Thanh điều hướng -->
    <div class="header-bar">
        <a href="../login">Login</a>
        <span class="header-title">Production Dashboard & Schedule Details</span>
        <a href="../schedule/create">Schedule Campaign</a>
    </div>

    <!-- Container chính -->
    <div class="container">
        <!-- Form tạo kế hoạch sản xuất -->
        <h2>Create New Production Plan</h2>
        <form action="create" method="POST" class="form-container">
            <div class="form-group">
                <label for="name">Plan Title:</label>
                <input type="text" id="name" name="name" placeholder="Enter Plan Title" required>
            </div>
            <div class="form-group">
                <label for="date-range">From - To:</label>
                <div style="width: 70%;">
                    <input type="date" id="from" name="from" style="width: 48%;" required>
                    <input type="date" id="to" name="to" style="width: 48%;" required>
                </div>
            </div>
            <div class="form-group">
                <label for="workshop">Workshop:</label>
                <select name="did" id="workshop" required>
                    <c:forEach items="${requestScope.depts}" var="d">
                        <option value="${d.id}">${d.name}</option>
                    </c:forEach>
                </select>
            </div>

            <h3 style="text-align:center; margin-top: 30px; font-size: 20px; color: #333;">Product Details</h3>

            <!-- Bảng sản phẩm -->
            <div class="table-container">
                <table>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Cost</th>
                    </tr>
                    <c:forEach items="${requestScope.products}" var="p">
                        <tr>
                            <td>${p.name}<input type="hidden" value="${p.id}" name="pid"/></td>
                            <td><input type="text" name="quantity${p.id}" placeholder="Enter Quantity" required></td>
                            <td><input type="text" name="cost${p.id}" placeholder="Enter Cost" required></td>
                        </tr>   
                    </c:forEach>
                </table>
            </div>

            <!-- Nút hành động -->
            <div class="action-buttons">
                <button type="submit" class="btn btn-save">Save Plan</button>
                <a href="list" class="btn btn-list">View All Plans</a>
            </div>
        </form>
    </div>
</body>
</html>
