//Created by Campus 
//Controlled by PMC WAGNER
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.OrderItem;
import java.sql.Statement;
import model.User;
import model.Order;
import model.Product;

/**
 *
 * @author PC
 */

public class OrderDAO {
    
    Connection connection = null;
    PreparedStatement preS = null;
    ResultSet result = null;
    
    public boolean addOrder(Order order) {
        boolean check = false;
        
        //Queries
        String setOrderQuery = "INSERT INTO [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Orders] "
                                + "VALUES (GETDATE(), ?, ?, 0, ?, ?, N'Chưa thanh toán', N'Chờ xác nhận', NULL);";
        String setOrderItemQuery = "INSERT INTO [The_Gioi_Phu_Kien_Nhom_11].[dbo].[OrderItems] VALUES (?, ?, ?, ?);";
        
        String setQuantity = "UPDATE [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Products] "
                              + "SET quantity_remain=?,quantity_sold=?  WHERE id=?;";
        String getQuantity = "SELECT quantity_remain, quantity_sold "
                              + "FROM [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Products] WHERE id=?;";
        
        String getPrice = "SELECT price FROM [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Products] WHERE id=?;";
        
        
        try {
            connection = new DBConnection().getConnection();
            //Setup Transaction
            connection.setAutoCommit(false);
            
            //Insert Into Table Orders
            preS = connection.prepareStatement(setOrderQuery, Statement.RETURN_GENERATED_KEYS);
            preS.setInt(1, order.getClient().getId());
            preS.setInt(2, order.getCost());
            preS.setFloat(3, order.getFee());
            preS.setInt(4, order.getTotal());
            preS.executeUpdate();
            
            //Get Order ID created recently
            result = preS.getGeneratedKeys();
            result.next();
            int orderID = result.getInt(1);
            System.out.println("Order created successfully!!! & Order ID = " + orderID);
            
            //Insert into table OrderItems
            ArrayList<OrderItem> listOrderItems = order.getListOrderItems();
            for(int i = 0;i < listOrderItems.size();i++) {
                preS = connection.prepareStatement(setOrderItemQuery);
                preS.setInt(1, orderID);
                preS.setInt(2, listOrderItems.get(i).getProduct().getID());
                preS.setInt(3, listOrderItems.get(i).getQuantity());
                preS.setFloat(4, listOrderItems.get(i).getProduct().getPrice());
                preS.executeUpdate();
            }
            
            //Insert into table Products
            for(int i = 0;i < listOrderItems.size();i++) {
                preS = connection.prepareStatement(getQuantity);
                preS.setInt(1, listOrderItems.get(i).getProduct().getID());
                result = preS.executeQuery();
                result.next();
                int quantity_remain = result.getInt(1);  
                int quantity_sold = result.getInt(2);   
                System.out.println(quantity_remain);
                if(quantity_remain < listOrderItems.get(i).getQuantity()) {
                    connection.rollback();
                    connection.setAutoCommit(true);
                    return false;
                }        
                preS = connection.prepareStatement(setQuantity);
                preS.setInt(1, quantity_remain - listOrderItems.get(i).getQuantity());
                preS.setInt(2, quantity_sold + listOrderItems.get(i).getQuantity());
                preS.setInt(3, listOrderItems.get(i).getProduct().getID());
                preS.executeUpdate();
            }
            
            //Save Change
            connection.commit();
            connection.setAutoCommit(true);
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                if(connection != null) {
                    connection.rollback();
                    connection.setAutoCommit(true);
                }
                connection.setAutoCommit(true);
            } catch (SQLException rollbackException) {
                System.out.println("Rollback transaction error!!");
            }
            
        } finally {
            try {
                
                if(preS != null) {
                    preS.close();
                }
                if(connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Close connection error: " + e.getMessage());
            }
        }
        return check;
    }
    
    public Order getOrderByID(int orderID) {
        Order order = null;
        
        String query = "SELECT * FROM [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Orders] WHERE id = ?;";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setInt(1, orderID);
            result = preS.executeQuery();
            result.next();
            order = new Order(
                    result.getInt(1), 
                    result.getDate(2), 
                    new UserDAO().getUserByID(result.getInt(3)), 
                    result.getInt(4), 
                    result.getInt(5), 
                    result.getInt(6), 
                    result.getInt(7), 
                    result.getNString(8), 
                    result.getNString(9), 
                    result.getNString(10), 
                    new OrderItemDAO().getOrderItemByOrderID(orderID)
            );
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return order;
    }
    
    public ArrayList<Order> getOrderByClientID(int clientID) {
        ArrayList<Order> listOrder = null;
        
        String query = "SELECT * FROM [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Orders] WHERE user_id = ?;";
        
        try {
            //CategoryDAO categoryDAO = new CategoryDAO();
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setInt(1, clientID);
            result = preS.executeQuery();
            listOrder = new ArrayList<>();
            while(result.next()){
                //Add order into listOrder
                Order order = new Order();
                order.setId(result.getInt(1));
                order.setCreatedDate(result.getDate(2));
                order.setCost(result.getInt(4));
                order.setFee(result.getInt(6));
                order.setTotal(result.getInt(7));
                order.setPayment(result.getString(8));
                order.setDelivery(result.getString(9));
                listOrder.add(order);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }  
        return listOrder;
    }
}
