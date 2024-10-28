/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.productionplan.Department;
import entity.productionplan.Type;
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
public class DepartmentDBContext extends DBContext<Department> {

    @Override
    public void insert(Department entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Department entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Department entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Department> list() {
        ArrayList<Department> depts = new ArrayList<>();
        PreparedStatement command = null;
        try {
            String sql = "SELECT did, dname FROM Department";

            command = connection.prepareStatement(sql);
            ResultSet rs = command.executeQuery();
            while (rs.next()) {
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                depts.add(d);
            }

        } catch (SQLException ex) {
            Logger.getLogger(dal.DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                command.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(dal.DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return depts;
    }

    public ArrayList<Department> get(String type) {
    ArrayList<Department> depts = new ArrayList<>();
    PreparedStatement command = null;
    try {
        String sql = "SELECT d.did, d.dname, t.tname " +
                     "FROM Department d INNER JOIN Type t ON d.tid = t.tid " +
                     "WHERE t.tname = ?";
        command = connection.prepareStatement(sql);
        command.setString(1, type);
        ResultSet rs = command.executeQuery();
        while (rs.next()) {
            Department d = new Department();
            d.setId(rs.getInt("did"));
            d.setName(rs.getString("dname"));
//            Type t = new Type();
//            t.setName(rs.getString("tname"));
//            d.setTypes(t);
            depts.add(d);
        }
    } catch (SQLException ex) {
        Logger.getLogger(dal.DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
            try {
                command.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(dal.DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    return depts;
}


    @Override
    public Department get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
