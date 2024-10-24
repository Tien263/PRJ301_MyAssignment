/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.productionplan;

import java.util.Date;

/**
 *
 * @author xuant
 */
public class PlanCampaiqn {
    private int id;
    private Plan plan;
    private Product product;
    private int quantity;
    private float cost;
    private java.util.Date timeNow;

    public Date getTimeNow() {
        return timeNow;
    }

    public void setTimeNow(Date timeNow) {
        this.timeNow = timeNow;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }
    
}
