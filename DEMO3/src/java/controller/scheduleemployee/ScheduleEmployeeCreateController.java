/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.scheduleemployee;

import dal.EmployeeDBContext;
import dal.ScheduleCampaiqnDBContext;
import dal.ScheduleEmployeeDBContext;
import entity.Employee;
import entity.schedule.ScheduleCampaign;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xuant
 */
public class ScheduleEmployeeCreateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScheduleEmployeeCreateController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleEmployeeCreateController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int did = Integer.parseInt(request.getParameter("did"));
        EmployeeDBContext edb = new EmployeeDBContext();
        ArrayList<Employee> e = edb.getDepartmentbyID(did);

        int scid = Integer.parseInt(request.getParameter("scid"));
        ScheduleCampaiqnDBContext sqdb = new ScheduleCampaiqnDBContext();
        ScheduleCampaign schedule = sqdb.getScheduleCampaignById(scid);

        request.setAttribute("emps", e);
        request.setAttribute("schedule", schedule);
        request.getRequestDispatcher("../view/scheduleemployee/create.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ScheduleEmployeeDBContext sedb = new ScheduleEmployeeDBContext();
        ScheduleCampaiqnDBContext scdb = new ScheduleCampaiqnDBContext();
        int scid = Integer.parseInt(request.getParameter("scid"));
        ScheduleCampaign schedule = scdb.getScheduleCampaignById(scid);
        String[] eids = request.getParameterValues("eid");

        List<Integer> listEids = new ArrayList<>();
        List<Integer> listQuantities = new ArrayList<>();

        for (String eid_raw : eids) {
            int eid = Integer.parseInt(eid_raw);
            String paramName = "quantities" + eid;
            String quantityP = request.getParameter(paramName);

            if (quantityP != null && !quantityP.isEmpty()) {
                int quantity = Integer.parseInt(quantityP);

                listEids.add(eid);
                listQuantities.add(quantity);

            }
        }
        // Sử dụng hàm insertMultipleAssignments để lưu tất cả nhân viên cùng một lúc
        sedb.insertMultipleAssignments(scid, listEids, listQuantities);

        // Quay lại 2 trang trước bằng JavaScript
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>history.go(-2);</script>");
        out.close();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
