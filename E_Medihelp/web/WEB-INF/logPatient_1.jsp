<%-- 
    Document   : index
    Created on : Jun 8, 2018, 9:48:00 AM
    Author     : Rajitha
--%>

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
    <body onload="initialize()" >
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
                            
                                <h1>Hello <%=bean.getFirstName()%> <small>Your nearest medical center click away</small></h1>
                                
                               
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
                                <div class="active item">
                                    <div class="hero-unit">
                                        <div class="row-fluid">
                                            <div class="span7 marketting-info">
                                                <h1>Medicare Medical Center</h1>
                                                <p>
                                                    Opening Hours :<i> 6 AM to 8 AM and 5 PM to 9 PM</i><br>
                                                    Opening Days  :<i> Monday to Friday and Sunday</i><br>
                                                    Contact Number:<i> 714 426 936</i>
                                                </p>                     
                                            </div>
                                            <div class="span5">
                                                <img src="img/imgSlider/medicare.jpg" class="thumbnail">
                                            </div>
                                        </div>                  
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="hero-unit">
                                        <div class="row-fluid">
                                            <div class="span7 marketting-info">
                                                <h1>Aloka Medical Center</h1>
                                                <p>
                                                    Opening Hours :<i> 5 PM to 9 PM</i><br>
                                                    Opening Days  :<i> Monday to Friday</i><br>
                                                    Contact Number:<i> 778 726 698</i> 
                                                </p>                    
                                            </div>
                                            <div class="span5">
                                                <img src="img/imgSlider/aloka.jpg" class="thumbnail">
                                            </div>
                                        </div>                  
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="hero-unit">
                                        <div class="row-fluid">
                                            <div class="span7 marketting-info">
                                                <h1>Neeroga Medical Center</h1>
                                                <p>
                                                    Opening Hours :<i> 7 AM to 9 AM and 6 PM to 9 PM</i><br>
                                                    Opening Days  :<i> Monday to Friday and Saturday</i><br>
                                                    Contact Number:<i> 725 896 963</i>
                                                </p>                   
                                            </div>
                                            <div class="span5">
                                                <img src="img/imgSlider/neeroga.jpg" class="thumbnail">
                                            </div>
                                        </div>                  
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="hero-unit">
                                        <div class="row-fluid">
                                            <div class="span7 marketting-info">
                                                <h1>Deegayu Medical Center</h1>
                                                <p>
                                                    Opening Hours :<i> 8 AM to 11 AM and 3 PM to 7 PM</i><br>
                                                    Opening Days  :<i> Monday to Friday</i><br>
                                                    Contact Number:<i> 773 726 736</i>
                                                </p>                     
                                            </div>
                                            <div class="span5">
                                                <img src="img/imgSlider/deegayu.jpg" class="thumbnail">
                                            </div>
                                        </div>                  
                                    </div>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#heroSlider" data-slide="prev">‹</a>
                            <a class="right carousel-control" href="#heroSlider" data-slide="next">›</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: slider -->
            <!-- Start: Nearby Map -->
            <div class = "container">
                <div class="row-fluid">
                    
                   <h3 align="center">Please select medical center location from map to get appointment details.... </h3>
                        <div  id="patient_google_map" style="width:auto;height:400px;"></div>
                        
                          
                </div>
            </div>
            
            <form action="appointment_from_coordinates" method="post" id="get_coordinates_Form" name="get_coordinates_Form">
           <input type="hidden" name="latis" id="latis" >  
           <input type="hidden" name="longts" id="longts" > 
           <input type="hidden" name="curlatis" id="curlatis" > 
           <input type="hidden" name="curlongts" id="curlongts" > 
           <input type="hidden" name="uid" id="uid" value="<%= uid %>"> 
            </form>

           


           
        <!-- End: MAIN CONTENT -->
        </div> 
        <!--Google Map js-->
    

      <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyA0rFV9dmi2F1Zzs5w7CrJ_1MtC_Zp18o4"></script>
          <script type="text/javascript">
      
                              
                               
                                
                              
                            //var LATITUDE_ELEMENT_ID = "medicalCenterLatitude";
                            // var LONGITUDE_ELEMENT_ID = "medicalCenterLongitude";
                            

                           function initialize() {
                            var map,pos,infoWindow,latitudes,longitudes ;   
                            var ids=document.getElementById("injs");
                             map = new google.maps.Map(
                            document.getElementById('patient_google_map'), {
                            center: new google.maps.LatLng(7.0987, 80.9876),
                             zoom: 10,
                             mapTypeId: google.maps.MapTypeId.ROADMAP
                             });
                             
                            infoWindow = new google.maps.InfoWindow;
                            if (navigator.geolocation) {
                            navigator.geolocation.getCurrentPosition(function(position) {
                            pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                             
                             };
                             
                              
                             
                            infoWindow.setPosition(pos);
                             infoWindow.setContent('you are here');
                            infoWindow.open(map);
                            map.setCenter(pos);
                            }, function() {
                             handleLocationError(true, infoWindow, map.getCenter());
                             });
                             } else {
          // Browser doesn't support Geolocation
                              handleLocationError(false, infoWindow, map.getCenter());
                              }
                           	
        
           <%
               
               List<latlong> medicalCenterLatLong = bean.getMedicalCenterLatLong();
               

              latlong latLongModl;

              for (latlong object : medicalCenterLatLong) {
                   latLongModl = object;
                   double lat = latLongModl.getLat();
                  double lon = latLongModl.getLon();
                 
                 
            %>
                                var latitude = "<%=lat%>";
                                var longitude = "<%=lon%>";

                            

                            var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(latitude, longitude),
                                map: map,
                                title:"Click for get appointment details"
                                 });
                                      
                           
            
                          //Add listener
                              google.maps.event.addListener(marker, "click", function (event) {
                               latitudes= event.latLng.lat();
                               longitudes = event.latLng.lng();
                               document.getElementById("latis").value=latitudes;
                               document.getElementById("longts").value=longitudes;
                               
                               if ("geolocation" in navigator){
		        navigator.geolocation.getCurrentPosition(function(position){ 
			 currentLatitude = position.coords.latitude;
			 currentLongitude = position.coords.longitude;
                          document.getElementById("curlatis").value=currentLatitude;
                          document.getElementById("curlongts").value= currentLongitude;
                         document.getElementById("get_coordinates_Form").submit();
                           });}
                       
                }); //end addListener
                                  
            <%
                 
                                    }                           
            %>

                            
                          
                        
}              
 
                           
                             google.maps.event.addDomListener(window, 'load', initialize);
                           
                            
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
