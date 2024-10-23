<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Production Plan Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

    <h2>Production Plan Management</h2>

    <!-- Form to create a new production plan -->
    <form action="productionplan/create" method="post">
        <input type="submit" class="button" value="ProductionPlanCreate">
    </form>

    <hr>

    <!-- Display the list of production plans -->
    <h3>All Production Plans</h3>
    <table>
        <tr>
            <th>Plan ID</th>
            <th>Plan Name</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
        </tr>
        <%
            // Sample data for demonstration
            String[][] plans = {
                {"1", "Plan A", "2024-01-01", "2024-03-31", "Active"},
                {"2", "Plan B", "2024-04-01", "2024-06-30", "Completed"}
            };

            for (String[] plan : plans) {
        %>
        <tr>
            <td><%= plan[0] %></td>
            <td><%= plan[1] %></td>
            <td><%= plan[2] %></td>
            <td><%= plan[3] %></td>
            <td><%= plan[4] %></td>
        </tr>
        <%
            }
        %>
    </table>

</body>
</html>
