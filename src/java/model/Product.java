package model;

public class Product {
    private int id;
    private String name, image, supplier, des;
    private int price, quantity_sold, quantity_remain;

    public Product(int id, String name, String image, String supplier, String des, int price, int quantity_sold, int quantity_remain) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.supplier = supplier;
        this.des = des;
        this.price = price;
        this.quantity_sold = quantity_sold;
        this.quantity_remain = quantity_remain;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
