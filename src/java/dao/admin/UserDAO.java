package dao.admin;

import dao.admin.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.admin.User;

public class UserDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<User> getUsers(){
        List<User> list_User = new ArrayList<>();
        String query = "SELECT * FROM Users";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list_User.add(new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        } 
        return list_User;
    }
    
    public List<User> getUsers(String s){
        List<User> list_User = new ArrayList<>();
        String query = "SELECT * FROM Users WHERE fullname COLLATE Vietnamese_CI_AI LIKE N'%"+ s +"%' COLLATE Vietnamese_CI_AI";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list_User.add(new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        } 
        return list_User;
    }
}
