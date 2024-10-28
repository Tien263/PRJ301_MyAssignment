<%-- 
    Document   : productionPlanList
    Created on : Oct 24, 2024, 7:35:25 PM
    Author     : xuant
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Plan Campaign</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            background-color: #fff;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #eaeaea;
            cursor: pointer;
        }
        .btn {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 10px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Danh sách Plan Campaign</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Plan Name</th>
                    <th>Department Name</th>
                    <th>Start Date</th>
                    <th>Now Date</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Complete</th>
                    <th>Status</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${requestScope.pcs}">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.plan.name}</td>
                        <td>${c.plan.dept.name}</td>
                        <td>${c.plan.start}</td>
                        <td>${requestScope.timeNow}</td>
                        <td>${c.product.name}</td>
                        <td>${c.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>