<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Production Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }
        .container {
            width: 70%;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 30px;
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .form-group label {
            width: 20%;
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group input[type="date"] {
            width: 75%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
        }
        td {
            padding: 10px;
            text-align: center;
        }
        td input[type="text"] {
            width: 90%;
            padding: 5px;
            border: none;
            border-bottom: 1px solid #ccc;
            border-radius: 4px;
            text-align: center;
        }
        .save-button {
            display: block;
            width: 100px;
            margin: 30px auto 0;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .save-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Production Dashboard</h2>
        
        <form>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter Name">
            </div>
            <div class="form-group">
                <label for="date-range">From - To:</label>
                <input type="date" id="from" name="from">
                <input type="date" id="to" name="to">
            </div>
            <div class="form-group">
                <label for="workshop">Workshop:</label>
                <input type="text" id="workshop" name="workshop" placeholder="Enter Workshop">
            </div>

            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Cost</th>
                </tr>
                <tr>
                    <td><input type="text" name="product1" placeholder="Enter Product"></td>
                    <td><input type="text" name="quantity1" placeholder="Enter Quantity"></td>
                    <td><input type="text" name="cost1" placeholder="Enter Cost"></td>
                </tr>
                <tr>
                    <td><input type="text" name="product2" placeholder="Enter Product"></td>
                    <td><input type="text" name="quantity2" placeholder="Enter Quantity"></td>
                    <td><input type="text" name="cost2" placeholder="Enter Cost"></td>
                </tr>
                <tr>
                    <td><input type="text" name="product3" placeholder="Enter Product"></td>
                    <td><input type="text" name="quantity3" placeholder="Enter Quantity"></td>
                    <td><input type="text" name="cost3" placeholder="Enter Cost"></td>
                </tr>
            </table>
            
            <button type="submit" class="save-button">Save</button>
        </form>
    </div>
</body>
</html>
