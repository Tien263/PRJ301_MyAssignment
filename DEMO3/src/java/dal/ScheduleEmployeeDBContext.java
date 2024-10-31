/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.schedule.Schedule_Detail;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author xuant
 */
public class ScheduleEmployeeDBContext extends DBContext<Schedule_Detail> {

    @Override
    public void insert(Schedule_Detail entity) {
        String sql = "INSERT INTO [Schedule_Detail]\n"
                + "           ([scid]\n"
                + "           ,[eid]\n"
                + "           ,[quatity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";

        PreparedStatement stm;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getSchCamps().getId());
            stm.setInt(2, entity.getEmps().getId());
            stm.setInt(3, entity.getQuatity());
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
    
    public void insertMultipleAssignments(int scid, List<Integer> eids, List<Integer> quantities) {
        String sql = "INSERT INTO [Schedule_Detail]\n"
                + "           ([scid]\n"
                + "           ,[eid]\n"
                + "           ,[quatity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            connection.setAutoCommit(false); // Tắt auto-commit để thực hiện nhiều insert trong cùng 1 giao dịch

            PreparedStatement stm = connection.prepareStatement(sql);
            for (int i = 0; i < eids.size(); i++) {
                stm.setInt(1, scid);
                stm.setInt(2, eids.get(i));
                stm.setInt(3, quantities.get(i));
                stm.addBatch();
            }
            stm.executeBatch(); // Thực hiện tất cả các insert
            connection.commit(); // Commit để lưu các thay đổi vào database
        } catch (SQLException ex) {
            ex.printStackTrace();
            try {
                if (connection != null) {
                    connection.rollback(); // Rollback nếu có lỗi xảy ra
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    public void update(Schedule_Detail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Schedule_Detail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Schedule_Detail> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Schedule_Detail get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
