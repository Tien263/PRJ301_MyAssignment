/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.schedule;

import entity.Employee;

/**
 *
 * @author xuant
 */
public class Schedule_Detail {
    
    private int id;
    private ScheduleCampaign  schCamps;
    private Employee emps;
    private int quatity;

    public Schedule_Detail() {
    }

    public Schedule_Detail(int id, ScheduleCampaign schCamps, Employee emps, int quatity) {
        this.id = id;
        this.schCamps = schCamps;
        this.emps = emps;
        this.quatity = quatity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ScheduleCampaign getSchCamps() {
        return schCamps;
    }

    public void setSchCamps(ScheduleCampaign schCamps) {
        this.schCamps = schCamps;
    }

    public Employee getEmps() {
        return emps;
    }

    public void setEmps(Employee emps) {
        this.emps = emps;
    }

    public int getQuatity() {
        return quatity;
    }

    public void setQuatity(int quatity) {
        this.quatity = quatity;
    }
    
}
