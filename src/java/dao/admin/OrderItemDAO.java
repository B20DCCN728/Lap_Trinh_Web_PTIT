package dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.admin.OrderItem;

public class OrderItemDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<OrderItem> getOrderItems(){
        List<OrderItem> list_OrderItem = new ArrayList<>();
        String query = "SELECT * FROM OrderItems";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list_OrderItem.add(new OrderItem(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (Exception e) {
        } 
        return list_OrderItem;
    }
    
    public List<OrderItem> getOrderItems(int Id){
        List<OrderItem> list_OrderItem = new ArrayList<>();
        String query = "SELECT * FROM OrderItems WHERE order_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs = ps.executeQuery();
            while(rs.next()){
                list_OrderItem.add(new OrderItem(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (Exception e) {
        } 
        return list_OrderItem;
    }
}
