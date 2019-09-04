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
                            
                                <h1>User Profile</h1>
                                
                               
                                <br> 
                </div>
                                   
            </div>
            <!-- End: Heading -->
            <!-- Start : Add User-->
            <div class = "container">
                <div class="row-fluid">
                    <div class="span10 offset1">
                        <div class="page-header ">
                            <h2>Additional Details</h2>
                        </div>
                        <form class="form-add-user" action="Patient_Additional_Detail" method="Post">
                            <div class="span5 offset1">
                                

                                <div class="control-group ">
                                    <div class="controls">
                                        <input type="text" name="contactNo" id="contactNo" placeholder="Contact No" required="true">
                                    </div>
                                </div>
                                   <div class="control-group">
                                    <div class="controls">
                                         <input type="text" name="address" id="address" placeholder="Address" required="true">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="text" name="Blood_Group" id="BloodGroup" placeholder="Blood Group" required="true">
                                    </div>
                                </div>

                               
                            </div>

                            <div class="span5 offset1">
                                <div class="control-group">
                                    <div class="controls">
                                        <h5>B'day:<input type="Date" name="Date" id="date" placeholder="Date" required="true"></h5> 
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                      <h5>Age  :  <input type="number" name="Age" id="age" placeholder="Age" required="true"></h5>
                                    </div>
                                </div>

                               
                               
                                <div class="control-group">
                                    <div class="controls">           
                                        <button type="submit" class="btn btn-large" Style="margin-left: 160px;" name="Additional_detail" value="<%= uID %>" >Add Details </button>
                                    </div>
                                </div>
                            </div>   
                        </form>
                                        <div class="center-align signupMessage">
                                            <%
                                                Object detailSuccessAlert = request.getAttribute("Detailadd_success");
                                                if (detailSuccessAlert != null) {
                                                    out.print("<b>" + request.getAttribute("Detailadd_success") + "</b>");
                                                }
                                                Object detailFailAlert = request.getAttribute("Detailadd_Fail");
                                                    if (detailFailAlert != null) {
                                                out.print("<b>" + request.getAttribute("Detailadd_Fail") + "</b>");
                                                } 
                                            %>
                                        </div>         
                                                    
                    </div>
                </div>
            </div>
            <!-- End: ADD USER-->
            <!-- Start: CURRENT USER-->
             <form action="patient_backto_Dashboard" method="post" name="profile_Form">  
                 <input type="hidden" name="latis" id="latis" > 
                                  <input type="hidden" name="longts" id="longts" > 
                              <button  type="Submit" class="btn btn-large" style="float:right; margin-right: 20px;margin-top: 20px;" name="User_Profile" value="<%=uID%>"> << Back to Dashboard</button>
                               </form> 
                                 <tr>
                            <form action="user_appointments_details" method="post" name="profile_Form">                                       
                              <button  type="Submit" class="btn btn-large" style="float:right; margin-right: 20px;margin-top: 0px;" name="Profile" value="<%=uID%>">My Appointments</button>
                               </form> 
                            </tr>
            <!--End: CURRENT USER-->
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
