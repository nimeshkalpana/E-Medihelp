/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;

import Beans_DB_Package.LoginBean;
import Beans_DB_Package.patient_Additional_detailBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "Patient_Additional_Detail", urlPatterns = {"/Patient_Additional_Detail"})
public class Patient_Additional_Detail extends HttpServlet {

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
            out.println("<title>Servlet Patient_Additional_Detail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Patient_Additional_Detail at " + request.getContextPath() + "</h1>");
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
            int _id = Integer.parseInt(request.getParameter("Additional_detail"));
            int _contact = Integer.parseInt(request.getParameter("contactNo"));
            int _age = Integer.parseInt(request.getParameter("Age"));
            String _address = request.getParameter("address");
            String _blood = request.getParameter("Blood_Group");
            String _date = request.getParameter("Date");
            Date date1 = Date.valueOf(_date);
            
            patient_Additional_detailBean padbean = new patient_Additional_detailBean();
            padbean.setContact(_contact);
            padbean.setAge(_age);
            padbean.setAddress(_address);
            padbean.setBirth_date(date1);
            padbean.setBlood(_blood);
            padbean.setId(_id);
            
            LoginBean lBean = new LoginBean();
            lBean.setUserID(_id);
            boolean confirm = padbean.addpatientadditional();
            
            boolean check = lBean.Validatepatient_afterappointment();
            if(check){
                if(confirm){
                    HttpSession session = request.getSession(true);
                request.setAttribute("logBean", lBean); 
                request.setAttribute("Detailadd_success", " Details added Successfully");
                }
                else{
                     HttpSession session = request.getSession(true);
                request.setAttribute("logBean", lBean); 
                request.setAttribute("Detailadd_Fail", " Failed to add Details");
                }
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/UserProfile.jsp");
            rd.forward(request, response);  
        } catch (SQLException ex) {
            Logger.getLogger(Patient_Additional_Detail.class.getName()).log(Level.SEVERE, null, ex);
        }
           
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
