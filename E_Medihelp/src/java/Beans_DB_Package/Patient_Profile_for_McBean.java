/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import java.beans.*;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author NIMESH_PC
 */
public class Patient_Profile_for_McBean implements Serializable {

    private int patient_id;
    private int rpid;
    private int patient_appointment_id;

    public int getPatient_appointment_id() {
        return patient_appointment_id;
    }

    public void setPatient_appointment_id(int patient_appointment_id) {
        this.patient_appointment_id = patient_appointment_id;
    }

    public int getRpid() {
        return rpid;
    }

    public void setRpid(int rpid) {
        this.rpid = rpid;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }
    public void pid()
    {
        patient_id=getPatient_id();
        patient_appointment_id=getPatient_appointment_id();
    }
    
    public boolean removeappointment()
    {
         boolean ch=false;
          try {                    
           Connection conn = DBConnection.connection();
           PreparedStatement pst = conn.prepareStatement("Delete from `patient_appointment` where `id`=?"); 
           rpid=getRpid();
            pst.setInt(1,rpid);
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
