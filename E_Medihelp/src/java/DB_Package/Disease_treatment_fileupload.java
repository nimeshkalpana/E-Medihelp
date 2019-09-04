/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;

import Beans_DB_Package.Disease_treatment_fileupload_Bean;
import Beans_DB_Package.LoginBean;
import Beans_DB_Package.Patient_Profile_for_McBean;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author NIMESH_PC
 */

@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB 
@WebServlet(name = "Disease_treatment_fileupload", urlPatterns = {"/Disease_treatment_fileupload"})
public class Disease_treatment_fileupload extends HttpServlet {

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
        
        try {
            int mcid = Integer.parseInt(request.getParameter("mcID"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            int paid = Integer.parseInt(request.getParameter("paID"));
            String _disease=(request.getParameter("disease"));
            String _treatment=(request.getParameter("Treatment"));
            Part filepart = request.getPart("attachfile");
            boolean checkpdf=false;
            String msg = null;
            Disease_treatment_fileupload_Bean dtfb = new Disease_treatment_fileupload_Bean();
             Patient_Profile_for_McBean ppfm = new Patient_Profile_for_McBean();
            dtfb.setMcid(mcid);
            dtfb.setPid(pid);
            dtfb.setPaid(paid);
            dtfb.setTreatment(_treatment);
            dtfb.setDisease(_disease);
            
            if(filepart!=null)
            {  
                String contenttype=filepart.getContentType();
                if(!contenttype.equals("application/pdf"))
                {
                    checkpdf=true;
                }
                else{
                     dtfb.setUp_filename(filepart.getSubmittedFileName());               
                     dtfb.setInputstream(filepart.getInputStream());
                     msg = dtfb.add_result_to_database();          
                     ppfm.setRpid(paid);
                     ppfm.removeappointment();
                }
               
            }
            
            LoginBean lBean = new LoginBean();
            ppfm.setPatient_id(pid);
            ppfm.setPatient_appointment_id(paid);
            lBean.setUserID(mcid);
            
            
            boolean checkDoctor = lBean.ValidateMCUser();
            boolean checkmcuser = lBean.ValidateMedicalCenterUser_User();
            
            if(checkDoctor){
                if(checkpdf)
                {
                HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lBean);
                request.setAttribute("ppfmbean", ppfm);
                request.setAttribute("pdffail", "Please select PDF file to upload");
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/add_disease_treatment.jsp");
                rd.forward(request, response);   
                      
                }
                else{
                HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lBean);
                request.setAttribute("Disease_treatment_fileupload_Bean", ppfm);
                request.setAttribute("Appoinment_success", msg);
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/medicalCenterLandingPage.jsp");
                rd.forward(request, response);
                
                }
            }
            else if(checkmcuser)
                 if(checkpdf)
                {
                HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lBean);
                request.setAttribute("ppfmbean", ppfm);
                request.setAttribute("pdffail", "Please select PDF file to upload");
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/add_disease_treatment.jsp");
                rd.forward(request, response);   
                      
                }
            else
              {
                HttpSession session = request.getSession(true);

                request.setAttribute("logBean", lBean);
                request.setAttribute("Disease_treatment_fileupload_Bean", ppfm);
                request.setAttribute("Appoinment_success", msg);
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/medicalCenterLandingPage.jsp");
                rd.forward(request, response);
                
            }} catch (SQLException ex) {
            Logger.getLogger(Disease_treatment_fileupload.class.getName()).log(Level.SEVERE, null, ex);
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
