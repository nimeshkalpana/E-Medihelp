<%-- 
    Document   : medicalCenter
    Created on : Nov 30, 2018, 8:14:13 PM
    Author     : Rajitha
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="Beans_DB_Package.Patient_Profile_for_McBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Beans_DB_Package.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Date"%>
<%@page import="Beans_DB_Package.LoginBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Bootbusiness | Short description about company">
        <meta name="author" content="Your name">
        <title>E-Medihelp Medical Center</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap responsive -->
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <!-- Font awesome - iconic font with IE7 support --> 
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="css/font-awesome-ie7.css" rel="stylesheet">
        <!-- Bootbusiness theme -->
        <link href="css/boot-business.css" rel="stylesheet">

    </head>
    <body>
        <!-- Include Header -->
        <%@ include file="logHeader.jsp" %>
        <!---->
         
        <!-- Start: MAIN CONTENT -->
        <div class="content">
            <div class="container">
                <div class="page-header">
                    <div class="pull-right">
                        <b>Your last visit :</b> <%= new Date(session.getLastAccessedTime())%><br>
                        <%
                            LoginBean bean = (LoginBean) request.getAttribute("logBean");
                            out.print("<b>You logged in as : </b>" + bean.getFirstName());
                            int uID = bean.getUserID();
                            Patient_Profile_for_McBean ppfm= (Patient_Profile_for_McBean)request.getAttribute("ppfmbean");
                            int pid=ppfm.getPatient_id();
                        %> 

                    </div>
                    <h1>Patient Profile</h1>  
                </div>
            </div>
            <!-- Start: Todays Appointment-->
            <div class = "container">
                <div class="row-fluid">
                    <div class="span10 offset1">
                        
                        <table align="center" cellpadding="5" cellspacing="5" border="0">

                            <%
                                try {
                                    Connection connection = DBConnection.connection();
                                    Statement statement = connection.createStatement();
                                    String sql = "select first_name,surname,gender,Birth_day,Address,Blood_group,Contact_No,Age from patient_registered where id='"+pid+"'";

                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>
                            <tr >

                            <div class="row bottom-space">
                               
                                <div class="span9" >
                                    
                                    <p >
                                        <h4>  Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=resultSet.getString("first_name")%>  &nbsp;<%=resultSet.getString("surname")%>    </h4>
                                        <h4>Gender&nbsp;&nbsp;&nbsp; :&nbsp;<%=resultSet.getString("gender")%></h4>
                                        <h4>  Address&nbsp; :&nbsp;<%=resultSet.getString("Address")%>  </h4>
                                        <h4>  Birth day :&nbsp;<%=resultSet.getDate("Birth_day")%>  </h4>
                                        <h4>  Contact&nbsp;&nbsp;  :&nbsp;<%=resultSet.getInt("Contact_No")%>  </h4>
                                        <h4>  Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=resultSet.getInt("Age")%>&nbsp;&nbsp;years  </h4>
                                        <h4>  Blood&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=resultSet.getString("Blood_group")%>  </h4>
                                    </p>
                                    
                                </div>
                                    
                            </div>
                            </tr>
                            <%
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
            <!--End: Todays Appointment-->
          
            
             <!-- Start: past appointments-->
            <div class = "container">
                <div class="row-fluid">
                    <div class="span10 offset1">
                        <div class="page-header ">
                            <h2>Past Disease/Treatment Details</h2>
                        </div>
                         
                                           
                        <table align="center" cellpadding="5" cellspacing="5" border="10">
                            <tr bgcolor="#BDBDBD">
                                <td align="center"><b>Medical Center</b></td>
                                 <td align="center"><b>Date Treated</b></td>
                                 <td align="center"><b>Disease Details</b></td>
                                 <td align="center"><b>Treatments</b></td>
                                 <td align="center"><b>Reports</b></td>
                                
                            </tr>
                            <%
                                try {
                                    Connection connection = DBConnection.connection();
                                    Statement statement = connection.createStatement();
                                    String sql = "select id,medical_center,date,disease_details,treatments,filename,report_files from past_disease_details where patient_id='"+pid+"' order by date DESC";

                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>
                            
                            <tr bgcolor="#F2F2F2">
                                 <td align="center"><%=resultSet.getString("medical_center")%></td>
                                 <td align="center"><%=resultSet.getDate("date")%></td>
                                 <td align="center"><%=resultSet.getString("disease_details")%></td>
                                 <td align="center"><%=resultSet.getString("treatments")%></td>
                                 <form   action="PDFReader" method="get" >
                                     <input type="hidden" name="filename"  value="<%=resultSet.getString("filename")%>">   
                                    <td align="center"> <button type="Submit" class="btn btn-link" name="paaid" value=<%=resultSet.getString("id")%>> <%=resultSet.getString("filename")%></button> </td> 
                                                                                                                                                                                                     
                                 </form>
                            </tr>
                             
                                <%
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }                               
                            %>
                        </table>
                       
                                       
                    </div>
                </div>
            </div>
            <!--End: CURRENT USER-->
             <tr>
                            <form action="Patient_appointments_for_doctors" method="post" name="profile_Form">                                       
                              <button  type="Submit" class="btn btn-large" style="float:right; margin-right: 20px;margin-top: 10px;" name="doctor_appointment" value="<%=uID%>"> << Back to Dashboard</button>
                               </form> 
                            </tr>
        </div>
        <!-- End: MAIN CONTENT -->

        <!-- Include Footer -->
         
        <%@ include file="logFooter.jsp" %>
        <!---->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>

    </body>
</html>
