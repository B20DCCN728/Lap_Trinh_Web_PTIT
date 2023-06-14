//Created by Campus
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    /*Insert your other code right after this comment*/
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    
    private Connection connection = null;
    
    public DBConnection(){
    }  
   
    public Connection getConnection() throws Exception {
        String urlDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // url Driver MySql
        String url = "jdbc:sqlserver://" + "CAMPUS" + ":" + "1433" 
                     + ";databaseName=The_Gioi_Phu_Kien_Nhom_11;"
                     + "username=sa;password=123456;trustServerCertificate=true";     
        if(connection == null){ 
            try {
                Class.forName(urlDriver);
                connection = DriverManager.getConnection(url);                 
            } catch (Exception e) {
                e.printStackTrace(); 
            }
        }
        return connection;
    }   
    
}
