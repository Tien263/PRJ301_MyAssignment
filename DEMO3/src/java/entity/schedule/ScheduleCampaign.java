/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.schedule;

import entity.productionplan.PlanCampaiqn;
import java.sql.*;

/**
 *
 * @author xuant
 */
public class ScheduleCampaign {
    private int id;
    private PlanCampaiqn plcampain;
    private Date date;
    private String shift;
    private int quantity;

    public ScheduleCampaign() {
    }

    public ScheduleCampaign(int id, PlanCampaiqn plcampain, Date date, String shift, int quantity) {
        this.id = id;
        this.plcampain = plcampain;
        this.date = date;
        this.shift = shift;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public PlanCampaiqn getPlcampain() {
        return plcampain;
    }

    public void setPlcampain(PlanCampaiqn plcampain) {
        this.plcampain = plcampain;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
