<%-- 
    Document   : viewSchedule
    Created on : Oct 28, 2024, 2:47:20 AM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h2>Tạo Lịch Trình Sản Xuất Từ Ngày Bắt Đầu Tới Ngày Kết Thúc</h2>
    <form action="createSchedule" method="post">
        <!-- Nhập ID Kế Hoạch Sản Xuất -->
        <label>ID Kế Hoạch (plid):</label>
        <input type="number" name="plid" required /><br><br>

        <!-- Nhập Ngày Bắt Đầu -->
        <label>Ngày Bắt Đầu:</label>
        <input type="date" name="startDate" required /><br><br>

        <!-- Nhập Ngày Kết Thúc -->
        <label>Ngày Kết Thúc:</label>
        <input type="date" name="endDate" required /><br><br>

        <!-- Nhập Số Lượng Sản Phẩm Mỗi Ca -->
        <label>Số Lượng Sản Phẩm Mỗi Ca:</label>
        <input type="number" name="quantityPerShift" required /><br><br>

        <!-- Nút Submit để tạo lịch trình -->
        <button type="submit">Tạo Lịch Trình</button>
    </form>
</body>
</html>
