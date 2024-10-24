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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author xuant
 */
public class EmployeeCreateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        DepartmentDBContext db = new DepartmentDBContext();
        ArrayList<Department> depts = db.list();
        request.setAttribute("depts", depts);
        request.getRequestDispatcher("../view/employee/add.jsp").forward(request, response);
    }

   @Override
protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
    // Đọc các tham số
    String raw_name = request.getParameter("name");
    String raw_gender = request.getParameter("gender");
    String raw_dob = request.getParameter("dob");
    String raw_address = request.getParameter("address");
    String raw_did = request.getParameter("did");

    // Tạo đối tượng Employee và ràng buộc dữ liệu
    Employee e = new Employee();
    e.setName(raw_name);
    e.setAddress(raw_address);
    e.setGender(raw_gender.equals("male"));
    e.setDob(Date.valueOf(raw_dob));

    Department d = new Department();
    int did = Integer.parseInt(raw_did);
    d.setId(did);
    e.setDept(d);

    e.setCreatedby(account);
    e.setStatus(true); // Đặt status là true khi tạo mới

    // Lưu dữ liệu vào cơ sở dữ liệu
    EmployeeDBContext db = new EmployeeDBContext();
    db.insert(e);

    // Điều hướng người dùng về trang human_resources sau khi tạo mới thành công
    response.sendRedirect("list");
}


}
