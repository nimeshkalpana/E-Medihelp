/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import Models.latlong;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajitha
 */
public class LoginBean implements Serializable {

    private int _userID;
    private String _uname = "Admin";
    private String _password;
    private String _firstName;
    private String _medicalCenterName;
    private List<latlong> medicalCenterLatLong = new ArrayList<>();
    private latlong latlonModel;
    private int mc_medical_center_Id;
    private Date appointment_date;
    private int mcid;
    private double curlon;
    private double curlat;
    private String mcname;
    private String _gender;

    public String getGender() {
        return _gender;
    }

    public void setGender(String _gender) {
        this._gender = _gender;
    }
   
    public String getMcname() {
        return mcname;
    }

    public void setMcname(String mcname) {
        this.mcname = mcname;
    }

    public double getCurlon() {
        return curlon;
    }

    public void setCurlon(double curlon) {
        this.curlon = curlon;
    }

    public double getCurlat() {
        return curlat;
    }

    public void setCurlat(double curlat) {
        this.curlat = curlat;
    }
  

   

    public int getMcid() {
        return mcid;
    }

    public void setMcid(int mcid) {
        this.mcid = mcid;
    }

    public Date getAppointment_date() {
        return appointment_date;
    }

    public void setAppointment_date(Date appointment_date) {
        this.appointment_date = appointment_date;
    }

    public int getMc_medical_center_Id() {
        return mc_medical_center_Id;
    }

    public void setMc_medical_center_Id(int mc_medical_center_Id) {
        this.mc_medical_center_Id = mc_medical_center_Id;
    }

  

    public List<latlong> getMedicalCenterLatLong() {
        return medicalCenterLatLong;
    }
        
    public void setUname(String _uname) {
        this._uname = _uname;
    }

    public void setPassword(String _password) {
        this._password = _password;
    }

    public String getUname() {
        return _uname;
    }

    public String getFirstName() {
        return _firstName;
    }

    public int getUserID() {
        return _userID;
    }

    public void setUserID(int _userID) {
        this._userID = _userID;
    }

    public String getMedicalCenterName() {
        return _medicalCenterName;
    }

    public void setMedicalCenterName(String _medicalCenterName) {
        this._medicalCenterName = _medicalCenterName;
    }
    
