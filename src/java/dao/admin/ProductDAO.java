package dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.admin.Product;

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
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)
                ));
            }
        } catch (Exception e) {
        } 
        return list_Product;
    }
    
    public List<Product> getProducts(String s){
        List<Product> list_Product = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE name COLLATE Vietnamese_CI_AI LIKE N'%"+ s +"%' COLLATE Vietnamese_CI_AI" ;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list_Product.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)
                ));
            }
        } catch (Exception e) {
        } 
        return list_Product;
    }
    
    public void createProducts(String name, String title, int category_id, String image1, String image2, String des, int price, int quantity){
        String query = "INSERT INTO Products (name, title, category_id, image1, image2, des, price, quantity_remain) VALUES (?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, title);
            ps.setInt(3, category_id);
            ps.setString(4, image1);
            ps.setString(5, image2);
            ps.setString(6, des);
            ps.setInt(7, price);
            ps.setInt(8, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
        } 
    }
    
    public void updateProducts(String name, String title, int category_id, String image1, String image2, String des, int price, int quantity_remain, int id){
        String query = "UPDATE Products set name=?, title=?, category_id=?, image1=?, image2=?, des=?, price=?, quantity_remain=? where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, title);
            ps.setInt(3, category_id);
            ps.setString(4, image1);
            ps.setString(5, image2);
            ps.setString(6, des);
            ps.setInt(7, price);
            ps.setInt(8, quantity_remain);
            ps.setInt(9, id);
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
