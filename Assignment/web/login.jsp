<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #74ebd5, #ACB6E5);
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                padding: 20px;
                overflow: hidden;
            }

            .login-container {
                background: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                text-align: center;
                z-index: 2; /* Ensures login form is above the stars */
            }

            h1 {
                font-size: 2rem;
                color: #333;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 20px;
                text-align: left;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-size: 1rem;
                color: #555;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px;
                font-size: 1rem;
                border: 1px solid #ccc;
                border-radius: 8px;
                outline: none;
                transition: all 0.3s;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #74ebd5;
                box-shadow: 0 0 8px rgba(116, 235, 213, 0.5);
            }

            input[type="submit"] {
                width: 100%;
                padding: 12px;
                font-size: 1rem;
                background: linear-gradient(135deg, #74ebd5, #ACB6E5);
                color: #fff;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            input[type="submit"]:hover {
                background: linear-gradient(135deg, #ACB6E5, #74ebd5);
            }

            .form-group {
                text-align: left;
            }

            p {
                margin-top: 20px;
                color: #777;
            }

            a {
                color: #74ebd5;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            a:hover {
                color: #ACB6E5;
            }

            /* Shooting star animation */
            .shooting-star {
                position: absolute;
                top: 0;
                left: 0;
                width: 2px;
                height: 100px;
                background: linear-gradient(white, transparent);
                animation: shooting 2s ease-in infinite;
            }

            /* Keyframes for shooting star */
            @keyframes shooting {
                0% {
                    transform: translate(0, 0) rotate(45deg);
                    opacity: 1;
                }
                100% {
                    transform: translate(600px, 400px) rotate(45deg);
                    opacity: 0;
                }
            }

            /* Random stars with different speeds */
            @keyframes shooting-stars {
                from {
                    transform: translate(0, 0);
                }
                to {
                    transform: translate(-100vw, 100vh);
                }
            }

            .stars {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                pointer-events: none;
                z-index: 1;
            }

            .star {
                position: absolute;
                width: 2px;
                height: 80px;
                background: linear-gradient(white, transparent);
                animation: shooting-stars 2s infinite;
            }

            /* Create multiple shooting stars at random positions */
            .star:nth-child(1) { top: 10%; left: 30%; animation-duration: 5s; }
            .star:nth-child(2) { top: 20%; left: 50%; animation-duration: 3s; }
            .star:nth-child(3) { top: 40%; left: 70%; animation-duration: 4s; }
            .star:nth-child(4) { top: 60%; left: 20%; animation-duration: 6s; }
            .star:nth-child(5) { top: 80%; left: 40%; animation-duration: 2s; }

        </style>
    </head>
    <body>
        <div class="stars">
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
        </div>

        <div class="login-container">
            <h1>Login</h1>
            <form action="login" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required />
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required />
                </div>
                <input type="submit" value="Login"/>
            </form>

            <!-- Display error message if exists -->
            <c:if test="${not empty error}">
                <p style="color:red;">${error}</p>
            </c:if>

            <p>Don't have an account? <a href="register">Sign up</a></p>
        </div>
    </body>
</html>
