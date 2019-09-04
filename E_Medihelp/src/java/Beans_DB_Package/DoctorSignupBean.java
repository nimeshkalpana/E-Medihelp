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
public class DoctorSignupBean implements Serializable {
    
    private String firstName;
    private String surname;
    private String doctorRegNumber;
    private String medicalCenterRegNumber;
    private String mobileOrEmail;
    private String password;
    private Double medicalCenterLatitude;
    private Double medicalCenterLongitude;
    
    private Statement st;

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
    
    
     public boolean AddValue() {
        boolean ch = false;
        try {
            String query ="INSERT INTO `doctor_not_registered`(`id`, `first_name`, `surname`, `doctor_registration_number`, `medical_center_registration_number`, `mobile_or_email`, `password`, `medical_center_latitude`, `medical_center_longitude`) VALUES (NULL,'"+firstName+"','"+surname+"','"+doctorRegNumber+"','"+medicalCenterRegNumber+"','"+mobileOrEmail+"','"+password+"','"+medicalCenterLatitude+"','"+medicalCenterLongitude+"')";
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
