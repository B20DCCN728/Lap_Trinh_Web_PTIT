//Created by Campus
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author PC
 */
public class CategoryDAO extends DBConnection {
    private Connection connection = null;
    private PreparedStatement preS = null;
    private ResultSet result = null;
    
    public CategoryDAO() {
        
    }
    
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> listCategory = new ArrayList<>();
            
        String query = "SELECT * FROM Categorys";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            result = preS.executeQuery();
            
            while(result.next()) {
                listCategory.add(new Category(
                    result.getInt(1),
                    result.getInt(2),
                    result.getNString(3),
                    result.getNString(4)
                ));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listCategory;
    }
    
    public Category getCategoryByID(int categoryID) {
        Category category = null;
        String query = "SELECT * FROM Categorys WHERE id = ?";
        
        try {
            connection = new DBConnection().getConnection();
            preS = connection.prepareStatement(query);
            preS.setInt(1, categoryID);
            result = preS.executeQuery();
            
            if(result.next()) {
                category = new Category(
                    result.getInt(1),
                    result.getInt(2),
                    result.getNString(3),
                    result.getNString(4)
                );
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }
    
}
