package controller.schedule;

import dal.PlanCampaignDBContext;
import dal.PlanDBContext;
import dal.ScheduleCampaiqnDBContext;
import entity.productionplan.Plan;
import entity.productionplan.PlanCampaiqn;
import entity.schedule.ScheduleCampaign;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public class ScheduleCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int plid = Integer.parseInt(request.getParameter("plid"));
        int pcid = Integer.parseInt(request.getParameter("pcid"));

        PlanDBContext planDB = new PlanDBContext();
        Plan plan = planDB.get(plid);

        PlanCampaignDBContext planCampainDB = new PlanCampaignDBContext();
        PlanCampaiqn planCampain = planCampainDB.get(pcid);

        LocalDate startDate = plan.getStart().toLocalDate();
        LocalDate endDate = plan.getEnd().toLocalDate();
        List<LocalDate> dates = new ArrayList<>();
        while (!startDate.isAfter(endDate)) {
            dates.add(startDate);
            startDate = startDate.plusDays(1);
        }
        request.setAttribute("plan", plan);
        request.setAttribute("planCampain", planCampain);
        request.setAttribute("dates", dates);
        request.getRequestDispatcher("../view/schedule/scheduleCampaign.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ScheduleCampaiqnDBContext scdb = new ScheduleCampaiqnDBContext();
        PlanCampaignDBContext pcdb = new PlanCampaignDBContext();
        int id = Integer.parseInt(request.getParameter("pcid"));
        PlanCampaiqn planCampain = pcdb.get(id);
        String[] dates = request.getParameterValues("date");

        for (String date : dates) {
            // Lặp qua từng ca trong ngày để lấy dữ liệu số lượng
            for (int shift = 1; shift <= 3; shift++) {
                String paramName = "quantity" + date + "k" + shift;
                String quantityK = request.getParameter(paramName);  // Sửa cách lấy tên của tham số

                if (quantityK != null && !quantityK.isEmpty()) {  // Kiểm tra nếu tham số không trống
                    int quantity = Integer.parseInt(quantityK);

                    // Tạo đối tượng ScheduleCampaign và đặt các giá trị
                    ScheduleCampaign schedule = new ScheduleCampaign();
                    schedule.setPlcampain(planCampain);
                    schedule.setDate(Date.valueOf(date));
                    schedule.setShift("K" + shift);
                    schedule.setQuantity(quantityK != null && quantityK.length() > 0 ? quantity : 0);

                    // Thực hiện chèn vào database
                    scdb.insert(schedule);
                }
            }
        }
        response.sendRedirect("../productionplan/list");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
