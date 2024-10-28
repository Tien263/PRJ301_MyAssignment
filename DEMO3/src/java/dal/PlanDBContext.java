/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.productionplan.Department;
import java.sql.PreparedStatement;
import entity.productionplan.Plan;
import entity.productionplan.PlanCampaiqn;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

/**
 *
 * @author xuant
 */
public class PlanDBContext extends DBContext<Plan> {

    @Override
    public void insert(Plan entity) {
        try {
            connection.setAutoCommit(false);

            String sql_insert_plan = "INSERT INTO [Plan]\n"
                    + "           ([plname]\n"
                    + "           ,[start]\n"
                    + "           ,[end]\n"
                    + "           ,[did])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm_insert_plan = connection.prepareStatement(sql_insert_plan);
            stm_insert_plan.setNString(1, entity.getName());
            stm_insert_plan.setDate(2, entity.getStart());
            stm_insert_plan.setDate(3, entity.getEnd());
            stm_insert_plan.setInt(4, entity.getDept().getId());
            stm_insert_plan.executeUpdate();

            String sql_select_plan = "SELECT @@IDENTITY as plid";
            PreparedStatement stm_select_plan = connection.prepareStatement(sql_select_plan);
            ResultSet rs = stm_select_plan.executeQuery();
            if (rs.next()) {
                entity.setId(rs.getInt("plid"));
            }

            for (PlanCampaiqn campain : entity.getCampains()) {
                String sql_insert_campain = "INSERT INTO [PlanCampaiqn]\n"
                        + "           ([plid]\n"
                        + "           ,[pid]\n"
                        + "           ,[quantity]\n"
                        + "           ,[cost])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";

                PreparedStatement stm_insert_campain = connection.prepareStatement(sql_insert_campain);
                stm_insert_campain.setInt(1, entity.getId());
                stm_insert_campain.setInt(2, campain.getProduct().getId());
                stm_insert_campain.setInt(3, campain.getQuantity());
                stm_insert_campain.setFloat(4, campain.getCost());
                stm_insert_campain.executeUpdate();
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void update(Plan entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Plan entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Plan> list() {

        ArrayList<Plan> plans = new ArrayList<>();
        PreparedStatement command = null;
        try {
            String sql = "select * from [Plan]";
            command = connection.prepareStatement(sql);
            ResultSet rs = command.executeQuery();

            while (rs.next()) {
                Plan p = new Plan();
                p.setId(rs.getInt("plid"));
                p.setName(rs.getNString("plname"));
                p.setStart(rs.getDate("start"));
                p.setEnd(rs.getDate("end"));

                Department d = new Department();
                d.setId(rs.getInt("did"));
                p.setDept(d);

                plans.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return plans;
    }

    @Override
    public Plan get(int id) {
        Plan p = null;
        PreparedStatement command = null;
        try {
            String sql = "select* from [Plan] where plid = ?";
            command = connection.prepareCall(sql);
            command.setInt(1, id);
            ResultSet rs = command.executeQuery();
            if (rs.next()) {
                p = new Plan();
                p.setId(rs.getInt("plid"));
                p.setName(rs.getNString("plname"));
                p.setStart(rs.getDate("start"));
                p.setEnd(rs.getDate("end"));

                Department d = new Department();
                d.setName(rs.getNString("did"));
                p.setDept(d);

            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                command.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return p;

    }

}
