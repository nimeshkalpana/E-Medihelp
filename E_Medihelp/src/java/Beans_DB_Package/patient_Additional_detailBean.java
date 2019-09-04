/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import java.beans.*;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author NIMESH_PC
 */
public class patient_Additional_detailBean implements Serializable {
    
private int id;
private String blood;

   
private String address;
private int contact;
private int age;
private Date birth_date;

    public String getBlood() {
        return blood;
    }

    public void setBlood(String blood) {
        this.blood = blood;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getContact() {
        return contact;
    }

    public void setContact(int contact) {
        this.contact = contact;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
    }

    
    
    
    public boolean addpatientadditional() throws SQLException
    {
          boolean ch=false;
          try {                    
           Connection conn = DBConnection.connection();
           PreparedStatement pst = conn.prepareStatement("Update `patient_registered` set `Contact_No`='"+contact+"',`Address`='"+address+"',`Age`='"+age+"' ,`Blood_group`= '"+blood+"',`Birth_day`='"+birth_date+"' where id=?"); 
            pst.setInt(1,id);
            int rows = pst.executeUpdate();
            if(rows>0)
            {
                ch=true;
            }
            
            } catch (SQLException e) {
                e.getMessage();
        }
         
             return ch;
    }
}
