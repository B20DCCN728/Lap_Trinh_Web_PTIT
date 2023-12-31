package dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.admin.Order;

public class OrderDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Order> getOrders(){
        List<Order> list_Order = new ArrayList<>();
        String query = "SELECT * FROM Orders";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list_Order.add(new Order(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
        } 
        return list_Order;
    }
    public List<Order> getOrders(String start_date, String finish_date){
        List<Order> list_Order = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE CONVERT(DATE, create_date, 120) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, start_date);
            ps.setString(2, finish_date);
            rs = ps.executeQuery();
            while(rs.next()){
                list_Order.add(new Order(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
        } 
        return list_Order;
    }
    public void createOrder(String create_date, int user_id, int cost, int discount, int fee, int total, String des){
        String query = "INSERT INTO Orders (create_date, user_id, cost, discount, fee, total, delivery, payment, des)  VALUES (?,?,?,?,?,?, 'Chờ xác nhận', 'Chưa thanh toán', ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, create_date);
            ps.setInt(2, user_id);
            ps.setInt(3, cost);
            ps.setInt(4, discount);
            ps.setInt(5, fee);
            ps.setInt(6, total);
            ps.setString(7, des);
            ps.executeUpdate();
            
        } catch (Exception e) {
        } 
    }
    public void updateOrder(String delivery, String payment, int id){
        String query = "UPDATE Orders set delivery=?, payment=? WHERE id=? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, delivery);
            ps.setString(2, payment);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
        } 
    }
}
