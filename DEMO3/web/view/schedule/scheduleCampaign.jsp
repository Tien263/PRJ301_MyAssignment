<%-- 
    Document   : scheduleCampaign
    Created on : Oct 27, 2024, 2:54:27 PM
    Author     : xuant
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết chiến dịch</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        h3, h4 {
            color: #333;
            margin-bottom: 10px;
        }
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
            text-align: center;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Schedule Campaign</h1>
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <h3>Plan: ${plan.name}</h3>
        <h4>Product: ${planCampain.product.name}</h4>
        <h4>Quantity: ${planCampain.quantity}</h4>

        <form action="create" method="POST">
            <input type="hidden" name="pcid" value="${planCampain.id}"/>
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Shift 1</th>
                        <th>Shift 2</th>
                        <th>Shift 3</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="date" items="${dates}">
                        <tr>
                            <td>
                                <input type="hidden" name="date" value="${date}"/>
                                ${date}
                            </td>
                            <td><input type="number" name="quantity${date}k1" min="0" required/></td>
                            <td><input type="number" name="quantity${date}k2" min="0" required/></td>
                            <td><input type="number" name="quantity${date}k3" min="0" required/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input type="submit" value="Save" class="submit-btn"/>
        </form>
    </div>
</body>
</html>
