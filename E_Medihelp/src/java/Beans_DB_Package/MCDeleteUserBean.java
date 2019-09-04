/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Rajitha
 */
public class MCDeleteUserBean implements Serializable {
    
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
    public void DeleteUser(){
        
        try {
            
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("DELETE FROM `medical_center_users` WHERE id = ?");
            pst.setInt(1, id);          
            pst.executeUpdate();
            
           
        } catch (SQLException e) {
            e.printStackTrace();
        }   
    }
    
}
