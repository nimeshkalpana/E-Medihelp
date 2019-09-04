/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.io.Serializable;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Rajitha
 */
public class AcceptMedicalCenterBean implements Serializable{
    
    private int id;
    private String firstName;
    private String surname;
    private String doctorRegNumber;
    private String medicalCenterRegNumber;
    private String mobileOrEmail;
    private String password;
    private Double medicalCenterLatitude;
    private Double medicalCenterLongitude;
    private int appointment_number;
     private String next_available_date;
    private String next_available_time;
    private Statement st ;
   
    public String getNext_available_date() {
        return next_available_date;
    }

    public void setNext_available_date(String next_available_date) {
        this.next_available_date = next_available_date;
    }

    public String getNext_available_time() {
        return next_available_time;
    }

    public void setNext_available_time(String next_available_time) {
        this.next_available_time = next_available_time;
    }
    
    public int getAppointment_number() {
        return appointment_number;
    }

    public void setAppointment_number(int appointment_number) {
        this.appointment_number = appointment_number;
    }
    
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

    public String getDoctorRegNumber() {
        return doctorRegNumber;
    }

    public void setDoctorRegNumber(String doctorRegNumber) {
        this.doctorRegNumber = doctorRegNumber;
    }

    public String getMedicalCenterRegNumber() {
        return medicalCenterRegNumber;
    }

    public void setMedicalCenterRegNumber(String medicalCenterRegNumber) {
        this.medicalCenterRegNumber = medicalCenterRegNumber;
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

    public Double getMedicalCenterLatitude() {
        return medicalCenterLatitude;
    }

    public void setMedicalCenterLatitude(Double medicalCenterLatitude) {
        this.medicalCenterLatitude = medicalCenterLatitude;
    }

    public Double getMedicalCenterLongitude() {
        return medicalCenterLongitude;
    }

    public void setMedicalCenterLongitude(Double medicalCenterLongitude) {
        this.medicalCenterLongitude = medicalCenterLongitude;
    }
     
    public boolean Accept() throws ParseException {
         boolean ch=false;
        try {
           
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM `doctor_not_registered` WHERE id = ?");
         
            pst.setInt(1, id);
           
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
              id = rs.getInt("id");
              firstName = rs.getString("first_name");
              surname = rs.getString("surname");
              doctorRegNumber = rs.getString("doctor_registration_number");
              medicalCenterRegNumber = rs.getString("medical_center_registration_number");
              mobileOrEmail = rs.getString("mobile_or_email");
              password = rs.getString("password"); 
              medicalCenterLatitude = Double.parseDouble(rs.getString("medical_center_latitude"));
              medicalCenterLongitude = Double.parseDouble(rs.getString("medical_center_longitude"));
              appointment_number=1;
             // next_available_date="2019-02-25";
             // next_available_time="07-00";
            }
//                Date currentDatetime = new Date(System.currentTimeMillis());
//               java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
//               java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
               LocalDate today =  LocalDate.now();
               LocalDate tomorrow = today.plusDays(1);  
               Date d1=java.sql.Date.valueOf(tomorrow);
               LocalTime lt = LocalTime.parse( "07:00" ) ;
               Time time = Time.valueOf( lt );
             
          
            String query="INSERT INTO `doctor_registered`(`id`, `first_name`, `surname`, `doctor_registration_number`, `medical_center_registration_number`, `mobile_or_email`, `password`, `medical_center_latitude`, `medical_center_longitude`,`appointment_number`,`available_date`,`available_time`) VALUES (NULL,'"+firstName+"','"+surname+"','"+doctorRegNumber+"','"+medicalCenterRegNumber+"','"+mobileOrEmail+"','"+password+"','"+medicalCenterLatitude+"','"+medicalCenterLongitude+"','"+appointment_number+"',?,?)";
            PreparedStatement pst1= conn.prepareStatement(query);                       
             pst1.setDate(1, (java.sql.Date) d1);
             pst1.setTime(2, time);
             int rows = pst1.executeUpdate();
             if(rows>0)
             {
                 ch=true;
             }
           // pst1.executeQuery();

           pst = conn.prepareStatement("DELETE FROM `doctor_not_registered` WHERE id = ?");
           pst.setInt(1, id);          
           pst.executeUpdate();
               
        } catch (SQLException e) {
            e.printStackTrace();
        }        
           return ch;
    }
    
    public boolean DeleteAccount(){
            boolean ch=false;
        try {
            
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("DELETE FROM `doctor_not_registered` WHERE id = ?");
            pst.setInt(1, id);          
            int rows=pst.executeUpdate();
             if(rows>0)
             {
                 ch=true;
             }
           
        } catch (SQLException e) {
            e.printStackTrace();
        }   
        return ch;
    }
     public boolean Delete_Registered_doctor(){
             boolean ch=false;
        try {
           
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("DELETE FROM `doctor_registered` WHERE id = ?");
            pst.setInt(1, id);          
           int rows= pst.executeUpdate();
            
            PreparedStatement pst1 = conn.prepareStatement("DELETE FROM `medical_center_users` WHERE medical_center_id = ?");
            pst1.setInt(1, id);          
            pst1.executeUpdate();
           if (rows>0){
                ch=true;
            }
            
           
        } catch (SQLException e) {
            e.printStackTrace();
        }  
        return ch;
    }
    
}
