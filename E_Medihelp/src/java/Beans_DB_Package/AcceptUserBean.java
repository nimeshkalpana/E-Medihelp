/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Rajitha
 */
public class AcceptUserBean implements Serializable {
    
    private int id;
    private String firstName;
    private String surname;
    private String mobileOrEmail;
    private String password;
    private String gender;
    
    private Statement st ;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getMobileOrEmail() {
        return mobileOrEmail;
    }

    public void setMobileOrEmail(String mobileOrEmail) {
        this.mobileOrEmail = mobileOrEmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    
    
    
    public Boolean Accept() {
            boolean ch=false;
        try {
           
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM `patient_not_registered` WHERE id = ?");
         
            pst.setInt(1, id);
           
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
              id = rs.getInt("id");
              firstName = rs.getString("first_name");
              surname = rs.getString("surname");
              mobileOrEmail = rs.getString("mobile_or_email");
              password = rs.getString("password"); 
              gender = rs.getString("gender");
            }
            
            String query = "INSERT INTO `patient_registered`(`id`, `first_name`, `surname`, `mobile_or_email`, `password`, `gender`) VALUES (NULL,'"+firstName+"','"+surname+"','"+mobileOrEmail+"','"+password+"','"+gender+"');";          
            st= conn.createStatement();           
            int rows =st.executeUpdate(query);
            if(rows>0)
            {
                ch=true;
            }
            
            pst = conn.prepareStatement("DELETE FROM `patient_not_registered` WHERE id = ?");
            pst.setInt(1, id);          
            pst.executeUpdate();
               
        } catch (SQLException e) {
            e.printStackTrace();
        }        
        return ch;
    }
    
    public boolean DeleteUser(){
             boolean ch=false;
        try {
            
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("DELETE FROM `patient_not_registered` WHERE id = ?");
            pst.setInt(1, id);          
            int rows=pst.executeUpdate();
            if(rows>0)
            {
                ch = true;
            }
            
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }
     public Boolean Delete_Registered_User(){
             boolean ch=false;

        try {
            
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("DELETE FROM `patient_registered` WHERE id = ?");
            pst.setInt(1, id);          
           int rows= pst.executeUpdate();
            if(rows>0)
            {
                ch = true;
            }
            
            PreparedStatement pst1 = conn.prepareStatement("DELETE FROM `past_disease_details` WHERE patient_id = ?");
            pst1.setInt(1, id);          
            pst1.executeUpdate();
            
            PreparedStatement pst2 = conn.prepareStatement("DELETE FROM `patient_appointment` WHERE patient_id = ?");
            pst2.setInt(1, id);          
            pst2.executeUpdate();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }   
        return  ch;
    }
    
    
    
    
}
