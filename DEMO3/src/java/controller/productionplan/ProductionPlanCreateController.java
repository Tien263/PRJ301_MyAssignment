/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.productionplan;


import controller.accesscontrol.BaseRBACController;
import dal.DepartmentDBContext;
import dal.PlanDBContext;
import dal.ProductDBContext;
import entity.accesscontrol.User;
import entity.productionplan.Department;
import entity.productionplan.Plan;
import entity.productionplan.PlanCampaiqn;
import entity.productionplan.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

/**
 *
 * @author xuant
 */
public class ProductionPlanCreateController extends BaseRBACController{

     
    
    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        ProductDBContext dbProduct = new ProductDBContext();
        DepartmentDBContext dbDepts = new DepartmentDBContext();
        
        request.setAttribute("products", dbProduct.list());
        request.setAttribute("depts", dbDepts.get("Workshop"));
        
        request.getRequestDispatcher("../view/productionplan/production_dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        
        Plan plan = new Plan();
        plan.setName(request.getParameter("name"));
        plan.setStart(Date.valueOf(request.getParameter("from")));
        plan.setEnd(Date.valueOf(request.getParameter("to")));
        Department d = new Department();
        d.setId(Integer.parseInt(request.getParameter("did")));
        plan.setDept(d);
        
        String[] pids = request.getParameterValues("pid");
        for (String pid : pids) {
            PlanCampaiqn c = new PlanCampaiqn();
            
            Product p = new Product();
            p.setId(Integer.parseInt(pid));
            c.setProduct(p);
            c.setPlan(plan);
            
            String raw_quantity = request.getParameter("quantity"+pid);
            String raw_cost = request.getParameter("cost"+pid);
             
            c.setQuantity(raw_quantity!=null&&raw_quantity.length()>0?Integer.parseInt(raw_quantity):0);
            c.setCost(raw_cost!=null&&raw_cost.length()>0?Float.parseFloat(raw_cost):0);
            
            if(c.getQuantity()>0 && c.getCost()>0)
                plan.getCampains().add(c);
        }
        
        if(plan.getCampains().size()>0)
        {
            //insert
            PlanDBContext db = new PlanDBContext();
            db.insert(plan);
            response.getWriter().println("your plan has been added!");
        }
        else
        {
            response.getWriter().println("your plan does not have any products / campains");
        }
        
    }

    
}


