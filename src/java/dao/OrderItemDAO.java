//Created by Campus
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.OrderItem;
import model.Product;

/**
 *
 * @author PC
 */
public class OrderItemDAO {
    
    Connection connection = null;
    ResultSet result = null;
    PreparedStatement preS = null;
    
    public ArrayList<OrderItem> getOrderItemByOrderID(int orderID) {
        ArrayList<OrderItem> listItem = null;
        String query = "SELECT * FROM [The_Gioi_Phu_Kien_Nhom_11].[dbo].[OrderItems] WHERE order_id = ?;";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setInt(1, orderID);
            result = preS.executeQuery();
            listItem = new ArrayList<>();
            while(result.next()) {
                OrderItem item = new OrderItem(
                        result.getInt(1), 
                        orderID, 
                        new ProductDAO().getProductByID(result.getInt(3)), 
                        result.getInt(4), 
                        result.getInt(5)
                );
                listItem.add(item);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return listItem;
    }
}
