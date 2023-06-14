package model.admin;

public class Category {
    private int id, parent;
    private String name, parent_name;

    public Category(int id, int parent, String name, String parent_name) {
        this.id = id;
        this.parent = parent;
        this.name = name;
        this.parent_name = parent_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParent_name() {
        return parent_name;
    }

    public void setParent_name(String parent_name) {
        this.parent_name = parent_name;
    }
    
}
