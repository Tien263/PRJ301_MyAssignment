/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.schedule;

/**
 *
 * @author xuant
 */
public class Attendence {
    
    private int id;
    private Schedule_Detail schDeta;
    private int quantity;
    private double anpha;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Schedule_Detail getSchDeta() {
        return schDeta;
    }

    public void setSchDeta(Schedule_Detail schDeta) {
        this.schDeta = schDeta;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getAnpha() {
        return anpha;
    }

    public void setAnpha(double anpha) {
        this.anpha = anpha;
    }
    
    
}
