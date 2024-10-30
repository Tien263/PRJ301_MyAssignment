/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.accesscontrol.BaseRBACController;
import entity.productionplan.Plan;
import entity.productionplan.PlanCampaiqn;
import entity.productionplan.Product;
import entity.schedule.ScheduleCampaign;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author xuant
 */
public class ScheduleCampaiqnDBContext extends DBContext<ScheduleCampaign> {

    @Override
    public void insert(ScheduleCampaign entity) {
        String sql_insert_scheduleCampaign = "INSERT INTO [ScheduleCampaiqn]\n"
                + "           ([pcid]\n"
                + "           ,[date]\n"
                + "           ,[shift]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm_insert_scheduleCampaign = connection.prepareCall(sql_insert_scheduleCampaign);
            stm_insert_scheduleCampaign.setInt(1, entity.getPlcampain().getId());
            stm_insert_scheduleCampaign.setDate(2, entity.getDate());
            stm_insert_scheduleCampaign.setString(3, entity.getShift());
            stm_insert_scheduleCampaign.setInt(4, entity.getQuantity());
            stm_insert_scheduleCampaign.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    @Override
    public void update(ScheduleCampaign entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(ScheduleCampaign entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ScheduleCampaign get(int id) {
        ScheduleCampaign scc = null;
        PreparedStatement command = null;

        try {
            String sql = "select p.plid, p.plname ,scc.date, scc.shift,plc.quantity, p.start, p.[end] , pd.pname from ScheduleCampaiqn scc\n"
                    + "inner join PlanCampaiqn plc on scc.pcid = plc.pcid\n"
                    + "inner join [Plan] p on p.plid = plc.plid\n"
                    + "inner join Product pd on pd.pid = plc.pid\n"
                    + "Where p.plid = ?";

            command = connection.prepareCall(sql);
            command.setInt(1, id);
            ResultSet rs = command.executeQuery();
            while (rs.next()) {

                scc = new ScheduleCampaign();
                scc.setDate(rs.getDate("date"));
                scc.setShift(rs.getString("shift"));

                PlanCampaiqn pc = new PlanCampaiqn();
                pc.setQuantity(rs.getInt("quantity"));

                Plan p = new Plan();
                p.setName(rs.getNString("plname"));
                p.setStart(rs.getDate("start"));
                p.setEnd(rs.getDate("end"));
                pc.setPlan(p);

                Product pd = new Product();
                pd.setName(rs.getNString("pname"));
                pc.setProduct(pd);

                scc.setPlcampain(pc);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ScheduleCampaiqnDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return scc;
    }

    @Override
    public ArrayList<ScheduleCampaign> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
