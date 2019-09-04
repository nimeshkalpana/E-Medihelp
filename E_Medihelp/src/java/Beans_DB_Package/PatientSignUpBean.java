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
public class PatientSignUpBean implements Serializable {

    private String firstName;
    private String surname;
    private String mobileOrEmail;
    private String password;
    private String gender;

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

    public boolean AddValue(){
        boolean ch = false;
        try {
            String query = "INSERT INTO `patient_not_registered`(`id`, `first_name`, `surname`, `mobile_or_email`, `password`, `gender`) VALUES (NULL,'" + firstName + "','" + surname + "','" + mobileOrEmail + "','" + password + "','" + gender + "');";

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
