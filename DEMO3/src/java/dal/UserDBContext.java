/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.accesscontrol.Feature;
import entity.accesscontrol.Role;
import entity.accesscontrol.User;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt-local
 */
public class UserDBContext extends DBContext<User> {

    public ArrayList<Role> getRoles(String username) {
        String sql = "select r.rid,r.rname,f.fid,f.fname,f.url from [User] u \n"
                + "inner join UserRole ur on ur.username = u.username\n"
                + "inner join [Role] r on r.rid = ur.rid\n"
                + "inner join RoleFeature rf on rf.rid = r.rid\n"
                + "inner join Feature f on f.fid = rf.fid\n"
                + "where u.username = ?;";

        PreparedStatement stm = null;
        ArrayList<Role> roles = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            Role c_role = new Role();
            c_role.setRid(-1);
            while (rs.next()) {
                int rid = rs.getInt("rid");
                if (rid != c_role.getRid()) {
                    c_role = new Role();
                    c_role.setRid(rid);
                    c_role.setRname(rs.getString("rname"));
                    roles.add(c_role);
                }

                Feature f = new Feature();
                f.setFid(rs.getInt("fid"));
                f.setFname(rs.getString("fname"));
                f.setUrl(rs.getString("url"));
                c_role.getFeatures().add(f);
                f.setRoles(roles);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return roles;
    }

public User get(String username, String password) {
    String sql = "SELECT r.rid AS role_id, r.rname AS role_name, u.username, u.password, u.is_active " +
                 "FROM Role r " +
                 "INNER JOIN UserRole ur ON ur.rid = r.rid " +
                 "INNER JOIN [User] u ON u.username = ur.username " +
                 "WHERE u.username = ? AND u.password = ?";
    PreparedStatement stm = null;
    User user = null;
    try {
        stm = connection.prepareStatement(sql);
        stm.setString(1, username);
        stm.setString(2, password);
        ResultSet rs = stm.executeQuery();
        
        // Initialize the user and roles list if there is at least one result
        while (rs.next()) {
            if (user == null) {
                user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setIs_active(rs.getBoolean("is_active"));
            }
            
            // Create a Role object for each row and add it to the user's roles list
            Role role = new Role();
            role.setRid(rs.getInt("role_id"));
            role.setRname(rs.getString("role_name"));
            user.addRole(role); // Add role to the list
        }
    } catch (SQLException ex) {
        Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            if (stm != null) stm.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return user;
}





    @Override
    public void insert(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
