//Created by Campus
package model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private int id;
    private String fullName;
    private Date dob;
    private String phone;
    private String email;
    private String password;
    private String address;
    private int isAdmin;
    private String node;

    public User() {
    }

    public User(int id, String fullName, Date dob, String phone, String email, String password, String address, int isAdmin, String node) {
        this.id = id;
        this.fullName = fullName;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.address = address;
        this.isAdmin = isAdmin;
        this.node = node;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", fullName=" + fullName + ", dob=" + dob + ", phone=" + phone + ", email=" + email + ", password=" + password + ", address=" + address + ", isAdmin=" + isAdmin + ", node=" + node + '}';
    }
    
}
