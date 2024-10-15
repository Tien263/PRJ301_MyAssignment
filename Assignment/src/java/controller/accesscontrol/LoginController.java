package controller.accesscontrol;

import dal.UserDBContext;
import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author sonng
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        UserDBContext db = new UserDBContext();
        User account = db.get(username, password);
        
        if (account != null) {
            // Set the user account in session after successful login
            req.getSession().setAttribute("account", account);
            
            // Redirect to the main JSP page with list, update, and delete options
            req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
        } else {
            // Redirect to a login error page or display a message on the same page
            req.setAttribute("error", "Invalid username or password. Please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Pre-processing: forward the user to the login page
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}

