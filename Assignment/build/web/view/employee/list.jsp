<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee List with Inline Edit</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f0f8ff;
                padding: 20px;
            }

            .container {
                max-width: 900px;
                margin: auto;
                background: white;
                padding: 20px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-size: 1em;
                box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
            }

            table th, table td {
                padding: 12px 15px;
                text-align: center;
                border: 1px solid #ddd;
            }

            table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            table th {
                font-weight: bold;
                background-color: #007bff;
                color: white;
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
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Employee List with Inline Edit</h1>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Date of Birth</th>
                        <th>Address</th>
                        <th>Department</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.emps}" var="e">
                        <tr>
                            <form action="update" method="POST">
                                <!-- Hidden input for employee id -->
                                <td><input type="hidden" name="id" value="${e.id}"/>${e.id}</td>
                                
                                <!-- Editable Name field -->
                                <td><input type="text" name="name" value="${e.name}"/></td>
                                
                                <!-- Editable Gender selection -->
                                <td>
                                    <input type="radio" name="gender" value="male" ${e.gender ? 'checked="checked"' : ''}/> Male
                                    <input type="radio" name="gender" value="female" ${!e.gender ? 'checked="checked"' : ''}/> Female
                                </td>
                                
                                <!-- Editable Date of Birth field -->
                                <td><input type="date" name="dob" value="${e.dob}"/></td>
                                
                                <!-- Editable Address field -->
                                <td><input type="text" name="address" value="${e.address}"/></td>
                                
                                <!-- Editable Department dropdown -->
                                <td>
                                    <select name="did">
                                        <c:forEach items="${requestScope.depts}" var="d">
                                            <option value="${d.id}" ${e.dept.id eq d.id ? 'selected="selected"' : ''}>${d.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                
                                <!-- Save button to submit the update -->
                                <td>
                                    <input type="submit" value="Save"/>
                                    <button type="button" class="cancel-button" onclick="location.reload()">Cancel</button>
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
