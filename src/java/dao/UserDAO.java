//Created by Campus
package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO {
    
    Connection connection = null;
    ResultSet result = null;
    PreparedStatement preS = null;
    
    public User checkLogin(String username, String password) throws NoSuchAlgorithmException {
        User myAccount = null;
        
        //Setting MD5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] hashedPassword = md.digest();
        
        String query = "SELECT * FROM [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Users] WHERE email = ? AND password =  ?;";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setString(1, username);
            preS.setBytes(2, hashedPassword);           
            result = preS.executeQuery();
            if(result.next()){       
                myAccount = new User(
                        result.getInt(1), 
                        result.getString(2), 
                        result.getDate(3), 
                        result.getString(4), 
                        result.getString(5), 
                        result.getString(6), 
                        result.getString(7), 
                        result.getInt(8), 
                        result.getString(9)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }        
        return myAccount;
    }
    
    public boolean checkAccountExist(String username) {
        
        String query = "SELECT * FROM [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Users] WHERE [email] = ?";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setString(1, username);          
            result = preS.executeQuery();
            if(result.next()){       
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }        
        return false;
    }
    
    public boolean registerAccount(User client) throws NoSuchAlgorithmException {
        //Setting MD5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(client.getPassword().getBytes());
        byte[] hashedPassword = md.digest();
        
        String query = "INSERT INTO [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Users] \n" +
                        "VALUES (?, null, ?, ?, ?, null, 0, null);";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setNString(1, client.getFullName());
            preS.setString(2, client.getPhone());
            preS.setString(3, client.getEmail());    
            preS.setBytes(4, hashedPassword); 
            preS.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }       
    }
    
    public User getUserByID(int userID) {
        User user = null;
        
        String query = "SELECT * FROM [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Users] WHERE id = ?;";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setInt(1, userID);
            result = preS.executeQuery();
            result.next();
            user = new User();
            user.setId(userID);
            user.setFullName(result.getNString(2));
            user.setDob(result.getDate(3));
            user.setPhone(result.getString(4));
            user.setEmail(result.getString(5));
            user.setAddress(result.getNString(7));
            user.setNode(result.getNString(9));
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean upDateClientInfo(User myAccount){
        boolean check = false;
        String query = "UPDATE [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Users]\n" +
                        "SET fullname = ?, dob = ?, phone = ?, email = ?, address = ?, note = ?\n" +
                        "WHERE id = ?;";
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setNString(1, myAccount.getFullName());
            preS.setDate(2, new Date(myAccount.getDob().getTime())); 
            preS.setString(3, myAccount.getPhone());
            preS.setString(4, myAccount.getEmail());
            preS.setNString(5, myAccount.getAddress());
            preS.setNString(6, myAccount.getNode());
            preS.setInt(7, myAccount.getId());
            
            preS.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    public boolean changePassword(User myAccount) throws NoSuchAlgorithmException {
        boolean check = false;
        //Setting MD5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(myAccount.getPassword().getBytes());
        byte[] hashedPassword = md.digest();
        
        String query = "UPDATE [The_Gioi_Phu_Kien_Nhom_11].[dbo].[Users]\n" +
                        "SET password = ?\n" +
                        "WHERE id = ?;";
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setBytes(1, hashedPassword);
            preS.setInt(2, myAccount.getId()); 
            
            preS.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
}
