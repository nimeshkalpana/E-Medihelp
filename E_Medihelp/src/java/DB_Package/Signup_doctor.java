/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;

import Beans_DB_Package.DoctorSignupBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rajitha
 */
@WebServlet(name = "Signup_doctor", urlPatterns = {"/Signup_doctor"})
public class Signup_doctor extends HttpServlet {

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
            out.println("<title>Servlet Signup_doctor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Signup_doctor at " + request.getContextPath() + "</h1>");
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
        String _firstName = request.getParameter("firstName");
        String _surname = request.getParameter("surname");
        String _doctorRegistrationNumber = request.getParameter("docRegNumber");
        String _medicalCenterRegistrationNumber= request.getParameter("medicalCenterRegNumber");
        String _mobileEmail = request.getParameter("mobileEmail");
        String _password_confirmation = request.getParameter("password_confirmation");
        Double _medicalCenterLatitude = Double.parseDouble(request.getParameter("medicalCenterLatitude"));
        Double _medicalCenterLongitude = Double.parseDouble(request.getParameter("medicalCenterLongitude"));
        DoctorSignupBean dSignupBean = new DoctorSignupBean();
        dSignupBean.setFirstName(_firstName);
        dSignupBean.setSurname(_surname);
        dSignupBean.setDoctorRegNumber(_doctorRegistrationNumber);
        dSignupBean.setMedicalCenterRegNumber(_medicalCenterRegistrationNumber);
        dSignupBean.setMobileOrEmail(_mobileEmail);
        dSignupBean.setPassword(_password_confirmation);
        dSignupBean.setMedicalCenterLatitude(_medicalCenterLatitude);
        dSignupBean.setMedicalCenterLongitude(_medicalCenterLongitude);
        boolean check = dSignupBean.AddValue();
        if (check) {
            request.setAttribute("doctorSignupSuccess", "Successfully create an account. Please wait for account approve.");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("doctorSignupFail", "Account creation fail. Please try again");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
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
