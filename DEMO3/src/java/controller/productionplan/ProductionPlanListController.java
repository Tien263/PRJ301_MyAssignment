/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.productionplan;

import controller.accesscontrol.BaseRBACController;
import dal.PlanCampaignDBContext;
import entity.accesscontrol.User;
import entity.productionplan.PlanCampaiqn;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


/**
 *
 * @author xuant
 */
public class ProductionPlanListController extends BaseRBACController{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PlanCampaignDBContext db = new PlanCampaignDBContext();
        ArrayList<PlanCampaiqn> pcs = db.list();

        // Lấy thời gian hiện tại
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(now);
        
        // Thêm danh sách pcs và thời gian hiện tại vào request
        request.setAttribute("pcs", pcs);
        request.setAttribute("timeNow", formattedDate);

        // Chuyển tiếp tới JSP
        request.getRequestDispatcher("../view/productionplan/productionPlanList.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        processRequest(request, response);
    }
    
}
