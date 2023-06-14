//Created by Campus
package model;

import java.io.Serializable;

/**
 *
 * @author PC
 */
public class Comment implements Serializable {
    private int id, productID, clientID;
    private String fullName, title;

    public Comment() {
    }

    public Comment(int id, String fullName, String title) {
        this.id = id;
        this.fullName = fullName;
        this.title = title;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getClientID() {
        return clientID;
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
    }
    
    public Comment(int productID, int clientID, String title) {
        this.productID = productID;
        this.clientID = clientID;
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", fullName=" + fullName + ", title=" + title + '}';
    }   
    
}
