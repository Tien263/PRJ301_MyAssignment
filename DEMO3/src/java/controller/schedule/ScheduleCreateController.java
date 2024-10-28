package controller.schedule;

import dal.PlanCampaignDBContext;
import dal.PlanDBContext;
import dal.ProductDBContext;
import dal.ScheduleCampaiqnDBContext;
import entity.productionplan.Plan;
import entity.productionplan.PlanCampaiqn;
import entity.productionplan.Product;
import entity.schedule.ScheduleCampaign;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

public class ScheduleCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("plid"));
        PlanCampaignDBContext db = new PlanCampaignDBContext();
        PlanCampaiqn pcs = db.get(id);
        ProductDBContext p = new ProductDBContext();
        ArrayList<Product> product = p.list();
        LocalDate startDate = pcs.getPlan().getStart().toLocalDate();
        LocalDate endDate = pcs.getPlan().getEnd().toLocalDate();
        List<LocalDate> dates = new ArrayList<>();

        while (!startDate.isAfter(endDate)) {
            dates.add(startDate);
            startDate = startDate.plusDays(1);
        }

        if (pcs != null) {
            // Lấy ra danh sách các ID từ pcs (giả sử pcs có một phương thức để lấy các ID)
            List<Integer> pcids = getPcidList(pcs); // Hàm này bạn cần định nghĩa để lấy danh sách pcid

            request.setAttribute("productName", product);
            request.setAttribute("pcids", pcids); // Gửi danh sách pcid đến JSP
            request.setAttribute("planName", pcs.getPlan().getName());
            request.setAttribute("startDate", pcs.getPlan().getStart());
            request.setAttribute("endDate", pcs.getPlan().getEnd());
            request.setAttribute("quantity", pcs.getQuantity());
            request.setAttribute("dates", dates);
            request.getRequestDispatcher("../view/schedule/scheduleCampaign.jsp").forward(request, response);
        } else {
            response.sendError(404, "this employee does not exist!");
        }
    }

// Ví dụ phương thức lấy danh sách pcid
    private List<Integer> getPcidList(PlanCampaiqn pcs) {
        // Tạo danh sách các ID từ pcs
        // Đây là nơi bạn cần xác định logic để lấy danh sách ID từ pcs.
        // Ví dụ:
        List<Integer> pcids = new ArrayList<>();
        // Giả sử bạn có thể lấy ID từ pcs (ví dụ: từ một thuộc tính hoặc phương thức)
        for (int i = pcs.getId()-2; i <= pcs.getId(); i++) { // Ví dụ lấy ba ID bắt đầu từ pcs.getId()
            pcids.add(i);
        }
        return pcids;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ScheduleCampaiqnDBContext scdb = new ScheduleCampaiqnDBContext();
        PlanCampaignDBContext pcdb = new PlanCampaignDBContext();
        int plid = Integer.parseInt(request.getParameter("plid"));
        PlanCampaiqn plancampaign = pcdb.get(plid);

        String[] dates = request.getParameterValues("date");
        for (String date : dates) {
            for (int product = 1; product <= 3; product++) {
                for (int shift = 1; shift <= 3; shift++) {
                    String quantityK = request.getParameter("data[" + date + "][" + product + "][K" + shift + "]");
                    int quantity = Integer.parseInt(quantityK);
                    ScheduleCampaign schedule = new ScheduleCampaign();
                    schedule.setPlcampain(plancampaign);
                    schedule.setDate(Date.valueOf(date));
                    schedule.setShift("K" + shift);
                    schedule.setQuantity(quantity);
                    scdb.insert(schedule);
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
