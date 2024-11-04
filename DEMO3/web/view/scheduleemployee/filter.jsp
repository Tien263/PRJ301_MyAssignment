<%-- 
    Document   : filter
    Created on : Oct 31, 2024, 7:45:33 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Search</title>
        <style>
            /* Basic styling for the page */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f7fa;
                color: #333;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 20px;
                margin: 0;
            }

            /* Back button styling */
            .back-button {
                display: inline-block;
                padding: 10px 15px;
                margin-bottom: 15px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
            }
            .back-button:hover {
                background-color: #45a049;
            }

            /* Search form styling */
            .search-form {
                width: 80%;
                max-width: 600px;
                margin-bottom: 20px;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            .search-form h2 {
                color: #4CAF50;
                text-align: center;
                margin-bottom: 20px;
            }
            .search-form .form-group {
                margin-bottom: 15px;
            }
            .search-form label {
                font-weight: bold;
                margin-bottom: 5px;
                display: block;
            }
            .search-form input[type="text"],
            .search-form input[type="date"] {
                padding: 8px;
                width: 100%;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .search-form button {
                width: 100%;
                padding: 10px 0;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                margin-top: 15px;
            }
            .search-form button:hover {
                background-color: #45a049;
            }

            /* Table styling */
            table {
                width: 80%;
                max-width: 800px;
                border-collapse: collapse;
                margin-top: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }
            th, td {
                padding: 12px 15px;
                text-align: center;
                border-bottom: 1px solid #ddd;
                font-size: 15px;
            }
            th {
                background-color: #4CAF50;
                color: #fff;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #e0e0e0;
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

        <!-- Back Button -->
        <a class="back-button" href="javascript:void(0)" onclick="goBack()">Quay lại</a>

        <!-- Search Form -->
        <div class="search-form">
            <h2>Search Employee</h2>
            <form action="filter" method="GET">
                <input type="hidden" name="did" value="${param.did}" />
                <div class="form-group">
                    <label for="employeeName">Employee Name:</label>
                    <select id="emps" name="eid" required>
                        <c:forEach items="${requestScope.emps}" var="e">
                            <option value="${e.id}">${e.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="workDate">Work Date:</label>
                    <input type="date" id="workDate" name="date">
                </div>

                <button type="submit">Search</button>
            </form>
        </div>

        <!-- Result Table -->
        <table>
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Date</th>
                    <th>Quantity To Do</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="d" items="${requestScope.detail}">
                    <tr>
                        <td>${d.id}</td>
                        <td>${d.name}</td>
                        <td>${d.date}</td>
                        <td>${d.quantityToDo}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty requestScope.results}">
                    <tr>
                        <td colspan="4">No results found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

    </body>
</html>
