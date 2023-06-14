//Created by Campus
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Email;
import model.Product;

public class EmailDAO {
    
    Connection connection = null;
    ResultSet result = null;
    PreparedStatement preS = null;
    
    public boolean checkEmailExist(String email){
        String query = "SELECT * FROM tblEmail WHERE email = ?";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setString(1, email);
            result = preS.executeQuery();
            if(result.next()) {
                return true;
            }            
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
        return false;
    }
    
    public boolean insertEmail(String email) {
        String query = "INSERT INTO tblEmail VALUES(?)";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setString(1, email);
            preS.executeUpdate();
            if(result.next()) {
                return true;
            }            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public ArrayList<Email> getAllEmails() {
        ArrayList<Email> listEmail = new ArrayList<>();
        
        String query = "SELECT * FROM tblEmail";
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            result = preS.executeQuery();
            while(result.next()){
                //add list items into ArrayList             
                listEmail.add(new Email(
                        result.getString(2)
                ));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return listEmail;
    }
    
}
