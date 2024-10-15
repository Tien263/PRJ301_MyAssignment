<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                padding: 20px;
            }
            .container {
                max-width: 600px;
                margin: auto;
                background: white;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
            h1 {
                color: #333;
            }
            a {
                display: block;
                padding: 10px;
                margin: 10px 0;
                background-color: #007bff;
                color: white;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
            }
            a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Welcome, ${account.username}!</h1>
            <p>Select an action below:</p>
            <a href="${pageContext.request.contextPath}/employee/list">List Items</a>
            <a href="updateItems.jsp">Update Items</a>
            <a href="deleteItems.jsp">Delete Items</a>
        </div>
    </body>
</html>
