<%-- 
    Document   : header
    Created on : Jun 8, 2018, 6:54:30 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <body onload="getLocation()">
        <!-- Start: HEADER -->
        <header>
            <!-- Start: Navigation wrapper -->
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <a href="index.jsp" class="brand brand-bootbus"><img src="img/logo.png" alt="logo"></a>
                        <!-- Below button used for responsive navigation -->
                        <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Start: Primary navigation -->
                        <div class="nav-collapse collapse">  
                            <form class="form-horizontal form-signin"  action="Login"  method="Post">
                                <ul class="nav pull-right">
                                    <li><input type="text" name="uName" placeholder="Email"></li>
                                    <li><input type="password" name="pass" placeholder="Password">                                                                     
                                        <div class=" forgotPasswordContainer">
                                             <%
                                    Object loginunSuccessAlert = request.getAttribute("IncorrectUsernameorPassword");
                                    if (loginunSuccessAlert != null) {
                                        out.print("<b>" + request.getAttribute("IncorrectUsernameorPassword") + "</b>");
                                         out.println("<br>");
                                    }
                                    %> 
                                        <a href="forgot_password.jsp">Forgot password?</a>
                                        </div>
                                      
                                    </li>
                                        
                                        <input type="hidden" name="lats" id="lats" placeholder="lats" >
                                        <input type="hidden" name="lons" id="lons" placeholder="lons" >
                                    <li><input type="submit" value="Sign In" class=" signinBtn btn-primary"></li>
                                </ul> 
                                     
                            </form>
                        </div>

                    </div>                  
                </div>
               
            </div>
            <script>

            <!-- End: Navigation wrapper -->   
        </header>
        <!-- End: HEADER -->
         <script type="text/javascript" src="http://www.google.com/jsapi?key=AIzaSyAw-kfnYV_0ZRjznoVa4OlZDShmE3_7Kzo"></script>
             <script type="text/javascript">
         
                   function getLocation() {
                   if (navigator.geolocation) {
                     navigator.geolocation.getCurrentPosition(showPosition);
                     } else {
                        x.innerHTML = " iGeolocations not supported by this browser.";
                     }
                       }

                function showPosition(position) {
                    var lat = position.coords.latitude;
                    var long = position.coords.longitude;
                    document.getElementById("lats").value=lat;
                    document.getElementById("lons").value=long;
               
                 }
                 </script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>
    </body>
</html>
