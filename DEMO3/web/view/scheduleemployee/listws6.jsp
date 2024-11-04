<%-- 
    Document   : listws6
    Created on : Oct 31, 2024, 2:41:41 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule List</title>
        <style>
            /* Reset default browser styling */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Basic styling */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                color: #333;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            /* Navigation menu styling */
            .navbar {
                width: 100%;
                background-color: #4CAF50; /* Màu xanh lá đậm */
                padding: 10px 0;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                display: flex;
                align-items: center;
                justify-content: center;
                position: sticky;
                top: 0;
                z-index: 10;
            }

            .navbar-container {
                width: 80%;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            /* Back button */
            .back-button {
                color: #fff;
                background-color: #388E3C; /* Màu xanh lá đậm hơn */
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .back-button:hover {
                background-color: #2E7D32;
            }

            /* Menu links styling */
            .menu-links a {
                color: #fff;
                margin-left: 20px;
                text-decoration: none;
                font-weight: bold;
                padding: 10px 15px;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .menu-links a:hover {
                background-color: #388E3C;
            }

            /* Content container */
            .content {
                width: 80%;
                margin-top: 30px;
                max-width: 1200px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                border-radius: 8px;
            }

            /* Title styling */
            h2 {
                text-align: center;
                margin-bottom: 20px;
                font-size: 24px;
                color: #388E3C; /* Màu xanh lá đậm */
            }

            /* Table styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
                overflow: hidden;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 12px 15px;
                text-align: center;
                border-bottom: 1px solid #ddd;
                font-size: 15px;
            }

            th {
                background-color: #4CAF50; /* Màu xanh lá chủ đạo */
                color: #fff;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #e0e0e0;
            }

            /* Button styling */
            .btn {
                padding: 8px 12px;
                background-color: #4CAF50; /* Màu xanh lá */
                color: white;
                font-weight: bold;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn:hover {
                background-color: #388E3C;
            }

            /* Footer */
            footer {
                margin-top: 20px;
                color: #868e96;
                font-size: 14px;
                text-align: center;
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
            function goBack() {
                window.history.back();
            }
        </script>
    </head>
    <body>
        <div class="account-info">
            Xin chào, <strong>Username</strong>
            <a href="../logout" class="logout-button">Đăng xuất</a>
        </div>
        <!-- Navigation Menu -->
        <div class="navbar">
            <div class="navbar-container">
                <a class="back-button" onclick="goBack()">Quay lại</a>
                <div class="menu-links">
                    <a href="../scheduleemployee/filter?did=6">Chi tiet nhân viên</a>
                </div>
            </div>
        </div>

        <!-- Content Section -->
        <div class="content">
            <h2>Schedule List</h2>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Product</th>
                        <th>Shift</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="sc" items="${requestScope.sc}">
                        <tr>
                            <td>${sc.id}</td>
                            <td>${sc.date}</td>
                            <td>${sc.plcampain.product.name}</td>
                            <td>${sc.shift}</td>
                            <td>${sc.quantity}</td>
                            <td>
                                <form action="create" method="Get" style="display:inline;">
                                    <input type="hidden" name="scid" value="${sc.id}" />
                                    <input type="hidden" name="did" value="${6}" />
                                    <button type="submit" class="btn">Select Worker</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Footer -->
        <footer>
            © 2024 Your Company. All rights reserved.
        </footer>

    </body>
</html>
