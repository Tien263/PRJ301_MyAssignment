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

            .nav-menu a {
                color: #ffffff;
                text-decoration: none;
                padding: 15px 30px;
                font-size: 18px;
                border-radius: 50px;
                transition: background-color 0.3s, transform 0.3s;
            }

            .nav-menu a:hover {
                background-color: #607d8b;
                transform: translateY(-3px);
            }

            .container {
                margin: 30px auto;
                width: 90%;
                max-width: 600px;
                background-color: white;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }

            form {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            label {
                font-weight: bold;
            }

            input[type="text"], input[type="date"], select {
                padding: 10px;
                font-size: 1em;
                width: 100%;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            input[type="submit"] {
                padding: 10px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #218838;
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
    </head>
    <body>
        <div class="account-info">
            Xin chào, <strong>Username</strong>
            <a href="../logout" class="logout-button">Đăng xuất</a>
        </div>
        <!-- Header -->
        <div class="header">
            Human Resources Department - Add Employee
        </div>

        <!-- Back Button -->
        <div class="back-link">
            <a href="javascript:history.back()">&larr; Back to Previous Page</a>
        </div>

        <!-- Container for Add Employee Form -->
        <div class="container">
            <h2>Add Employee</h2>
            <form action="create" method="POST">
                <!-- Name -->
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required />

                <!-- Gender -->
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>

                <!-- Date of Birth -->
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required />

                <!-- Address -->
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required />

                <!-- Department ID -->
                <label for="did">Department ID:</label>
                <select id="did" name="did" required>
                    <c:forEach items="${requestScope.depts}" var="d">
                        <option value="${d.id}">${d.name}</option>
                    </c:forEach>
                </select>

                <!-- Submit Button -->
                <input type="submit" value="Add Employee" />
            </form>
        </div>
    </body>
</html>

