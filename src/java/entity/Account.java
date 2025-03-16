/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Account {
    private int id;
    private String fullname;
    private String phone;
    private String email;
    private String username;
    private String password;
    private int isSeller;
    private int isAdmin;

    public Account() {
    }

    public Account(int id, String fullname, String phone, String email, String username, String password, int isSeller, int isAdmin) {
        this.id = id;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.username = username;
        this.password = password;
        this.isSeller = isSeller;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsSeller() {
        return isSeller;
    }

    public void setIsSeller(int isSeller) {
        this.isSeller = isSeller;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", fullname=" + fullname + ", phone=" + phone + ", email=" + email + ", username=" + username + ", password=" + password + ", isSeller=" + isSeller + ", isAdmin=" + isAdmin + '}';
    }

    

    
    
    
}
