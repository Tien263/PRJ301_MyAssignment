<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HRD Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Basic CSS for styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #333;
            color: #fff;
            padding: 15px;
            text-align: center;
        }
        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }
        .dashboard {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }
        .section {
            background-color: #fff;
            width: 80%;
            margin: 15px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .section h2 {
            margin-top: 0;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .action-btn {
            padding: 5px 10px;
            margin: 2px;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
        }
        .edit-btn {
            background-color: #4CAF50;
        }
        .delete-btn {
            background-color: #f44336;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Head of HRD Dashboard</h1>
    </div>
    
    <!-- Dashboard Content -->
    <div class="dashboard">
        <!-- Workers Section -->
        <div class="section">
            <h2>Manage Workers</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Example data, replace with dynamic content from backend --%>
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>Operator</td>
                        <td>
                            <a href="editWorker?id=1" class="action-btn edit-btn">Edit</a>
                            <a href="deleteWorker?id=1" class="action-btn delete-btn">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jane Smith</td>
                        <td>Technician</td>
                        <td>
                            <a href="editWorker?id=2" class="action-btn edit-btn">Edit</a>
                            <a href="deleteWorker?id=2" class="action-btn delete-btn">Delete</a>
                        </td>
                    </tr>
                    <!-- More rows as needed -->
                </tbody>
            </table>
        </div>
        
        <!-- Projects Section -->
        <div class="section">
            <h2>View Projects</h2>
            <table>
                <thead>
                    <tr>
                        <th>Project ID</th>
                        <th>Project Name</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Example data, replace with dynamic content from backend --%>
                    <tr>
                        <td>P001</td>
                        <td>Project Alpha</td>
                        <td>Ongoing</td>
                    </tr>
                    <tr>
                        <td>P002</td>
                        <td>Project Beta</td>
                        <td>Completed</td>
                    </tr>
                    <!-- More rows as needed -->
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
