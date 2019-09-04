/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;


import java.beans.*;
import java.io.Serializable;
import java.sql.Connection;
//import java.util.Date;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author NIMESH_PC
 */
public class patient_appointment_bean implements Serializable {
    
   private int id;

   
   private int medical_center_id;
   private int patient_id;
   private Date appointment_date;
   private int appointment_number;
   private Time appointment_time;
   private Statement st;
  

 

   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public int getMedical_center_id() {
        return medical_center_id;
    }

    public void setMedical_center_id(int medical_center_id) {
        this.medical_center_id = medical_center_id;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public Date getAppointment_date() {
        return appointment_date;
    }

    public void setAppointment_date(Date appointment_date) {
        this.appointment_date = appointment_date;
    }

    public int getAppointment_number() {
        return appointment_number;
    }

    public void setAppointment_number(int appointment_number) {
        this.appointment_number = appointment_number;
    }

    public Time getAppointment_time() {
        return appointment_time;
    }

    public void setAppointment_time(Time appointment_time) {
        this.appointment_time = appointment_time;
    }
    
public void makeappointment() throws SQLException {
        
    
        try {
           
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("SELECT id,available_date,available_time,appointment_number from doctor_registered where id=?");
         
            pst.setInt(1,id);
           
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
              medical_center_id = rs.getInt("id");
              appointment_date = rs.getDate("available_date");
              appointment_time = rs.getTime("available_time");
              appointment_number = rs.getInt("appointment_number");
              patient_id =getPatient_id();
            }
               
              
            String query = "INSERT INTO `patient_appointment`(`id`, `medical_center_id`,`patient_id`,`appointment_date`, `appointment_time`, `appointment_number`) VALUES (NULL,'"+medical_center_id+"','"+patient_id+"','"+appointment_date+"','"+appointment_time+"','"+appointment_number+"')";          
            st=conn.createStatement();           
            int countrows = st.executeUpdate(query);
            if(countrows>0)
            {
                addappointment();
           
            }
            else{
               
            }
            rs.close();
             st.close();
             conn.close();
            
           // PreparedStatement pst1= conn.prepareStatement(query);                       
            // pst1.setInt(1,patient_id);           
            // pst1.executeUpdate();
            
               
        } catch (SQLException e) {
            e.printStackTrace();
        }  
        
            
            
        
         
    }
     public void addappointment() throws SQLException
             
     {    try {
             
         
         java.sql.Time newttime;
          java.util.Date newdate;
           Connection conn = DBConnection.connection();
           PreparedStatement pst2 = conn.prepareStatement("SELECT available_date,available_time,appointment_number from doctor_registered where id=?");
            pst2.setInt(1,id);
            ResultSet rs2 = pst2.executeQuery();
            while(rs2.next())
            {
                appointment_date = rs2.getDate("available_date");
                appointment_time = rs2.getTime("available_time");
                appointment_number = rs2.getInt("appointment_number");
                
            }
            
            if("09:45:00".equals(appointment_time.toString())) {
                java.sql.Time myTime = appointment_time;
                LocalTime localtime = myTime.toLocalTime();
                localtime = localtime.plusMinutes(375);
                 newttime = Time.valueOf( localtime );
                 newdate= appointment_date;
            }           
            else if ("21:45:00".equals(appointment_time.toString())){
                java.sql.Time myTime = appointment_time;
                LocalTime localtime = myTime.toLocalTime();
                localtime = localtime.plusMinutes(555);
                newttime = Time.valueOf( localtime) ;
                        
                java.sql.Date today =  appointment_date;
                LocalDate localdate = today.toLocalDate();
               LocalDate tomorrow = localdate.plusDays(1);  
               newdate=java.sql.Date.valueOf(tomorrow);
            }
            else
            {
                java.sql.Time myTime = appointment_time;
                LocalTime localtime = myTime.toLocalTime();
                localtime = localtime.plusMinutes(15);
               newttime = Time.valueOf( localtime );
               newdate= appointment_date;
            }
            appointment_number+=1;
            PreparedStatement pst3 = conn.prepareStatement("Update `doctor_registered` set `appointment_number`='"+appointment_number+"',`available_date`=?,`available_time`=? where id=?");
             pst3.setDate(1, (Date) newdate);
            pst3.setTime(2,newttime);
            pst3.setInt(3,id);
            pst3.executeUpdate();
            rs2.close();
             pst3.close();
             conn.close();
     
            } 
          
     catch (SQLException e)  {
         }
     
         
}
}