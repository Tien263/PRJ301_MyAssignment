package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.EmployeeDBContext;
import entity.Employee;
import entity.accesscontrol.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EmployeeDeleteController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        resp.sendError(403,"you cannot access the feature using this way!");
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        // Lấy danh sách ID được chọn từ checkbox
        String[] selectedIds = req.getParameterValues("id");

        if (selectedIds != null) {
            EmployeeDBContext db = new EmployeeDBContext();
            for (String idStr : selectedIds) {
                int id = Integer.parseInt(idStr);
                Employee e = new Employee();
                e.setId(id);
                e.setStatus(false); // Đặt trạng thái thành false
                db.updateStatus(e); // Cập nhật trạng thái trong cơ sở dữ liệu
            }
        }

        resp.sendRedirect("list"); // Điều hướng về trang danh sách
    }
}

