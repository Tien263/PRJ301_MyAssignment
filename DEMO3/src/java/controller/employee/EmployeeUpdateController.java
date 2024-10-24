/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import controller.accesscontrol.BaseRequiredAuthenticationController;
import dal.DepartmentDBContext;
import dal.EmployeeDBContext;
import entity.productionplan.Department;
import entity.Employee;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author xuant
 */
public class EmployeeUpdateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        EmployeeDBContext db = new EmployeeDBContext();
        Employee e = db.get(id);
        if (e != null) {
            DepartmentDBContext dbDept = new DepartmentDBContext();
            ArrayList<Department> depts = dbDept.list();
            request.setAttribute("e", e);
            request.setAttribute("depts", depts);
            request.getRequestDispatcher("../view/employee/edit.jsp").forward(request, response);
        } else {
            response.sendError(404, "this employee does not exist!");
        }

    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        // Lấy các tham số từ request
        String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        String raw_dob = request.getParameter("dob");
        String raw_address = request.getParameter("address");
        String raw_did = request.getParameter("did");

        // Tạo đối tượng Employee và gán giá trị từ các tham số
        Employee e = new Employee();
        e.setId(Integer.parseInt(raw_id));
        e.setName(raw_name);
        e.setAddress(raw_address);
        e.setGender(raw_gender.equals("male"));
        e.setDob(Date.valueOf(raw_dob));

        Department d = new Department();
        d.setId(Integer.parseInt(raw_did));
        e.setDept(d);

        e.setUpdatedby(account);

        // Lưu dữ liệu vào cơ sở dữ liệu
        EmployeeDBContext db = new EmployeeDBContext();
        db.update(e);

        // Chuyển hướng về trang human_resources.jsp sau khi cập nhật thành công
        response.sendRedirect("list");
    }

}
