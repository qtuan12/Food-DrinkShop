/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
// day do an vao gio hang
public class Item {
    private Drink food;
    private int quantity;
    private double price;

    public Item() {
    }

    public Item(Drink food, int quantity, double price) {
        this.food = food;
        this.quantity = quantity;
        this.price = price;
    }

    public Drink getFood() {
        return food;
    }

    public void setFood(Drink food) {
        this.food = food;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
