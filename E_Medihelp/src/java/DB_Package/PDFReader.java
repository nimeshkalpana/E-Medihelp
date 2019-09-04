/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Package;
import Beans_DB_Package.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NIMESH_PC
 */
@WebServlet(name = "PDFReader", urlPatterns = {"/PDFReader"})
public class PDFReader extends HttpServlet {
 private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PDFReader() {
        super();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PDFReader</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PDFReader at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String pdid = request.getParameter("paaid")!=null?request.getParameter("paaid"):"NA";
         String filename = request.getParameter("filename");
         ServletOutputStream sos;
        
         PreparedStatement pstmt;
         
        response.setContentType("application/pdf");
 
        response.setHeader("Content-disposition","inline; filename="+filename+"");

         sos = response.getOutputStream();                    
          ResultSet rset;
            try {
                 Connection conn = DBConnection.connection();
                pstmt = conn.prepareStatement("Select report_files from past_disease_details where id=?");
                pstmt.setString(1, pdid.trim());
                rset = pstmt.executeQuery();
                if (rset.next())
                    sos.write(rset.getBytes("report_files"));
                else
                    return;
                 
            } catch (SQLException e) {
               
                e.printStackTrace();
            }
     
        sos.flush();
        sos.close();
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
