<%-- 
    Document   : medicalCenter
    Created on : Nov 30, 2018, 8:14:13 PM
    Author     : Rajitha
--%>

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
            <!-- Start: Heading -->
            <div class="container">
                <div class="page-header">
                    
                    <div class="pull-right">
                        <%
                            LoginBean bean = (LoginBean) request.getAttribute("logBean");
                            int uID=bean.getUserID();
                            String fnme = bean.getFirstName();
                            String gender= bean.getGender();
                            String path;
                              if(null == application.getResource("/img/users/-'"+fnme+"'.png"))
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
                                      path = "img/users/-'"+fnme+"'.png";
                                  }
                                 
                        %> 
                           
                        <table>
                            
                            <tr>
                                 
                                <td rowspan="2">
                                   <div class="span1 offset1">
                                    <div>
                                         <img class="img-circle" src="<%=path%>"/>
                                    </div>
                                </div>
                                </td>
                               
                                <th>User :</th>
                                <td>
                                    <%
                                        
                                        out.print(fnme);
        
                                    %> 
                                </td>
                            </tr>
                            <tr>
                                <th>Last visit :</th>
                                <td><%= new Date(session.getLastAccessedTime())%></td>
                            </tr>
                             
                        </table>
                             
                    </div>
                            
                                <h1>User appointments details</h1>
                                
                               
                                <br> 
                </div>
                                   
            </div>
            <!-- End: Heading -->
            
            <!-- Start: CURRENT USER-->
            <div class = "container">
                <div class="row-fluid">
                    <div class="span10 offset1">
                        <div class="page-header ">
                            <h2>Current Appointments</h2>
                        </div>
                        <div align ="center" >
                                            <%
                                                Object AppointmentSuccessAlert = request.getAttribute("Appointment_success");
                                                if (AppointmentSuccessAlert != null) {
                                                    out.print("<b ><h3>" + request.getAttribute("Appointment_success") + "</h3></b>");
                                                }
                                                Object AppointmentFailedAlert = request.getAttribute("Appointment_Fail");
                                                    if (AppointmentFailedAlert != null) {
                                                out.print("<b>" + request.getAttribute("Appointment_Fail") + "</b>");
                                                } 
                                            %>
                                        </div>    
                                        
                                           
                        <table align="center" cellpadding="5" cellspacing="5" border="10">
                            <tr bgcolor="#BDBDBD">
                                <td align="center"><b>Doctor</b></td>
                                <td align="center"><b>Medical Center</b></td>
                                <td align="center"><b>Address</b></td>
                                <td align="center"><b>Email or Mobile</b></td>
                                <td align="center"><b>Appointment Date</b></td>
                                <td align="center"><b>Appointment Time</b></td>
                                <td align="center"><b>Appointment Number</b></td>
                                
                            </tr>
                            <%
                                try {
                                    Connection connection = DBConnection.connection();
                                    Statement statement = connection.createStatement();
                                    String sql = "SELECT dr.first_name,dr.medical_center_name,dr.medical_center_address,dr.mobile_or_email,pa.appointment_date,pa.appointment_time,pa.appointment_number from patient_appointment AS pa INNER JOIN doctor_registered AS dr on pa.medical_center_id = dr.id where pa.patient_id = '"+uID+"'order by pa.id  desc ";

                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>
                            <tr bgcolor="#F2F2F2">
                                 <td align="center"><%=resultSet.getString("first_name")%></td>
                                 <td align="center"><%=resultSet.getString("medical_center_name")%></td>
                                 <td align="center"><%=resultSet.getString("medical_center_address")%></td>
                                 <td align="center"><%=resultSet.getString("mobile_or_email")%></td>
                                 <td align="center"><%=resultSet.getDate("appointment_date")%></td>
                                 <td align="center"><%=resultSet.getTime("appointment_time")%></td>
                                 <td align="center"><%=resultSet.getInt("appointment_number")%></td>
                               
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
            <br
                <br
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
                                    String sql = "select id,medical_center,date,disease_details,treatments,filename,report_files from past_disease_details where patient_id='"+uID+"' order by date DESC";

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
                            <form action="patient_backto_Dashboard" method="post" name="profile_Form">   
                                  <input type="hidden" name="latis" id="latis" > 
                                  <input type="hidden" name="longts" id="longts" > 
                              <button  type="Submit" class="btn btn-large" style="float:right; margin-right: 20px;margin-top: 10px;" name="User_Profile" value="<%=uID%>"> << Back to Dashboard</button>
                               </form> 
                            </tr>
        </div>
        <!-- End: MAIN CONTENT -->
          <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyA0rFV9dmi2F1Zzs5w7CrJ_1MtC_Zp18o4"></script>
          <script type="text/javascript">
      
                              
                               
                                
                              
                            //var LATITUDE_ELEMENT_ID = "medicalCenterLatitude";
                            // var LONGITUDE_ELEMENT_ID = "medicalCenterLongitude";
                            

                           function initialize() {
                                                  
                               if ("geolocation" in navigator){
		        navigator.geolocation.getCurrentPosition(function(position){ 
			 currentLatitude = position.coords.latitude;
			 currentLongitude = position.coords.longitude;
                          document.getElementById("latis").value=currentLatitude;
                          document.getElementById("longts").value= currentLongitude;
                        
                         //document.getElementById("get_coordinates_Form").submit();
                           });}                         
                        
}              
 
                           
                             google.maps.event.addDomListener(window, 'load', initialize);
                           
                            
        </script>
        <!-- Include Footer -->
         
        <%@ include file="logFooter.jsp" %>
        <!---->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>

    </body>
</html>
