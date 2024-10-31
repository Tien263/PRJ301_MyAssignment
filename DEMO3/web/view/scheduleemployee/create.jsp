<%-- 
    Document   : create
    Created on : Oct 30, 2024, 2:39:45 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule Assignment</title>
        <style>
            /* Basic page styling */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f7fa;
                color: #333;
                padding: 20px;
            }
            h2, h3 {
                color: #4CAF50;
            }

            /* Schedule info box styling */
            .schedule-info {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .schedule-info p {
                margin: 5px 0;
            }

            /* Employee table styling */
            table {
                width: 100%;
                border-collapse: collapse;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                margin-bottom: 20px;
            }
            th, td {
                padding: 12px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #4CAF50;
                color: #fff;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Button styling */
            .btn {
                padding: 10px 15px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .btn:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <!-- Schedule Information -->
        <div class="schedule-info">
            <h2>Schedule Information </h2>
            <p><strong>Date:</strong> ${schedule.date} </p>
            <p><strong>shift:</strong> ${schedule.shift} </p>
            <p><strong>Total Quantity:</strong> ${schedule.quantity} </p>
        </div>

        <!-- Employee Assignment Form -->
        <form action="create" method="POST">
            <input type="hidden" name="scid" value="${schedule.id}"/>
            <h3>Assign Employees to Schedule</h3>
            <table>
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Assigned Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="employee" items="${requestScope.emps}">
                        <tr>
                            <td>
                                <!-- Hidden input to store employee IDs -->
                                <input type="hidden" name="eid" value="${employee.id}" />
                                ${employee.id}
                            </td>
                            <td>${employee.name}</td>
                            <td>
                                <!-- Input for assigning quantity, default is 0 -->
                                <input type="number" name="quantities${employee.id}" min="0" value="0" style="width: 60px;" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Submit Button -->
            <div style="text-align: center;">
                <button type="submit" class="btn">Save Assignments</button>
            </div>
        </form>

    </body>
</html>
