package context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Product> getProducts(){
        List<Product> list_Product = new ArrayList<>();
        String query = "SELECT * FROM Products";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list_Product.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
        } 
        return list_Product;
    }
    
    public void createProducts(String name, int price, int quantity, String des){
        String query = "INSERT INTO Products (name, price, quantity_remain, des) VALUES (?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setInt(3, quantity);
            ps.setString(4, des);
            ps.executeUpdate();
        } catch (Exception e) {
        } 
    }
    
    public void updateProducts(String name, int price, int quantity, String des, int id){
        String query = "UPDATE Products set name=?, price=?, quantity_remain=?, des=? where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setInt(3, quantity);
            ps.setString(4, des);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
        } 
    }
    
    public void deleteProducts(int id){
        String query = "DELETE Products WHERE id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        } 
    }
}
