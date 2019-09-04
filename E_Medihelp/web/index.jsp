<%-- 
    Document   : index
    Created on : Jun 8, 2018, 9:48:00 AM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Bootbusiness | Short description about company">
        <meta name="author" content="Your name">
        <title>E-Medihelp</title>
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
        <%@ include file="header.jsp" %>
        <!---->
        <!-- Start: MAIN CONTENT -->
        <div class="homeContent">

            <div class="signupContainer">

                <div class="row">
                    <div class="span6 offset3">
                        <h4 class="widget-header"><i class="icon-heart"></i> Create a new account</h4>
                        <div class="widget-body">
                            <div class="center-align signupMessage">
                                <%
                                    Object patientSuccessAlert = request.getAttribute("patientSignupSuccess");
                                    if (patientSuccessAlert != null) {
                                        out.print("<b>" + request.getAttribute("patientSignupSuccess") + "</b>");
                                    }
                                    Object patientFailAlert = request.getAttribute("patientSignupFail");
                                    if (patientFailAlert != null) {
                                        out.print("<b>" + request.getAttribute("patientSignupFail") + "</b>");
                                    }
                                    
                                    Object doctorSuccessAlert = request.getAttribute("doctorSignupSuccess");
                                    if (doctorSuccessAlert != null) {
                                        out.print("<b>" + request.getAttribute("doctorSignupSuccess") + "</b>");
                                    }
                                    Object doctorFailAlert = request.getAttribute("doctorSignupFail");
                                    if (doctorFailAlert != null) {
                                        out.print("<b>" + request.getAttribute("doctorSignupFail") + "</b>");
                                    }
                                %>
                               
                             
                            </div>
                                <br>
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#home">Patient Sign Up</a></li>
                                <li><a data-toggle="tab" href="#menu1">Doctor Sign Up</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="home" class="tab-pane fade in active">
                                    <div class="center-align">
                                        <form class="form-horizontal form-signin-signup" action="Signup_patient" method="Post">
                                            <input type="text" name="firstName" id="firstName" placeholder=" First name" required="true">
                                            <input type="text" name="surname" id="surname" placeholder="Surname">
                                            <input type="text" name="mobileEmail" id="mobileEmail" placeholder="Email address" required="true">                                 
                                            <input type="password" name="password" id="password" placeholder="Password" required="true">
                                            <input type="password" name="password_confirmation" id="password_confirmation" placeholder="Password confirmation" required="true">
                                            <div>
                                                <label>Gender</label>
                                                <select name="gender" >
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>                                                                   
                                                </select>
                                                <br> 
                                                <br> 
                                            </div>
                                            <div>
                                                <input type="submit" value="Signup" class="btn btn-primary btn-large" id="btnSubmit" onclick="return ValidatePatient()">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div id="menu1" class="tab-pane fade">
                                    <div class="center-align">
                                        <form class="form-horizontal form-signin-signup" action="Signup_doctor" method="Post">
                                            <input type="text" name="firstName" id="firstName" placeholder=" First name" required="true">
                                            <input type="text" name="surname" id="surname" placeholder="Surname">
                                            <input type="text" name="docRegNumber" id="docRegNumber" placeholder="Doctor registration number" required="true">
                                            <input type="text" name="medicalCenterRegNumber" id="medicalCenterRegNumber" placeholder="Medical center registration number">                                 
                                            <input type="text" name="mobileEmail" id="mobileEmail" placeholder="Email address" required="true"> 
                                            <input type="password" name="password" id="doc_password" placeholder="Password" required="true">
                                            <input type="password" name="password_confirmation" id="doc_password_confirmation" placeholder="Password confirmation" required="true">
                                            <input type=hidden name="medicalCenterLatitude" id="medicalCenterLatitude" value="0.0">
                                            <input type=hidden name="medicalCenterLongitude" id="medicalCenterLongitude" value="0.0">
                                            <label>Mark medical center location</label>
                                            <div id="google_map" style="width:auto;height:300px;margin-bottom: 10px;"></div>
                                            <div>
                                                <input type="submit" value="Create Account" class="btn btn-primary btn-large" id="btnSubmit" onclick="return ValidateDoctor()">
                                            </div>
                                        </form> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

              

        </div>


        <!-- End: MAIN CONTENT -->

        <!--password validation js-->
        <script type="text/javascript">
            function ValidatePatient() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("password_confirmation").value;
                if (password != confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }
                return true;
            }

            function ValidateDoctor() {
                var password = document.getElementById("doc_password").value;
                var confirmPassword = document.getElementById("doc_password_confirmation").value;
                var latitude = document.getElementById("medicalCenterLatitude").value;
                var longitude = document.getElementById("medicalCenterLongitude").value;
                if (password != confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }
                if (latitude == "0.0" && longitude == "0.0") {
                    alert("Please mark your medical center location in the map.");
                    return false;
                }
                return true;
            }
        </script>

        <!--Google Map js-->

        <script type="text/javascript" src="http://www.google.com/jsapi?key=AIzaSyAw-kfnYV_0ZRjznoVa4OlZDShmE3_7Kzo"></script>
        <script type="text/javascript">
              
            var LATITUDE_ELEMENT_ID = "medicalCenterLatitude";
            var LONGITUDE_ELEMENT_ID = "medicalCenterLongitude";
            var MAP_DIV_ELEMENT_ID = "google_map";

            var DEFAULT_ZOOM_WHEN_NO_COORDINATE_EXISTS = 1;
            var DEFAULT_CENTER_LATITUDE = 22;
            var DEFAULT_CENTER_LONGITUDE = 13;
            var DEFAULT_ZOOM_WHEN_COORDINATE_EXISTS = 15;
            // This is the zoom level required to position the marker
            var REQUIRED_ZOOM = 15;

            google.load("maps", "2.x");

            // The google map variable
            var map = null;

            // The marker variable, when it is null no marker has been added
            var marker = null;

            function initializeGoogleMap() {
                map = new google.maps.Map2(document.getElementById(MAP_DIV_ELEMENT_ID));
                map.addControl(new GLargeMapControl());
                map.addControl(new GMapTypeControl());

                map.setMapType(G_NORMAL_MAP);

                var latitude = +document.getElementById(LATITUDE_ELEMENT_ID).value;
                var longitude = +document.getElementById(LONGITUDE_ELEMENT_ID).value;

                if (latitude != 0 && longitude != 0) {
                    //We have some sort of starting position, set map center and marker
                    map.setCenter(new google.maps.LatLng(latitude, longitude), DEFAULT_ZOOM_WHEN_COORDINATE_EXISTS);
                    var point = new GLatLng(latitude, longitude);
                    marker = new GMarker(point, {draggable: false});
                    map.addOverlay(marker);
                } else {
                    // Just set the default center, do not add a marker
                    map.setCenter(new google.maps.LatLng(DEFAULT_CENTER_LATITUDE, DEFAULT_CENTER_LONGITUDE), DEFAULT_ZOOM_WHEN_NO_COORDINATE_EXISTS);
                }
                GEvent.addListener(map, "click", googleMapClickHandler);
            }

            function googleMapClickHandler(overlay, latlng, overlaylatlng) {
                if (map.getZoom() < REQUIRED_ZOOM) {
                    alert("You need to zoom in more to set the location accurately.");
                    return;
                }
                if (marker == null) {
                    marker = new GMarker(latlng, {draggable: false});
                    map.addOverlay(marker);
                } else {
                    marker.setLatLng(latlng);
                }
                document.getElementById(LATITUDE_ELEMENT_ID).value = latlng.lat();
                document.getElementById(LONGITUDE_ELEMENT_ID).value = latlng.lng();
            }
            google.setOnLoadCallback(initializeGoogleMap);
        </script>


        <!-- Include Footer -->
        <%@ include file="footer.jsp" %>
        <!---->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>

    </body>
</html>
