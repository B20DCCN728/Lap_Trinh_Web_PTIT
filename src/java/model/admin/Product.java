package model.admin;

public class Product {
    private int id;
    private String name, title;
    private int category_id;
    private String image1, image2, des;
    private int price, quantity_sold, quantity_remain;

    public Product(int id, String name, String title, int category_id, String image1, String image2, String des, int price, int quantity_sold, int quantity_remain) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.category_id = category_id;
        this.image1 = image1;
        this.image2 = image2;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
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

}
