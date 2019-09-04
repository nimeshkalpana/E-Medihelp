<%-- 
    Document   : medicalCenter
    Created on : Nov 30, 2018, 8:14:13 PM
    Author     : Rajitha
--%>

<%@page import="Beans_DB_Package.Disease_treatment_fileupload_Bean"%>
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
                            Patient_Profile_for_McBean ppfm = (Patient_Profile_for_McBean) request.getAttribute("ppfmbean");
                            int pid=ppfm.getPatient_id();
                            int paid=ppfm.getPatient_appointment_id();
                           
                             
                        %> 

                    </div>
                    <h1>Add Disease and Treatment details</h1>  
                </div>
            </div>
              
          
            <!-- Start : Add User-->
            
            <div class = "container">
                
                <div class="row-fluid">
                    
                    <div class="span10 offset1">
                                <!-- Start: Todays Appointment-->
                                 <div class="page-header ">
                            <h3> Appointment Details </h3>
                        </div>
                       
                        <table align="center" cellpadding="5" cellspacing="5" border="0">
                            

                            <%
                                try {
                                    Connection connection = DBConnection.connection();
                                    Statement statement = connection.createStatement();
                                    String sql = "SELECT pr.first_name, pr.surname,pr.gender,pa.appointment_date,pa.appointment_time, pa.appointment_number FROM patient_registered AS pr inner join patient_appointment AS pa where pa.patient_id=pr.id and pa.id='"+paid+"'";
                                     
                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                                    String fname=resultSet.getString("first_name");
                                    String gender=resultSet.getString("gender");
                                     String path;
                              if(null == application.getResource("/img/users/-'"+fname+"'.png"))
                                  {
                                      if(gender.equals("Male"))
                                      {
                                         path = "img/users/defaultboy.png"; 
                                      }
                                      else
                                      {
                                          path = "img/users/defaultgirl.png";  
                                      }
                                      
                                  }     
                                    else
                                      
                                  { 
                                      path = "img/users/-'"+fname+"'.png";
                                  }
                                 
                            %>
                            <tr >

                            <div class="row bottom-space">
                                <div class="span1 offset1">
                                    
                                    <div>
                                         <img class="img-circle" src="<%=path%>"/>
                                    </div>
                                </div>
                                <div class="span9">
                                    <h3><%=resultSet.getString("first_name")%>  <%=resultSet.getString("surname")%></h3>
                                    <p>
                                    <h5>    Appointment Date:&nbsp;<%=resultSet.getDate("appointment_date")%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Appointment Time:&nbsp; <%=resultSet.getTime("appointment_time")%>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          Appointment No:&nbsp;<%=resultSet.getInt("appointment_number")%></h5>
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
                  
            <!--End: Todays Appointment-->   
                        <div class="page-header ">
                            <h3> Disease and Treatment Details</h3>
                        </div>
            <div class="center-align signupMessage">
                                            <%
                                             Object removeSuccessAlert = request.getAttribute("pdffail");
                                                if (removeSuccessAlert != null) {
                                                    out.print("<b>" + request.getAttribute("pdffail") + "</b>");
                                                     out.println("<br><br><br>");                                                     
                                                }
                                               
                                               
                                            %>
                                        </div>   
                        <form class="form-add-user" action="Disease_treatment_fileupload" method="Post" enctype="multipart/form-data" >
                            <div class="span5 offset1">
                                <div class="control-group ">
                                    <div class="controls">
                                        <h4>Disease Details</h4> 
                                         <textarea rows = "5" cols = "60" name = "disease">Enter Disease details here... </textarea><br>                                         
                                          </div>
                                </div>

                               
                                <div class="control-group">
                                    <h4>upload Reports  (.pdf)</h4>
                                     <input type="file" name="attachfile" id="attachfile" value="Attach files">
                                </div>
                            </div>

                            <div class="span5 offset1">
                                <div class="control-group">
                                    <div class="controls">
                                        <h4> Treatment Details</h4>
                                         <textarea rows = "5" cols = "60" name = "Treatment">Enter Treatment details here... </textarea><br>                                         
                                          </div>
                                   
                                </div>                                                            
                                <div class="control-group">
                                    <div class="controls">
                                        <input type="hidden" name="mcID" id="mcID" value="<%= uID %>"> 
                                        <input type="hidden" name="paID" id="paID" value="<%= paid %>">       
                                        <button type="submit" class="btn btn-primary btn-large"  name="pid" id="pid" value="<%= pid %>">Add</button> 
                                    </div>
                                </div>
                            </div>   
                        </form>
                                                   
                    </div>
                </div>
            </div>
            <!-- End: ADD USER-->
           
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
