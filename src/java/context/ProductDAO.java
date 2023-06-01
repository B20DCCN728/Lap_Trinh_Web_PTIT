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
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
        } catch (Exception e) {
        } 
        return list_Product;
    }
    
    public void createProducts(String name, String image, String supplier, int price, int quantity, String des){
        String query = "INSERT INTO Products (name, image, supplier, price, quantity_remain, des) VALUES (?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, supplier);
            ps.setInt(4, price);
            ps.setInt(5, quantity);
            ps.setString(6, des);
            ps.executeUpdate();
        } catch (Exception e) {
        } 
    }
    
    public void updateProducts(String name, String image, String supplier, int price, int quantity_remain, String des, int id){
        String query = "UPDATE Products set name=?, image=?, supplier=?, price=?, quantity_remain=?, des=? where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, supplier);
            ps.setInt(4, price);
            ps.setInt(5, quantity_remain);
            ps.setString(6, des);
            ps.setInt(7, id);
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
