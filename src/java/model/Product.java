//Created by Campus
package model;

import java.io.Serializable;
import jdk.internal.org.objectweb.asm.commons.StaticInitMerger;

public class Product implements Serializable {
    private int ID, price, quantity_sold, quantity_remain;
    //private String name, imgLink1, imgLink2, title, description, address;

    private String name, title, image1, image2, des;
    
    private Category category;

    public Product() {
    }
    
    public Product(int ID, String name, String title, Category category, String image1, String image2, String des, int price, int quantity_sold, int quantity_remain) {
        this.ID = ID;
        this.category = category;
        this.price = price;
        this.quantity_sold = quantity_sold;
        this.quantity_remain = quantity_remain;
        this.name = name;
        this.title = title;
        this.image1 = image1;
        this.image2 = image2;
        this.des = des;
        this.category = category;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity_sold() {
        return quantity_sold;
    }

    public void setQuantity_sold(int quantity_sold) {
        this.quantity_sold = quantity_sold;
    }

    public int getQuantity_remain() {
        return quantity_remain;
    }

    public void setQuantity_remain(int quantity_remain) {
        this.quantity_remain = quantity_remain;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
}