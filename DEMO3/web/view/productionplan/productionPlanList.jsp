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
                background-color: #4CAF50; /* Màu xanh lá cho nút "Thêm Kế Hoạch Chi tiết" */
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-size: 14px;
            }
            .btn:hover {
                background-color: #45a049;
            }
            .btn-delete {
                display: inline-block;
                padding: 8px 16px;
                margin-top: 10px;
                color: white;
                background-color: #f44336; /* Màu đỏ cho nút "Xóa" */
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-size: 14px;
                margin-left: 5px; /* Thêm khoảng cách giữa nút "Thêm" và nút "Xóa" */
            }
            .btn-delete:hover {
                background-color: #d32f2f;
            }
        </style>
        <script>
            function removeEmployee(id)
            {
                var result = confirm("Are you sure?");
                if (result)
                {
                    document.getElementById("frmRemoveEmployee" + id).submit();
                }
            }
        </script>
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
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Now Date</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${requestScope.pcs}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.plan.name}</td>
                            <td>${c.plan.dept.name}</td>
                            <td>${c.plan.start}</td>
                            <td>${c.product.name}</td>
                            <td>${c.quantity}</td>
                            <td>${requestScope.timeNow}</td>
                            <td>
                                <a href="../schedule/create?plid=${c.plan.id}&pcid=${c.id}" class="btn">Schedule Campaign</a>
                                <input type="button" value="Xóa" class="btn-delete" onclick="removeEmployee(${c.id})"/>
                                <form id="frmRemoveEmployee${c.id}" action="delete" method="POST" style="display: none;">
                                    <input type="hidden" name="id" value="${c.id}"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
