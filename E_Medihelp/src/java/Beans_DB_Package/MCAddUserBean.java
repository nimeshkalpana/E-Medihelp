/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import java.io.Serializable;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Rajitha
 */
public class MCAddUserBean implements Serializable{
    
    private String name;
    private String address;
    private String contactNo;
    private String email;
    private String designation;
    private String dutyStartTime;
    private String dutyEndTime;
    private String userName;
    private String password;
    private int mcID;
    
    private Statement st;

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public void setDutyStartTime(String dutyStartTime) {
        this.dutyStartTime = dutyStartTime;
    }

    public void setDutyEndTime(String dutyEndTime) {
        this.dutyEndTime = dutyEndTime;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getMcID() {
        return mcID;
    }

    public void setMcID(int mcID) {
        this.mcID = mcID;
    }
    
    
    
    public boolean AddUsers(){
        boolean ch = false;
        try {
           
            String query = "INSERT INTO `medical_center_users`(`id`, `name`, `address`, `contact_number`, `email`, `designation`, `duty_start_time`, `duty_end_time`, `user_name`, `password`, `medical_center_id`) VALUES (NULL,'" + name + "','" + address + "','" + contactNo + "','" + email + "','" + designation + "','" + dutyStartTime + "','" + dutyEndTime + "','" + userName + "','" + password + "','" + mcID + "');";
                        
            st = DBConnection.connection().createStatement();
            st.executeUpdate(query);

            if (!st.equals("")) {
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