            public void checkdoctor_date()
            {
                try {
           
            Connection conn = DBConnection.connection();
            PreparedStatement pst = conn.prepareStatement("SELECT id,available_date from doctor_registered");        
           ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
             
              appointment_date = rs.getDate("available_date");
              mcid = rs.getInt("id");
              
                 LocalDate today =  LocalDate.now();
                java.util.Date d1=java.sql.Date.valueOf(today);
                 if(d1.toString().equals(appointment_date.toString()))                   
                {
                      LocalDate tomorrow = today.plusDays(1);  
                    java.util.Date d2=java.sql.Date.valueOf(tomorrow);
                     LocalTime lt = LocalTime.parse( "07:00" ) ;
                      Time time = Time.valueOf( lt );
                     appointment_date = (Date) d2;
                     PreparedStatement pst1 = conn.prepareStatement("Update doctor_registered set  `available_date` = ?,`available_time` = ? where `id`='"+mcid+"'");    
                     pst1.setDate(1, (java.sql.Date) d2);
                     pst1.setTime(2,  time);
                     int row = pst1.executeUpdate();
                }
             
            }
               
                
            }
                catch(SQLException e)
                {
                    e.getMessage();
                }
       }

            
    public boolean ValidatePatient() {
        boolean ch = false;
        try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from patient_registered where mobile_or_email=? and password=?");

            pst.setString(1, _uname);
            pst.setString(2, _password);

            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                ch = true;
                _firstName = rs.getString("first_name");
                _userID = rs.getInt("id");
                _gender=rs.getString("gender");
            } else {
                ch = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }
    
    public boolean ValidateDoctor() {
        boolean ch = false;
        try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from doctor_registered where mobile_or_email=? and password=?");

            pst.setString(1, _uname);
            pst.setString(2, _password);

            ResultSet rs = pst.executeQuery();
     
            if (rs.next()) {
                ch = true;
                _firstName = rs.getString("first_name");
                _userID = rs.getInt("id");
                mc_medical_center_Id=_userID;
            } else {
                ch = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }
    
    public boolean ValidateMedicalCenterUser(){
        boolean ch = false;
        try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from medical_center_users where user_name=? and password=?");

            pst.setString(1, _uname);
            pst.setString(2, _password);

            ResultSet rs = pst.executeQuery();
     
            if (rs.next()) {
                ch = true;
                _firstName = rs.getString("name");
                _userID = rs.getInt("id");
                mc_medical_center_Id=rs.getInt("medical_center_id");
                getMedicalCenterDetail(mc_medical_center_Id);
            } else {
                ch = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }
    
    private void getMedicalCenterDetail(int mcId){
        try {
                 
            PreparedStatement pst = DBConnection.connection().prepareStatement("SELECT `id`, `first_name`, `surname`, `doctor_registration_number`, `medical_center_registration_number`, `medical_center_name`, `medical_center_address`, `mobile_or_email`, `medical_center_latitude`, `medical_center_longitude`, `appointment_number` FROM `doctor_registered` WHERE id=?");
            pst.setInt(1, mcId);
            
            ResultSet rs = pst.executeQuery();
            if(rs != null){
                if(rs.next()){
                _medicalCenterName = rs.getString("medical_center_name");
                }
            }
                  
        } catch (SQLException e) {
        }
    }
    
    public void FindNerbyMedicalCenter(){
          
        try {
            curlat=getCurlat();
            curlon=getCurlon();
            
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select medical_center_latitude, medical_center_longitude,medical_center_name from doctor_registered");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {  
                
               Double mclattitude= rs.getDouble("medical_center_latitude");
               Double mclongtitude= rs.getDouble("medical_center_longitude");
               mcname=rs.getString("medical_center_name");
               Double distanc= distance(curlat, curlon, mclattitude,mclongtitude);
//                PreparedStatement pst1 = DBConnection.connection().prepareStatement(" ");
//                ResultSet rs1 = pst1.executeQuery();
//                while (rs1.next())
//                {
int rounddistance = (int) Math.round(distanc);
          if(rounddistance<=50)  
          {
                latlonModel = new latlong();
                latlonModel.setLat(mclattitude);
                latlonModel.setLon(mclongtitude);  
                medicalCenterLatLong.add(latlonModel); 
          }                         
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     public double distance(double lat1, double lon1, double lat2, double lon2) {


          double theta = lon1 - lon2;
          double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
          dist = Math.acos(dist);
          dist = rad2deg(dist);
          dist = dist * 60 * 1.1515;
         // if (sr.equals("K")) {
            dist = dist * 1.609344;
         // } else if (sr.equals("N")) {
         //   dist = dist * 0.8684;
         //   }
          return (dist);
        }
    public double deg2rad(double deg) {
          return (deg * Math.PI / 180.0);
        }
    public double rad2deg(double rad) {
          return (rad * 180.0 / Math.PI);
        }


   
   
    public boolean ValidateMCUser() {
        boolean ch = false;
        try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from doctor_registered where id=?");

            pst.setInt(1, _userID);

            ResultSet rs = pst.executeQuery();
     
            if (rs.next()) {
                ch = true;
                _firstName = rs.getString("first_name");
                _userID = rs.getInt("id");
                mc_medical_center_Id=_userID;
                getMedicalCenterDetail(_userID);
            } else {
                ch = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }
      public boolean ValidateMedicalCenterUser_User(){
        boolean ch = false;
        try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from medical_center_users where id=?");

            pst.setInt(1, _userID);
           

            ResultSet rs = pst.executeQuery();
     
            if (rs.next()) {
                ch = true;
                _firstName = rs.getString("name");
                _userID = rs.getInt("id");
                mc_medical_center_Id=rs.getInt("medical_center_id");
                getMedicalCenterDetail(mc_medical_center_Id);
            } else {
                ch = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }
    
public boolean Validatepatient_afterappointment() {
        boolean ch = false;
        try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from patient_registered where id=?");

            pst.setInt(1, _userID);

            ResultSet rs = pst.executeQuery();
     
            if (rs.next()) {
                ch = true;
                _firstName = rs.getString("first_name");
                _userID = rs.getInt("id");
                _gender=rs.getString("gender");
            } else {
                ch = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }
}
