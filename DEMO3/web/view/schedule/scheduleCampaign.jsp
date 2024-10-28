<%-- 
    Document   : scheduleCampaign
    Created on : Oct 27, 2024, 2:54:27 PM
    Author     : xuant
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lịch Làm Việc</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid black;
                padding: 5px; /* Giảm padding để bảng gọn hơn */
                text-align: center;
            }
            th {
                background-color: yellow;
                font-weight: bold;
            }
            .date-cell {
                background-color: yellow;
                font-weight: bold;
                width: 150px; /* Kéo dài cột Ngày */
            }
            .plan-info {
                margin-bottom: 20px;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ccc;
                border-radius: 8px;
            }
            .plan-info h2 {
                color: #333;
                margin: 0 0 10px;
            }
            .plan-info p {
                margin: 5px 0;
                font-weight: bold;
            }
            input[type="text"] {
                width: 90%; /* Giữ chiều rộng ô input */
                padding: 3px; /* Giảm padding cho ô input */
                border-radius: 4px;
                border: 1px solid #ccc;
                box-shadow: inset 0 1px 3px rgba(0,0,0,0.2);
            }
            button {
                padding: 8px 12px; /* Giảm padding cho nút */
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h1>Lịch Làm Việc</h1>
        <form action="create" method="GET">
            <!-- Phần thông tin của kế hoạch -->
            <div class="plan-info">
                <h2>Thông Tin Kế Hoạch</h2>
                <p>Tên Kế Hoạch: <span>${planName}</span></p>
                <p>Ngày Bắt Đầu: <span>${startDate}</span></p>
                <p>Ngày Kết Thúc: <span>${endDate}</span></p>
                <p>Số Lượng: <span>${quantity}</span></p>
            </div>
        </form>

        <form action="create" method="POST">
            <!-- Bảng lịch làm việc -->
            <table>
                <thead>
                    <tr>
                        <th class="date-cell" rowspan="2">Ngày</th>
                        <th colspan="3">${productName[0].name}</th> <!-- Tên sản phẩm cho Giỏ -->
                        <th colspan="3">${productName[1].name}</th> <!-- Tên sản phẩm cho Thúng -->
                        <th colspan="3">${productName[2].name}</th> <!-- Tên sản phẩm cho Mẹt -->
                    </tr>
                    <tr>
                        <th>K1</th>
                        <th>K2</th>
                        <th>K3</th>
                        <th>K1</th>
                        <th>K2</th>
                        <th>K3</th>
                        <th>K1</th>
                        <th>K2</th>
                        <th>K3</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${dates}" var="date">
                        <tr>
                            <td class="date-cell">
                                <input type="hidden" name="date" value="${date}"/>
                                ${date}
                            </td>
                            <c:forEach items="${pcids}" var="pcid"> <!-- Lặp qua từng pcid -->
                                <td><input type="text" name="data[${date}][${pcid}][K1]" /></td>
                                <td><input type="text" name="data[${date}][${pcid}][K2]" /></td>
                                <td><input type="text" name="data[${date}][${pcid}][K3]" /></td>
                                </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
            <button type="submit" style="margin-top: 20px;">Lưu Lịch Làm Việc</button>
        </form>
    </body>

</html>
