<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Employee</title>
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

            input[type="radio"] {
                margin-right: 5px;
            }

            input[type="submit"] {
                padding: 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100px;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .btn-cancel {
                padding: 10px;
                background-color: #dc3545;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100px;
            }

            .btn-cancel:hover {
                background-color: #b02a37;
            }

            .form-group {
                display: flex;
                justify-content: space-between;
                gap: 10px;
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
            Edit Employee
        </div>

        <!-- Edit Employee Form -->
        <div class="container">
            <h2>Edit Employee Information</h2>
            <form action="update" method="POST">
                <!-- Hidden ID Field -->
                <input type="hidden" name="id" value="${requestScope.e.id}"/>

                <!-- Name -->
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${requestScope.e.name}" required/>

                <!-- Gender -->
                <label>Gender:</label>
                <div class="form-group">
                    <label>
                        <input type="radio" name="gender" value="male" 
                               ${requestScope.e.gender ? "checked=\"checked\"" : ""}/> Male
                    </label>
                    <label>
                        <input type="radio" name="gender" value="female" 
                               ${!requestScope.e.gender ? "checked=\"checked\"" : ""}/> Female
                    </label>
                </div>

                <!-- Date of Birth -->
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" value="${requestScope.e.dob}" required/>

                <!-- Address -->
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${requestScope.e.address}" required/>

                <!-- Department -->
                <label for="did">Department:</label>
                <select id="did" name="did" required>
                    <c:forEach items="${requestScope.depts}" var="d">
                        <option value="${d.id}" 
                                ${requestScope.e.dept.id eq d.id ? "selected=\"selected\"" : ""}>
                            ${d.name}
                        </option>
                    </c:forEach>
                </select>

                <!-- Created By (Read-Only) -->
                <label>Created by: ${requestScope.e.createdby.username}</label>

                <!-- Buttons -->
                <div class="form-group">
                    <input type="submit" value="Save"/>
                    <button type="button" class="btn-cancel" onclick="history.back();">Cancel</button>
                </div>
            </form>
        </div>
    </body>
</html>
