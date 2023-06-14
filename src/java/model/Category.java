//Created by Campus
package model;

import java.io.Serializable;

public class Category implements Serializable {
    private int id, parent;
    
    //private String name, title, description;
    
    private String name, parent_name;
    
    public Category() {
    }

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

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", parent=" + parent + ", name=" + name + ", parent_name=" + parent_name + '}';
    }
    
}