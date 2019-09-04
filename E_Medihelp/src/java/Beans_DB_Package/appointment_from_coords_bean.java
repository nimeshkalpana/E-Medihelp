/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans_DB_Package;

import java.beans.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author NIMESH_PC
 */
public class appointment_from_coords_bean implements Serializable {
      private double appointmentlatitude;
    private double appointmentlongtitude;
    private int mcid;
    private String doctor;
    private String doctor_registration;
    private String mc_registration;
    private Date appointment_date;
    private Time appointment_time;
    private int appointment_no;
    private String mobile_or_email;
    private String mc_name;
    private double currentlatitude;

    public double getCurrentlatitude() {
        return currentlatitude;
    }

    public void setCurrentlatitude(double currentlatitude) {
        this.currentlatitude = currentlatitude;
    }

    public double getCurrentlongitude() {
        return currentlongitude;
    }

    public void setCurrentlongitude(double currentlongitude) {
        this.currentlongitude = currentlongitude;
    }
    private double currentlongitude;

    public String getMobile_or_email() {
        return mobile_or_email;
    }

    public void setMobile_or_email(String mobile_or_email) {
        this.mobile_or_email = mobile_or_email;
    }

    public String getMc_name() {
        return mc_name;
    }

    public void setMc_name(String mc_name) {
        this.mc_name = mc_name;
    }

    public String mobile_or_email() {
        return mobile_or_email;
    }

    public void mobile_or_email(String mobile_or_email) {
        this.mobile_or_email = mobile_or_email;
    }

    public int getMcid() {
        return mcid;
    }

    public void setMcid(int mcid) {
        this.mcid = mcid;
    }

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

    public String getDoctor_registration() {
        return doctor_registration;
    }

    public void setDoctor_registration(String doctor_registration) {
        this.doctor_registration = doctor_registration;
    }

    public String getMc_registration() {
        return mc_registration;
    }

    public void setMc_registration(String mc_registration) {
        this.mc_registration = mc_registration;
    }

    public Date getAppointment_date() {
        return appointment_date;
    }

    public void setAppointment_date(Date appointment_date) {
        this.appointment_date = appointment_date;
    }

    public Time getAppointment_time() {
        return appointment_time;
    }

    public void setAppointment_time(Time appointment_time) {
        this.appointment_time = appointment_time;
    }

    public int getAppointment_no() {
        return appointment_no;
    }

    public void setAppointment_no(int appointment_no) {
        this.appointment_no = appointment_no;
    }
    
  
    

    public double getAppointmentlatitude() {
        return appointmentlatitude;
    }

    public void setAppointmentlatitude(double appointmentlatitude) {
        this.appointmentlatitude = appointmentlatitude;
    }

    public double getAppointmentlongtitude() {
        return appointmentlongtitude;
    }

    public void setAppointmentlongtitude(double appointmentlongtitude) {
        this.appointmentlongtitude = appointmentlongtitude;
    }
 
    public void appointment_details()
    {
          try {
                                    
                                    PreparedStatement pst = DBConnection.connection().prepareStatement("SELECT `id`, `first_name`, `surname`, `doctor_registration_number`, `medical_center_registration_number`,`medical_center_name`, `mobile_or_email`, `password`, `medical_center_latitude`, `medical_center_longitude`,`available_date`,`available_time`, `appointment_number` FROM `doctor_registered` where `medical_center_latitude`='"+getAppointmentlatitude()+"' and `medical_center_longitude` ='"+getAppointmentlongtitude()+"'");
                                    ResultSet resultSet = pst.executeQuery();
                    
                                    while (resultSet.next()) {
                                        mcid= resultSet.getInt("id");
                                       String doctor_first= resultSet.getString("first_name");
                                       String doctor_sur= resultSet.getString("surname");
                                       doctor= doctor_first +" "+ doctor_sur;
                                        doctor_registration= resultSet.getString("doctor_registration_number");
                                        mobile_or_email=resultSet.getString("mobile_or_email");
                                         mc_name=resultSet.getString("medical_center_name");
                                         mc_registration=resultSet.getString("medical_center_registration_number");
                                        appointment_date= resultSet.getDate("available_date");
                                        appointment_time= resultSet.getTime("available_time");
                                        appointment_no= resultSet.getInt("appointment_number");
                                        currentlatitude=getCurrentlatitude();
                                        currentlongitude=getCurrentlongitude();
                                        
                                     
                                           }

                                } catch (SQLException e) {
                                }
    }
}
    