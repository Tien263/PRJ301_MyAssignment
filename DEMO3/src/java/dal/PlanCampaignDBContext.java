/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.productionplan.Department;
import entity.productionplan.Plan;
import entity.productionplan.PlanCampaiqn;
import entity.productionplan.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author xuant
 */
public class PlanCampaignDBContext extends DBContext<PlanCampaiqn> {

    @Override
    public void insert(PlanCampaiqn entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(PlanCampaiqn entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(PlanCampaiqn entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<PlanCampaiqn> list() {
        ArrayList<PlanCampaiqn> pcs = new ArrayList<>();
        PreparedStatement command = null;
        try {
            String sql = "select pc.pcid, p.plname, d.dname, p.start, pd.pname, pc.quantity from [Plan] p \n"
                    + "inner join [PlanCampaiqn] pc on p.plid = pc.plid\n"
                    + "inner join [Product] pd on pc.pid = pd.pid\n"
                    + "inner join [Department] d on p.did = d.did";
            command = connection.prepareStatement(sql);
            ResultSet rs = command.executeQuery();
            while (rs.next()) {
                PlanCampaiqn pc = new PlanCampaiqn();
                pc.setId(rs.getInt("pcid"));
                pc.setQuantity(rs.getInt("quantity"));

                Plan p = new Plan();
                p.setName(rs.getNString("plname"));
                p.setStart(rs.getDate("start"));

                Department d = new Department();
                d.setName(rs.getString("dname"));
                p.setDept(d);

                Product pd = new Product();
                pd.setName(rs.getNString("pname"));
                pc.setProduct(pd);

                pc.setPlan(p);

                pcs.add(pc);

            }

        } catch (SQLException ex) {
            Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                command.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return pcs;
    }

    @Override
    public PlanCampaiqn get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
