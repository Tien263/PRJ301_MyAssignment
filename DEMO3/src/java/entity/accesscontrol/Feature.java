/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.accesscontrol;

import java.util.ArrayList;

/**
 *
 * @author xuant
 */
public class Feature {
    private int fid;
    private String fname;
    private String url;
    private ArrayList<Role> roles = new ArrayList<>();

    public Feature() {
    }

    public Feature(int fid, String fname, String url) {
        this.fid = fid;
        this.fname = fname;
        this.url = url;
    }

    public ArrayList<Role> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
