<%-- 
    Document   : medicalCenter
    Created on : Nov 30, 2018, 8:14:13 PM
    Author     : Rajitha
--%>

<%@page import="Beans_DB_Package.Disease_treatment_fileupload_Bean"%>
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
                            int mcid= bean.getMc_medical_center_Id();
                             
                             
                            
                        %> 
                         
                    </div>
                    <%out.print("<h1>" + bean.getMedicalCenterName() + "</h1>");%>
                </div>
            </div>
  
           
            <!-- Start: Todays Appointment-->
            <div class = "container">
                <div class="row-fluid">
                    <div class="span10 offset1">
                        <div class="page-header ">
                            <h2> Upcoming Appointments</h2>
                        </div>
                        <table align="center" cellpadding="5" cellspacing="5" border="0">
                             
                                               
                                                <div class="center-align signupMessage">
                                            <%
                                             Object removeSuccessAlert = request.getAttribute("remove_success");
                                                if (removeSuccessAlert != null) {
                                                    out.print("<b>" + request.getAttribute("remove_success") + "</b>");
                                                     out.println("<br><br><br>");
                                                     
                                                }
                                                Object userSuccessAlert = request.getAttribute("Appoinment_success");
                                                if (userSuccessAlert != null) {
                                                     
                                                    out.print("<b>" + request.getAttribute("Appoinment_success") + "</b>");
                                                    out.println("<br><br><br>");
                                                               
                                                }
                                               
                                            %>
                                        </div>  
                                               
                                            

                            <%
                                try {String path;
                                    Connection connection = DBConnection.connection();
                                    Statement statement = connection.createStatement();
                                    String sql = "SELECT pr.id AS prid, pr.first_name, pr.surname, pr.mobile_or_email, pr.gender,pa.id,pa.appointment_date,pa.appointment_time, pa.appointment_number FROM patient_registered AS pr inner join patient_appointment AS pa where pr.id=pa.patient_id and pa.medical_center_id='"+mcid+"'";

                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                                         String first_name= resultSet.getString("first_name");
                                         String gender= resultSet.getString("gender");
                                         
                                  if(null == application.getResource("/img/users/-'"+first_name+"'.png"))
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
                                      path = "img/users/-'"+first_name+"'.png";
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
                                    <div class="row offset9">
                                        <form action="Patient_Profile_for_Mc" method="post" name="Delete_Form" >
                                            <input type="hidden" name="mcID" id="mcID" value="<%= uID%>">
                                            <button type="Submit" class="btn btn-small"  name="Detail" value="<%=resultSet.getString("prid")%>">View Profile</button>                                          
                                        </form>
                                        <form action="remove_patient_appointment" method="post" name="Delete_Form" style="float:right; ">
                                            <input type="hidden" name="mcID" id="mcID" value="<%= uID%>">                                           
                                            <button type="Submit" class="btn btn-small" style="float:right; "name="Delete"  value="<%=resultSet.getString("id")%>">Remove</button>
                                        </form>
                                         <form action="add_disease_treatment_page" method="post" name="Delete_Form"style="float:right; " >
                                            <input type="hidden" name="mcIDD" id="mcID" value="<%= uID%>">    
                                            <input type="hidden" name="paid" id="paid" value="<%=resultSet.getString("id")%>">  
                                            <button type="Submit" class="btn btn-small"  style="float:right; margin-top: 5px; margin-right: 10px; "name="pidd"  value="<%=resultSet.getString("prid")%>">Add Disease Details</button>
                                        </form>
                                        
                                    </div>
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
