/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;

import Beans_DB_Package.LoginBean;
import Beans_DB_Package.appointment_from_coords_bean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NIMESH_PC
 */
@WebServlet(name = "appointment_from_coordinates", urlPatterns = {"/appointment_from_coordinates"})
public class appointment_from_coordinates extends HttpServlet {

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
            out.println("<title>Servlet mc_detail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mc_detail at " + request.getContextPath() + "</h1>");
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
        
       
       
    }

       
        
    @Override
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
       Double latis = Double.parseDouble(request.getParameter("latis"));
       Double longts = Double.parseDouble(request.getParameter("longts"));
       Double curlatis = Double.parseDouble(request.getParameter("curlatis"));
       Double curlongts = Double.parseDouble(request.getParameter("curlongts"));
       int _uid=Integer.parseInt(request.getParameter("uid"));
       appointment_from_coords_bean afcb = new appointment_from_coords_bean();
       LoginBean lbean=new LoginBean();
       lbean.setUserID(_uid);
       afcb.setAppointmentlatitude(latis);
       afcb.setAppointmentlongtitude(longts);
       afcb.setCurrentlatitude(curlatis);
       afcb.setCurrentlongitude(curlongts);
       afcb.appointment_details();
       Boolean check=lbean.Validatepatient_afterappointment();
       if(check)
       {
           HttpSession session = request.getSession(true);
                request.setAttribute("logBean", lbean); 
                request.setAttribute("ap_coords", afcb); 
            }
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/appointment_from_coordinates.jsp");
            rd.forward(request, response);  
       
    }

        
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
