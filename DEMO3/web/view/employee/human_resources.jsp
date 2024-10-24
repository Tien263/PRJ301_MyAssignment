<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Human Resources Department</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            padding: 20px;
        }
        .header {
            background-color: #35424a;
            color: #ffffff;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            letter-spacing: 1.5px;
        }
        .back-link {
            display: block;
            margin: 20px;
            text-align: left;
        }
        .back-link a {
            color: #35424a;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 8px;
            background-color: #e8e8e8;
            transition: background-color 0.3s, box-shadow 0.3s;
            border: 1px solid #ccc;
        }
        .back-link a:hover {
            background-color: #35424a;
            color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .nav-menu {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 15px;
            background-color: #455a64;
        }
        .nav-menu button, .nav-menu a {
            color: #ffffff;
            text-decoration: none;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 50px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            background-color: transparent;
        }
        .nav-menu button:hover, .nav-menu a:hover {
            background-color: #607d8b;
            transform: translateY(-3px);
        }
        .container {
            margin: 30px auto;
            width: 90%;
            max-width: 1200px;
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }
        table th, table td {
            padding: 15px;
            text-align: left;
            border: 1px solid #e0e0e0;
        }
        th {
            background-color: #f0f0f0;
            color: #35424a;
        }
        input[type="text"], input[type="date"], select {
            padding: 5px;
            font-size: 1em;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"], .cancel-button {
            padding: 5px 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .cancel-button {
            background-color: #dc3545;
        }
        .cancel-button:hover {
            background-color: #c82333;
        }
        .edit-form {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        Human Resources Department
    </div>

    <!-- Back Button -->
    <div class="back-link">
        <a href="../login">&larr; Back to Login</a>
    </div>

    <!-- Navigation Menu -->
    <div class="nav-menu">
        <a href="create">Add Employee</a>
        <button onclick="scrollToEditForm()">Edit Employee</button>
        <a href="attendance.jsp">Attendance</a>
    </div>

    <!-- Container for Employee List -->
    <div class="container">
        <h1>Employee List</h1>
        <form action="processSelectedIds" method="POST"> <!-- Form để xử lý các ID đã chọn -->
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Date of Birth</th>
                        <th>Address</th>
                        <th>Salary</th>
                        <th>Department</th>
                        <th>Select</th> <!-- Thêm cột Select ở cuối -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.emps}" var="e">
                        <tr>
                            <td>${e.id}</td>
                            <td>${e.name}</td>
                            <td>
                                <c:if test="${e.gender}">
                                    Male
                                </c:if>
                                <c:if test="${!e.gender}">
                                    Female
                                </c:if>
                            </td>
                            <td>${e.dob}</td>
                            <td>${e.address}</td>
                            <td>${e.salary}</td>
                            <td>${e.dept.name}</td>
                            <td>
                                <form action="delete" method="POST" style="display:inline;">
                                    <input type="hidden" name="id" value="${e.id}">
                                    <input type="submit" value="Delete" style="background-color: #dc3545; color: white; border: none; border-radius: 5px; cursor: pointer;">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>

        <!-- Edit Employee Form -->
        <div class="edit-form">
            <form action="update" method="GET">
                <label for="id">Enter Employee ID to Edit:</label>
                <input type="text" id="id" name="id" required>
                <input type="submit" value="Edit">
            </form>
        </div>
    </div>

    <!-- JavaScript để cuộn đến phần Edit Form -->
    <script>
        function scrollToEditForm() {
            document.querySelector('.edit-form').scrollIntoView({
                behavior: 'smooth'
            });
        }
    </script>
</body>
</html>
