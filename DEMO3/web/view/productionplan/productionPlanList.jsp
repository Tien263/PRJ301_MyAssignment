<%-- 
    Document   : productionPlanList
    Created on : Oct 24, 2024, 7:35:25 PM
    Author     : xuant
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/mytags.tld" prefix="mytag" %>
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
            .search-bar {
                margin-bottom: 20px;
                text-align: center;
            }
            .search-bar input[type="text"] {
                padding: 10px;
                width: 300px;
                font-size: 16px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            .search-bar input[type="submit"] {
                padding: 10px 20px;
                font-size: 16px;
                color: white;
                background-color: #4CAF50;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .search-bar input[type="submit"]:hover {
                background-color: #45a049;
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
            .btn-container {
                display: flex;
                gap: 5px; /* Khoảng cách giữa các nút */
                justify-content: center;
            }
            .btn {
                padding: 8px 16px;
                color: white;
                background-color: #4CAF50;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-size: 14px;
                cursor: pointer;
            }
            .btn:hover {
                background-color: #45a049;
            }
            .btn-delete {
                padding: 8px 16px;
                color: white;
                background-color: #f44336;
                border: none;
                border-radius: 5px;
                font-size: 14px;
                cursor: pointer;
            }
            .btn-delete:hover {
                background-color: #d32f2f;
            }
            .account-info {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                font-size: 14px;
                color: #666;
                margin-bottom: 10px;
            }
        </style>
        <script>
            function removeEmployee(id) {
                var result = confirm("Are you sure?");
                if (result) {
                    document.getElementById("frmRemoveEmployee" + id).submit();
                }
            }
        </script>
    </head>
    <body>
        <div class="account-info">
            Xin chào, <strong>Username</strong>
            <a href="../logout" class="logout-button">Đăng xuất</a>
        </div>
        <div class="container">
            <h1>Danh sách Plan Campaign</h1>

            <!-- Nút quay lại -->
            <div style="text-align: center; margin-bottom: 20px;">
                <button onclick="window.history.back();" class="btn">Quay lại</button>
            </div>

            <!-- Thanh tìm kiếm -->
            <div class="search-bar">
                <form action="search" method="POST">
                    <input type="text" name="search" placeholder="Tìm kiếm tên kế hoạch..." value="${param.search}">
                    <input type="submit" value="Tìm kiếm">
                </form>
            </div>

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
                        <th>Actions</th>
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
                            <td>
                                <!-- Sử dụng Custom Tag để định dạng ngày tháng -->
                                <mytag:ToVietnameseDate value="${requestScope.timeNow}" />
                            </td>
                            <td>
                                <div class="btn-container">
                                    <a href="../schedule/create?plid=${c.plan.id}&pcid=${c.id}" class="btn">Schedule Campaign</a>
                                    <input type="button" value="Xóa" class="btn-delete" onclick="removeEmployee(${c.id})"/>
                                </div>
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