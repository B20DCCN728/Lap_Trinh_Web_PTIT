//Created by Campus
package model;

import java.io.Serializable;

public class OrderItem implements Serializable {
    private int id, orderID, quantity, price;
    private Product product;
    private int total;

    public OrderItem() {
    }

    public OrderItem(int id, int orderID, int quantity, Product product) {
        this.id = id;
        this.orderID = orderID;
        this.quantity = quantity;
        this.product = product;
    }
    
    public OrderItem(int id, int orderID, Product product, int quantity, int price) {
        this.id = id;
        this.orderID = orderID;
        this.quantity = quantity;
        this.product = product;
        this.price = price;
    }

//    public OrderItem(int id, int orderID, int quantity, int price, Product product, int total) {
//        this.id = id;
//        this.orderID = orderID;
//        this.quantity = quantity;
//        this.price = price;
//        this.product = product;
//        this.total = total;
//    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getTotal() {
        return quantity * product.getPrice();
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "id=" + id + ", orderID=" + orderID + ", quantity=" + quantity + ", price=" + price + ", product=" + product + ", total=" + total + '}';
    }
 
}
