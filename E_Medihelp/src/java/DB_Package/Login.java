/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;

import Beans_DB_Package.LoginBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajitha
 */
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);

        String _uName = request.getParameter("uName");
        String _password = request.getParameter("pass");
        Double currentlon= Double.parseDouble(request.getParameter("lons"));
        Double currentlat= Double.parseDouble(request.getParameter("lats"));

        LoginBean lBean = new LoginBean();

        lBean.setUname(_uName);
        lBean.setPassword(_password);
        lBean.FindNerbyMedicalCenter();
        lBean.setCurlat(currentlat);
        lBean.setCurlon(currentlon);

        boolean checkPatient = lBean.ValidatePatient();
        
        boolean checkDoctor = lBean.ValidateDoctor();
        
        boolean checkMedicalCenterUser = lBean.ValidateMedicalCenterUser();
         lBean.checkdoctor_date();

        if (checkPatient) {

            if (_uName.equals("admin@gmail.com")) {
                HttpSession session = request.getSession(true);
                

                request.setAttribute("logBean", lBean);

                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/dashboard.jsp");
                rd.forward(request, response);
            } else {
                lBean.FindNerbyMedicalCenter();
                HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lBean);

                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/logPatient_1.jsp");
                rd.forward(request, response);
            }

        }else if(checkDoctor){
                HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lBean);

                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/medicalCenterDashboard.jsp");
                rd.forward(request, response);   
        }else if(checkMedicalCenterUser){
            HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lBean);

                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/medicalCenterLandingPage.jsp");
                rd.forward(request, response); 
        }else {
            HttpSession session = request.getSession(true);
            request.setAttribute("IncorrectUsernameorPassword", "Incorrect Username or Password");
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
