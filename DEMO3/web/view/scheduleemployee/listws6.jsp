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
            /* Basic styling for the page and table */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f7fa;
                color: #333;
                display: flex;
                justify-content: center;
                padding: 20px;
            }
            h2 {
                text-align: center;
                color: #333;
            }
            table {
                width: 80%;
                margin: 0 auto;
                border-collapse: collapse;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }
            th, td {
                padding: 12px 15px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #4CAF50;
                color: #fff;
                font-weight: bold;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #e0e0e0;
            }
            .btn {
                display: inline-block;
                padding: 8px 12px;
                background-color: #4CAF50;
                color: white;
                text-align: center;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            .btn:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

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

    </body>
</html>