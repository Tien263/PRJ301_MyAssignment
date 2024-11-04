/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.scheduleemployee;

import controller.accesscontrol.BaseRBACController;
import dal.ScheduleCampaiqnDBContext;
import entity.accesscontrol.User;
import entity.schedule.ScheduleCampaign;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author xuant
 */
@WebServlet(name = "ScheduleCampaignWS5List", urlPatterns = {"/scheduleemployee/listws5"})
public class ScheduleCampaignWS5List extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        ScheduleCampaiqnDBContext db = new ScheduleCampaiqnDBContext();
        ArrayList<ScheduleCampaign> sc = db.get("Production Workshop No. 5");

        request.setAttribute("sc", sc);
        request.getRequestDispatcher("../view/scheduleemployee/listws5.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}