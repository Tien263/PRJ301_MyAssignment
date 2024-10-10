/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author xuant
 */
public class Employee {
    private int eid;
    private String ename;
    private Double salary_band;
    private ArrayList<Department> departments = new ArrayList<>();

    public Employee() {
    }

    public Employee(int eid, String ename, Double salary_band) {
        this.eid = eid;
        this.ename = ename;
        this.salary_band = salary_band;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Double getSalary_band() {
        return salary_band;
    }

    public void setSalary_band(Double salary_band) {
        this.salary_band = salary_band;
    }

    public ArrayList<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(ArrayList<Department> departments) {
        this.departments = departments;
    }
    
    
}
