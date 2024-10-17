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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Check if username and password are not null
        if (username == null || password == null) {
            req.setAttribute("error", "Username or password cannot be null.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        // Retrieve user information from the database
        UserDBContext db = new UserDBContext();
        User account = db.get(username, password);

        // Check if the account exists and is active
        if (account != null && account.isIs_active()) {
            req.getSession().setAttribute("account", account);

            // Check if user has at least one role
            ArrayList<Role> roles = account.getRoles();
            if (roles.size() > 0) {
                String primaryRoleName = roles.get(0).getRname(); // Use the first role for redirection
                switch (primaryRoleName) {
                    case "Head of HRD":
                        req.getRequestDispatcher("hrd_dashboard.jsp").forward(req, resp);
                        break;
                    case "Recruitment Officer":
                        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
                        break;
                    case "Payroll Management":
                        req.getRequestDispatcher("payroll_dashboard.jsp").forward(req, resp);
                        break;
                    case "Production Planning":
                        req.getRequestDispatcher("production_dashboard.jsp").forward(req, resp);
                        break;
                    case "Worker Allocation":
                        req.getRequestDispatcher("worker_dashboard.jsp").forward(req, resp);
                        break;
                    default:
                        req.setAttribute("error", "Role not recognized. Please contact the administrator.");
                        req.getRequestDispatcher("error.jsp").forward(req, resp);
                        break;
                }
            } else {
                req.setAttribute("error", "No roles assigned. Please contact the administrator.");
                req.getRequestDispatcher("error.jsp").forward(req, resp);
            }
        } else {
            // Handle invalid login or inactive user
            req.setAttribute("error", "Invalid username or password, or account is inactive.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward to the login page for GET requests
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}
