<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HR Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
            }
            .dashboard-container {
                width: 320px;
                text-align: center;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
                position: relative;
            }
            .dashboard-container h1 {
                color: #444444;
                font-size: 24px;
                margin-bottom: 20px;
            }
            .account-info {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 14px;
                color: #666;
                display: flex;
                align-items: center;
            }
            .logout-button {
                margin-left: 8px;
                font-size: 12px;
                color: #007bff;
                text-decoration: none;
                cursor: pointer;
                transition: color 0.3s;
            }
            .logout-button:hover {
                color: #0056b3;
            }
            .dashboard-button {
                display: block;
                width: 100%;
                padding: 12px;
                font-size: 16px;
                color: #ffffff;
                background-color: #007bff;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                text-decoration: none;
                transition: background-color 0.3s, transform 0.3s;
                margin-bottom: 15px;
            }
            .dashboard-button:hover {
                background-color: #0056b3;
                transform: translateY(-2px);
            }
            .dashboard-button:active {
                background-color: #004080;
                transform: translateY(0);
            }
        </style>
    </head>
    <body>

        <div class="dashboard-container">
            <div class="account-info">
                Xin chào, <strong>Head of HRD</strong>
                <a href="logout" class="logout-button">Đăng xuất</a>
            </div>
            <h1>HR Dashboard</h1>
            <a href="employee/list" class="dashboard-button">List Employee</a>
            <a href="productionplan/create" class="dashboard-button">List Production Plan</a>
        </div>

    </body>
</html>
