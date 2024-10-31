/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.productionplan.Department;
import entity.productionplan.Plan;
import entity.productionplan.PlanCampaiqn;
import entity.productionplan.Product;
import java.sql.*;
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
        String sql_delete = "DELETE FROM [dbo].[PlanCampaiqn]\n"
                + "      WHERE pcid = ?";

        PreparedStatement stm_delete = null;
        try {
            stm_delete = connection.prepareStatement(sql_delete);
            stm_delete.setInt(1, entity.getId());
            stm_delete.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public ArrayList<PlanCampaiqn> list() {
        ArrayList<PlanCampaiqn> pcs = new ArrayList<>();
        PreparedStatement command = null;
        try {
            String sql = "select p.plid, pc.pcid, p.plname, d.dname, p.start, pd.pname, pc.quantity from [Plan] p \n"
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
                p.setId(rs.getInt("plid"));
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

        PlanCampaiqn pcs = null;
        PreparedStatement command = null;
        try {
            String sql = "select pc.pcid, pc.quantity, p.pid, p.pname from PlanCampaiqn pc \n"
                    + "inner join Product p on pc.pid = p.pid\n"
                    + "Where pc.pcid = ?";
            command = connection.prepareCall(sql);
            command.setInt(1, id);
            ResultSet rs = command.executeQuery();
            if (rs.next()) {
                pcs = new PlanCampaiqn();
                pcs.setId(rs.getInt("pcid"));
                pcs.setQuantity(rs.getInt("quantity"));

                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setName(rs.getNString("pname"));
                pcs.setProduct(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PlanCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
    
    public ArrayList<PlanCampaiqn> search(String planName) {
        ArrayList<PlanCampaiqn> pcs = new ArrayList<>();
        PreparedStatement command = null;
        try {
            String sql = "SELECT p.plid, pc.pcid, p.plname, d.dname, p.start, pd.pname, pc.quantity FROM [Plan] p " +
                         "INNER JOIN [PlanCampaiqn] pc ON p.plid = pc.plid " +
                         "INNER JOIN [Product] pd ON pc.pid = pd.pid " +
                         "INNER JOIN [Department] d ON p.did = d.did " +
                         "WHERE p.plname LIKE ?";
            command = connection.prepareStatement(sql);
            command.setString(1, "%" + planName + "%");
            ResultSet rs = command.executeQuery();
            while (rs.next()) {
                PlanCampaiqn pc = new PlanCampaiqn();
                pc.setId(rs.getInt("pcid"));
                pc.setQuantity(rs.getInt("quantity"));

                Plan p = new Plan();
                p.setId(rs.getInt("plid"));
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
            Logger.getLogger(PlanCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
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

}
