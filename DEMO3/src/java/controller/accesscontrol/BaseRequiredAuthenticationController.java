/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.accesscontrol;

import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author xuant
 */
public abstract class BaseRequiredAuthenticationController extends HttpServlet {
    
    private boolean isAuthenticated(HttpServletRequest request)
    {
      User user = (User)request.getSession().getAttribute("account");
      return user != null;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(isAuthenticated(request))
        {
             //do business logic here
            User user = (User)request.getSession().getAttribute("account");
            doPost(request, response, user);
        }
        else
            response.sendError(403,"You do n't have right to access");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(isAuthenticated(request))
        {
            //do business logic here
            User user = (User)request.getSession().getAttribute("account");
            doGet(request, response, user);
        }
        else
            response.sendError(403,"You do n't have right to access");
    }
    
    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException;
    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException;
    
}
