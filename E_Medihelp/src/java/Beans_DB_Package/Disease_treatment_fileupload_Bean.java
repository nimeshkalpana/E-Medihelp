/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;


import java.beans.*;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.ResultSet;

/**
 *
 * @author NIMESH_PC
 */
public class Disease_treatment_fileupload_Bean implements Serializable {
    
   private int mcid;
   private int pid;
   private int paid;
   private String disease;
   private String treatment;
   private InputStream inputstream = null;
   private Date apdate;
   private int apno;

    public String getUp_filename() {
        return Up_filename;
    }

    public void setUp_filename(String Up_filename) {
        this.Up_filename = Up_filename;
    }
   private String Up_filename;
   String message ;
   
    public int getApno() {
        return apno;
    }

    public void setApno(int apno) {
        this.apno = apno;
    }

    public Date getApdate() {
        return apdate;
    }

    public void setApdate(Date apdate) {
        this.apdate = apdate;
    }

    public InputStream getInputstream() {
        return inputstream;
    }

    public void setInputstream(InputStream inputstream) {
        this.inputstream = inputstream;
    }

   

    public int getMcid() {
        return mcid;
    }

    public void setMcid(int mcid) {
        this.mcid = mcid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getPaid() {
        return paid;
    }

    public void setPaid(int paid) {
        this.paid = paid;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String add_result_to_database() throws SQLException
    {
          
          try {               
              
            Connection conn = DBConnection.connection();
           PreparedStatement pst1 = conn.prepareStatement("select `appointment_date`,`appointment_number` from patient_appointment where `id`=? "); 
            pst1.setInt(1,getPaid());
            ResultSet rs = pst1.executeQuery();
            
            while (rs.next()) {
              apdate= rs.getDate("appointment_date");
              apno=rs.getInt("appointment_number");
            }
            rs.close();
            pst1.close();
                    
            PreparedStatement pst = conn.prepareStatement("Insert into `past_disease_details`(`id`,`medical_center`,`date`,`disease_details`,`treatments`,`report_files`,`filename`,`patient_id`) values (NULL,?,?,?,?,?,?,?)"); 
            mcid=getMcid();
            disease=getDisease();
            treatment=getTreatment();
            inputstream=getInputstream();
            Up_filename=getUp_filename();
            pid=getPid();
            pst.setInt(1,mcid);
            pst.setDate(2, apdate);
            pst.setString(3, disease);
            pst.setString(4, treatment);
            pst.setBlob(5, inputstream);
            pst.setString(6, Up_filename);
            pst.setInt(7, pid);
            
            int rows = pst.executeUpdate();
            if(rows>0)
            {
                message ="Appointment No "+apno+" completed successfully!";
            }
           
            } catch (SQLException e) {
                e.getMessage();
        }
         
         return message;
    }
   
}
