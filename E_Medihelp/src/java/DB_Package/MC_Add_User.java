/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;

import Beans_DB_Package.LoginBean;
import Beans_DB_Package.MCAddUserBean;
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
 * @author Rajitha
 */
@WebServlet(name = "MC_Add_User", urlPatterns = {"/MC_Add_User"})
public class MC_Add_User extends HttpServlet {

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
            out.println("<title>Servlet MC_Add_User</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MC_Add_User at " + request.getContextPath() + "</h1>");
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
        
        String _name = request.getParameter("name");
        String _address = request.getParameter("address");
        String _contactNumber = request.getParameter("contactNo");
        String _email= request.getParameter("email");
        String _designation = request.getParameter("dsignation");
        String _dutyStartTime = request.getParameter("dutyStartTime");
        String _dutyEndTime= request.getParameter("dutyEndTime");
        String _userName = request.getParameter("userName");
        String _password = request.getParameter("password");
        int _mcID = Integer.parseInt(request.getParameter("mcID"));
        
        
        MCAddUserBean mcAddUser = new MCAddUserBean();
        
        mcAddUser.setName(_name);
        mcAddUser.setAddress(_address);
        mcAddUser.setContactNo(_contactNumber);
        mcAddUser.setEmail(_email);
        mcAddUser.setDesignation(_designation);
        mcAddUser.setDutyStartTime(_dutyStartTime);
        mcAddUser.setDutyEndTime(_dutyEndTime);
        mcAddUser.setUserName(_userName);
        mcAddUser.setPassword(_password);
        mcAddUser.setMcID(_mcID);
        
        boolean check = mcAddUser.AddUsers();
        
        LoginBean lBean = new LoginBean();
        lBean.setUserID(_mcID);
        boolean checkUser = lBean.ValidateMCUser();
        
        if (check) {
                if(checkUser){
                    HttpSession session = request.getSession(true);
                    request.setAttribute("logBean", lBean);
                }  
            request.setAttribute("userAddSuccess", "Successfully create new user account.");
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/medicalCenterDashboard.jsp");
            rd.forward(request, response);             
        } else {
                if(checkUser){
                    HttpSession session = request.getSession(true);
                    request.setAttribute("logBean", lBean);
                } 
            request.setAttribute("userAddFail", "Account creation fail.");
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/medicalCenterDashboard.jsp");
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
