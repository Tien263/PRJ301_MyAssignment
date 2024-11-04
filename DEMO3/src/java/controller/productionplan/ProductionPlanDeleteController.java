/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.productionplan;

import controller.accesscontrol.BaseRBACController;
import dal.EmployeeDBContext;
import dal.PlanCampaignDBContext;
import entity.Employee;
import entity.accesscontrol.User;
import entity.productionplan.PlanCampaiqn;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author xuant
 */
@WebServlet(name="ProductionPlanDeleteController", urlPatterns={"/productionplan/delete"})
public class ProductionPlanDeleteController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PlanCampaiqn pc = new PlanCampaiqn();
        pc.setId(id);
        PlanCampaignDBContext db = new PlanCampaignDBContext();
        db.delete(pc);
        response.sendRedirect("list");
    }

}
