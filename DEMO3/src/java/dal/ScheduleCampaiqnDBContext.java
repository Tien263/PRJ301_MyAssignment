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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
    public ArrayList<ScheduleCampaign> list() {
        ArrayList<ScheduleCampaign> sccs = new ArrayList<>();
        PreparedStatement command = null;

        try {
            String sql = "select scc.date, scc.shift,plc.quantity, p.start, p.[end] , pd.pname from ScheduleCampaiqn scc\n"
                    + "inner join PlanCampaiqn plc on scc.pcid = plc.pcid\n"
                    + "inner join [Plan] p on p.plid = plc.plid\n"
                    + "inner join Product pd on pd.pid = plc.pid";

            command = connection.prepareCall(sql);
            ResultSet rs = command.executeQuery();
            while (true) {                
                ScheduleCampaign scc = new ScheduleCampaign();
                scc.setDate(rs.getDate("date"));
                scc.setShift(rs.getString("shift"));
                
                PlanCampaiqn pc = new PlanCampaiqn();
                
                Plan p = new Plan();
                p.setStart(rs.getDate("start"));
                p.setEnd(rs.getDate("end"));
                pc.setPlan(p);
                
                Product pd = new Product();
                pd.setName(rs.getNString("pname"));
                pc.setProduct(pd);
                
                scc.setPlcampain(pc);
                
                sccs.add(scc);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleCampaiqnDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sccs;
    }

    @Override
    public ScheduleCampaign get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
