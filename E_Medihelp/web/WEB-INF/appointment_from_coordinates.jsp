<%-- 
    Document   : index
    Created on : Jun 8, 2018, 9:48:00 AM
    Author     : Rajitha
--%>

<%@page import="java.sql.Time"%>
<%@page import="Beans_DB_Package.appointment_from_coords_bean"%>
<%@page import="DB_Package.appointment_from_coordinates"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Beans_DB_Package.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Models.latlong"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Date"%>
<%@page import="Beans_DB_Package.LoginBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="E-Medihelp | online healthcare servicess provider">
        <meta name="author" content="E-Medihelp">
        <title>E-Medihelp Patient</title>
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
    <body >
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
                            int uid=bean.getUserID();
                             appointment_from_coords_bean afcb = (appointment_from_coords_bean) request.getAttribute("ap_coords");
                                  String doctor= afcb.getDoctor();
                                  String doctor_registratiion = afcb.getDoctor_registration();
                                  String mc_registration = afcb.getMc_registration();
                                  String mobile_email = afcb.getMobile_or_email();
                                  String mc_name = afcb.getMc_name();
                                  Date ap_date  = afcb.getAppointment_date();
                                  Time ap_time  = afcb.getAppointment_time();
                                  int ap_no = afcb.getAppointment_no();
                                  int mcid = afcb.getMcid();
                                  double mclongtitude =afcb.getAppointmentlongtitude();
                                  double mclatitude= afcb.getAppointmentlatitude();
                                  double currentlatitude = afcb.getCurrentlatitude();
                                  double currentlongtitude = afcb.getCurrentlongitude();
                                   String fnme = bean.getFirstName();
                                        
                                        String gender=bean.getGender();                                      
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
                            <form action="Patient_profile" method="post" name="profile_Form">                                       
                              <button  type="Submit" class="btn btn-large" style="float:left; margin-right: 5px;margin-top: 10px;" name="User_Profile" value="<%=uid%>">User Profile</button>
                               </form> 
                            </tr>
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
                                        
                                        
                                       // int uid =bean.getUserID();
                                       // out.println(uid);
                                        /* List<latlong> medicalCenterLatLong = bean.getMedicalCenterLatLong();
                                        medicalCenterLatLong.get(0);
                                        latlong latLongModl = medicalCenterLatLong.get(0);
                                        
                                        for (latlong object : medicalCenterLatLong) {
                                            latLongModl= object;
                                            out.println(latLongModl.getLat());
                                            out.println(latLongModl.getLon());
                                        }*/
                                    %> 
                                </td>
                            </tr>
                            <tr>
                                <th>Last visit :</th>
                                <td><%= new Date(session.getLastAccessedTime())%></td>
                            </tr>
                             
                        </table>
                             
                    </div>
                            
                                <h1> MAKE YOUR APPOINTMENT </h1>
                                
                               
                                <br> 
                </div>
                                   
            </div>
            <!-- End: Heading -->
            <!-- Start: slider -->
            <div container>
                <div class="slider">
                    <div class="container-fluid">
                        <div id="heroSlider" class="carousel slide">
                            <div class="carousel-inner">
                                
                                <!-- Start: Medical centers detail-->
            
            <div class = "container">
                <div class="row-fluid">
                    
                    
                        <h2 align="center">LETS MAKE YOUR APPOINTMENT</h2>
                       
                        <p id="injs">
                            
                               
                        <table align="center" cellpadding="5" cellspacing="5" border="10">

                              <tr bgcolor="#BDBDBD">
                                <td align="center"><b>Doctor</b></td>
                               <td align="center"><b>Doctor Reg</b></td>
                                <td align="center"><b>Medical Center Reg</b></td>
                               <td align="center"><b>Email or Mobile</b></td>
                                <td align="center"><b>Appointment Date</b></td>
                                <td align="center"><b>Appointment Time</b></td>                               
                               <td align="center"><b>Your Number</b></td>
                                <td align="center"><b>Make Appointment</b></td>
                            </tr>
                            
                            <tr bgcolor="#F2F2F2">

                                   <td align="center"><%=doctor%></td>
                                   <td align="center"><%=doctor_registratiion%></td>
                                   <td align="center"><%=mc_registration%></td>
                                   <td align="center"><%=mobile_email%></td>
                                   <td align="center"><%=ap_date%></td>
                                   <td align="center"><%=ap_time%></td>
                                   <td align="center"><%=ap_no%></td>
                               
                                <td>
                                    <form action="Patient_Appointment" method="post" name="Make_Appointment_Form">
                                        <input type="hidden" name="puid" id="puid" value="<%= uid %>">  
                                        
                                        <button type="Submit" class="btn btn-small"  name="Make_Appointment" value="<%=mcid%>">Make Appointment</button>
                                        
                                    </form>
                                </td>
                            </tr>
                      
                           
                        </table> 
                        </p>                        
                    
                </div>
            </div>
            <!-- <!-- End: Medical centers detail onclick="return Confirmation();" -->
            <!-- Start: Nearby Map -->
            <br><br>
            <div class = "container">
                <div class="row-fluid">           
                        <div  id="patient_google_map" style="width:auto;height:400px;"></div>   
                       
                        <br>
                        <br>
                </div>
            </div>
           
      
        </div> 
       </div>
      </div>
     </div>
                                        <tr>
                            <form action="patient_backto_Dashboard" method="post" name="profile_Form">                                       
                              
                               <input type="hidden" name="latis" id="latis" value="<%= currentlatitude %>"> 
                                <input type="hidden" name="longts" id="longts" value="<%= currentlongtitude %>"> 
                                
                                <button  type="Submit" class="btn btn-large" style="float:right; margin-right: 20px;margin-top: 10px;" name="User_Profile" value="<%=uid%>"> << Back to Dashboard</button>
                               </form> 
                            </tr>
    </div>
                          <!-- End: MAIN CONTENT -->
                        </div>
        <!--Google Map js-->
    

      <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyA0rFV9dmi2F1Zzs5w7CrJ_1MtC_Zp18o4"></script>
          <script type="text/javascript">
                                            
                           
          function initMap() {
      
       
          var latitudes = <%=mclatitude%>;
          var currentlatitude =<%=currentlatitude%>; 
          var currentlongitude =<%=currentlongtitude%>; 
        var longitudes = <%=mclongtitude%>;
        var medical_center = {lat: latitudes, lng: longitudes};
        var map = new google.maps.Map(document.getElementById('patient_google_map'), {
          zoom: 20,
          center: medical_center
        });
        
                var marker = new google.maps.Marker({
                position: new google.maps.LatLng(currentlatitude, currentlongitude),
                    map: map,
                    title:"you are here"
                     });
                     
        var contentString ="<%=mc_name%>" ;
       
       if (typeof contentString === 'undefined' || !contentString || contentString.length === 0 || contentString === "" || !/[^\s]/.test(contentString) || /^\s*$/.test(contentString) || contentString.replace(/\s/g,"") === "" || contentString === null)
       {
           infoWindow = new google.maps.InfoWindow;
        infoWindow.setPosition(medical_center);
       infoWindow.setContent("Medical Center");
        infoWindow.open(map);
       }
        else
        {
            infoWindow = new google.maps.InfoWindow;
            infoWindow.setPosition(medical_center);
            infoWindow.setContent(contentString);
            infoWindow.open(map);
        }
      }
       google.maps.event.addDomListener(window, 'load', initMap);


                      
        </script>
               

        
        <script type="text/javascript">
            function Confirmation() {
                alert("Your appointment has been recorded");                             
             
            }
        </script> 

        <!-- Include Footer -->
        <%@ include file="logFooter.jsp" %>
        <!---->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>

    </body>
</html>
