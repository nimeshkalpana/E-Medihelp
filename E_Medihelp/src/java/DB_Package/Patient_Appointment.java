
package DB_Package;

import Beans_DB_Package.LoginBean;
import Beans_DB_Package.patient_appointment_bean;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NIMESH_PC
 */
public class Patient_Appointment extends HttpServlet {

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
            out.println("<title>Servlet Patient_Appointment</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Patient_Appointment at " + request.getContextPath() + "</h1>");
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
            int _id = parseInt(request.getParameter("Make_Appointment"));
            int uid = parseInt(request.getParameter("puid"));
           
            patient_appointment_bean pabean= new patient_appointment_bean();
            pabean.setId(_id);
            pabean.setPatient_id(uid);
            pabean.makeappointment();
          
            
             LoginBean lBean = new LoginBean();
            lBean.setUserID(uid);
            
            
            boolean check = lBean.Validatepatient_afterappointment();
            if(check){
                
                    HttpSession session = request.getSession(true);
                request.setAttribute("logBean", lBean); 
                request.setAttribute("Appointment_success", " Appointment added Successfully");
            }
                else{
                     HttpSession session = request.getSession(true);
                request.setAttribute("logBean", lBean); 
                request.setAttribute("Appointment_Fail", "  Appointment not successfull");
                }                     
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/User_appointments_details_for_patient.jsp");
            rd.forward(request, response);  
        } catch (SQLException ex) {
            Logger.getLogger(Patient_Additional_Detail.class.getName()).log(Level.SEVERE, null, ex);
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
