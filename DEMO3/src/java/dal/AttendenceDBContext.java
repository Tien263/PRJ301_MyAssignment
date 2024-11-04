/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.schedule.Attendence;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author xuant
 */
public class AttendenceDBContext extends DBContext<Attendence>{

    @Override
    public void insert(Attendence entity) {
        
     String sql = "INSERT INTO Attendence (seid, Quantity, Alpha) VALUES (?, ?, ?)";

        try {
            // Tạo PreparedStatement để thực hiện câu lệnh SQL
            PreparedStatement stm = connection.prepareStatement(sql);

            // Gán các giá trị cho tham số
            stm.setInt(1, entity.getSchDeta().getId()); // Tham chiếu tới ScheduleEmployee ID
            stm.setInt(2, entity.getQuantity()); // Số lượng hoàn thành
            stm.setDouble(3, entity.getAnpha()); // Chỉ số alpha

            // Thực hiện câu lệnh
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Đóng kết nối sau khi sử dụng
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    public void update(Attendence entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendence entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendence> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendence get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
