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
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author xuant
 */
@WebServlet(name = "ProductionPlanSearchController", urlPatterns = {"/productionplan/search"})
public class ProductionPlanSearchController extends BaseRBACController {


    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        // Lấy từ khóa tìm kiếm từ request
        String planName = request.getParameter("search");

        // Khởi tạo đối tượng DBContext và tìm kiếm kế hoạch theo tên
        PlanCampaignDBContext db = new PlanCampaignDBContext();
        ArrayList<PlanCampaiqn> searchResults = db.search(planName);

        // Lấy thời gian hiện tại
        Date now = new Date();

        
        // Gán kết quả tìm kiếm vào request
        request.setAttribute("pcs", searchResults);
        request.setAttribute("timeNow", now);

        // Chuyển hướng tới trang JSP hiển thị kết quả tìm kiếm
        request.getRequestDispatcher("../view/productionplan/productionPlanList.jsp").forward(request, response);
    }

}
