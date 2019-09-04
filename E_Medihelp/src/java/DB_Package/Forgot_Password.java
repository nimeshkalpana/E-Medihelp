/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;

import Beans_DB_Package.DBConnection;
import Beans_DB_Package.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rajitha
 */
@WebServlet(name = "Forgot_Password", urlPatterns = {"/Forgot_Password"})
public class Forgot_Password extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Forgot_Password</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Forgot_Password at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       
       String _email = request.getParameter("email");
       
       String username;
       String password;
       String emailSubject = "E-Medihelp Login Credentials";
       String emailBody="";
       boolean isPatient = false;
       boolean isMedUser = false;
       boolean isDoctor = false;
       //if patient
       if(!isPatient && !isMedUser && !isDoctor){
           try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from patient_registered where mobile_or_email=?");
            pst.setString(1, _email);
          
            ResultSet rs = pst.executeQuery();
     
            if (rs.next()) {
                isPatient=true;
                username = rs.getString("mobile_or_email");
                password = rs.getString("password");
                emailBody="Dear patient,\n\n    Your user name = "+username+"\n    Your pasword = "+password+"\n\nThank You.";
            } else {
                isPatient=false;
                isMedUser = false;
                isDoctor = false;
                emailBody="Dear user,\n\n    Your email address not matching with the  login credentials which we have.\n\nThank You. ";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Forgot_Password.class.getName()).log(Level.SEVERE, null, ex);
        }
       }
       //if doctor
        if(!isPatient && !isMedUser && !isDoctor){
           try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from doctor_registered where mobile_or_email=?");
            pst.setString(1, _email);
          
            ResultSet rs = pst.executeQuery();
     
            if (rs.next()) {
                isDoctor = true;
                username = rs.getString("mobile_or_email");
                password = rs.getString("password");
                emailBody="Dear doctor,\n\n    Your user name = "+username+"\n    Your pasword = "+password+"\n\nThank You.";
            } else {
                isPatient=false;
                isMedUser = false;
                isDoctor= false;
                emailBody="Dear user,\n\n    Your email address not matching with the  login credentials which we have.\n\nThank You. ";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Forgot_Password.class.getName()).log(Level.SEVERE, null, ex);
        }
       }
        
        //if Meduser
        if(!isPatient && !isMedUser && !isDoctor){
           try {
            PreparedStatement pst = DBConnection.connection().prepareStatement("Select * from medical_center_users where email=?");
            pst.setString(1, _email);
          
            ResultSet rs = pst.executeQuery();
     
            if (rs.next()) {
                isMedUser = true;
                username = rs.getString("user_name");
                password = rs.getString("password");
                emailBody="Dear medical center user,\n\n    Your user name = "+username+"\n    Your pasword = "+password+"\n\nThank You.";
            } else {
                isPatient=false;
                isMedUser = false;
                isDoctor= false;
                emailBody="Dear user,\n\n    Your email address not matching with the  login credentials which we have.\n\nThank You. ";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Forgot_Password.class.getName()).log(Level.SEVERE, null, ex);
        }
       }
        
       SendEmail.sendMail(_email,emailSubject,emailBody);
       
       response.sendRedirect("index.jsp");
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
