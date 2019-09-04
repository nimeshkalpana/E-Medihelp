/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Rajitha
 */
public class MCAddDetailBean implements Serializable{
    
    private String name;
    private String address;
    
    private int mcID;
    
  

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getMcID() {
        return mcID;
    }

    public void setMcID(int mcID) {
        this.mcID = mcID;
    }
    
    public boolean AddDetail(){
        boolean ch = false;
        try {
           
            PreparedStatement pst = DBConnection.connection().prepareStatement("UPDATE `doctor_registered` SET `medical_center_name`=?,`medical_center_address`=? where id=?");
            
            pst.setString(1, name);
            pst.setString(2, address);
            pst.setInt(3, mcID);
           
            pst.executeUpdate();

            if (!pst.equals("")) {
                ch = true;
            } else {
                ch = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }
    
}
