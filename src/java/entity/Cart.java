/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
// gio hang chua cac item
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    public Item getItemById(int id){
        for (Item item : items) {
            if(item.getFood().getId()==id){
                return item;
            }
        }
        return null;
    }
    public int getItemById2(int id) {
    for (Item item : items) {
        if (item.getFood().getId() == id) {
            return item.getQuantity(); // Trả về số lượng nếu tìm thấy
        }
    }
    return 0; // Trả về 0 nếu không tìm thấy
}
    
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    
    // them vao gio hang
    public void addItem(Item t){
        // co o trong cart r
        if(getItemById(t.getFood().getId()) != null){
            Item i = getItemById(t.getFood().getId());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        }else {
            // chua co
            items.add(t);
        }
    }
    
    // bo di do an trong gio hang
    public void removeItem(int id){
        // co trong gio hang r
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    
    // total money
    public double getTotalMoney(){
        double t=0;
        for (Item item : items) {
            t+=item.getPrice()*item.getQuantity();
        }
        return t;
    }
}
