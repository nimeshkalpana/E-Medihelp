/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;

import Beans_DB_Package.LoginBean;
import Beans_DB_Package.Patient_Profile_for_McBean;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
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
@WebServlet(name = "add_disease_treatment_page", urlPatterns = {"/add_disease_treatment_page"})
public class add_disease_treatment_page extends HttpServlet {

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
            out.println("<title>Servlet Patient_appointments_fpr_doctors</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Patient_appointments_fpr_doctors at " + request.getContextPath() + "</h1>");
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
        
          int _uid=Integer.parseInt(request.getParameter("mcIDD"));
        int _pid=Integer.parseInt(request.getParameter("pidd"));
        int pa_id=Integer.parseInt(request.getParameter("paid"));
       
       
        LoginBean lbean=new LoginBean();
        lbean.setUserID(_uid);
        Patient_Profile_for_McBean ppfm= new Patient_Profile_for_McBean();
        ppfm.setPatient_id(_pid);
        ppfm.setPatient_appointment_id(pa_id);
        
        boolean checkDoctor = lbean.ValidateMCUser();
        boolean checkmcuser = lbean.ValidateMedicalCenterUser_User();
        ppfm.pid();
      
       if(checkDoctor){
          
              HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lbean);
                 request.setAttribute("ppfmbean", ppfm);
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/add_disease_treatment.jsp");
                rd.forward(request, response);   
       
       }
       else if(checkmcuser){
              HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lbean);
                 request.setAttribute("ppfmbean", ppfm);
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/add_disease_treatment.jsp");
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
