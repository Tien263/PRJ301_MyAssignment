/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.accesscontrol;

import entity.Employee;
import java.util.ArrayList;

/**
 *
 * @author xuant
 */
public class Role {
    
    private ArrayList<User> users = new ArrayList<>();
    private ArrayList<Employee> employees = new ArrayList<>();
    private boolean  isActive;

    public Role() {
    }

    public Role(boolean isActive) {
        this.isActive = isActive;
    }

    public ArrayList<User> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }

    public ArrayList<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(ArrayList<Employee> employees) {
        this.employees = employees;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
    
    
}
