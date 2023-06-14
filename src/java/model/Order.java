//Created by Campus
package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Order implements Serializable {
    private int id;
    private Date createdDate;
    private User client;
    private int cost;
    private int discount;
    private int fee;
    private int total;
    private String payment;
    private String delivery;
    private String note;
    private ArrayList<OrderItem> listOrderItems;

    public Order() {
    }

    public Order(int id, Date createdDate, User client, int cost, 
            int discount, int fee, int total, String payment, String delivery, 
            String note, ArrayList<OrderItem> listOrderItems) {
        
        this.id = id;
        this.createdDate = createdDate;
        this.client = client;
        this.cost = cost;
        this.discount = discount;
        this.fee = fee;
        this.total = total;
        this.payment = payment;
        this.delivery = delivery;
        this.note = note;
        this.listOrderItems = listOrderItems;
        
    }

    public Order(User client, int cost, int fee, int total, ArrayList<OrderItem> listOrderItems) {
        this.client = client;
        this.cost = cost;
        this.fee = fee;
        this.total = total;
        this.listOrderItems = listOrderItems;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public User getClient() {
        return client;
    }

    public void setClient(User client) {
        this.client = client;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public ArrayList<OrderItem> getListOrderItems() {
        return listOrderItems;
    }

    public void setListOrderItems(ArrayList<OrderItem> listOrderItems) {
        this.listOrderItems = listOrderItems;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", createdDate=" + createdDate + ", client=" + client + ", cost=" + cost + ", discount=" + discount + ", fee=" + fee + ", total=" + total + ", payment=" + payment + ", delivery=" + delivery + ", note=" + note + ", listOrderItems=" + listOrderItems + '}';
    }
    
}
