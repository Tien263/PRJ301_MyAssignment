package controller.accesscontrol;

import dal.UserDBContext;
import entity.accesscontrol.User;
import entity.accesscontrol.Role;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


/**
 * LoginController handles user authentication and role-based redirection.
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if username and password are not null
        if (username == null || password == null) {
            request.setAttribute("error", "Username or password cannot be null.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Retrieve user information from the database
        UserDBContext db = new UserDBContext();
        User account = db.get(username, password);

        // Check if the account exists and is active
        if (account != null && account.isIs_active()) {
            request.getSession().setAttribute("account", account);

            // Check if user has at least one role
            ArrayList<Role> roles = account.getRoles();
            if (roles.size() > 0) {
                String primaryRoleName = roles.get(0).getRname(); // Use the first role for redirection
                switch (primaryRoleName) {
                    case "Head of HRD":
                        request.getRequestDispatcher("hrd_dashboard.jsp").forward(request, response);
                        break;
                    case "Human Resources Department":
                        response.sendRedirect("employee/list");
                        break;
                    case "Payroll Management":
                        request.getRequestDispatcher("payroll_dashboard.jsp").forward(request, response);
                        break;
                    case "Production Planning":
                        response.sendRedirect("productionplan/create");
                        break;
                    case "Worker Allocation":
                        request.getRequestDispatcher("worker_dashboard.jsp").forward(request, response);
                        break;
                    default:
                        request.setAttribute("error", "Role not recognized. Please contact the administrator.");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                        break;
                }
            } else {
                request.setAttribute("error", "No roles assigned. Please contact the administrator.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            // Handle invalid login or inactive user
            request.setAttribute("error", "Invalid username or password, or account is inactive.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the login page for GET requests
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
