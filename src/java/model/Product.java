package model;

public class Product {
    private int id;
    private String name, des, supplier;
    private int price, quantity_remain;
    private String image;

    public Product(int id, String name, String des, String supplier, int price, int quantity_remain, String image) {
        this.id = id;
        this.name = name;
        this.des = des;
        this.supplier = supplier;
        this.price = price;
        this.quantity_remain = quantity_remain;
        this.image = image;
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
