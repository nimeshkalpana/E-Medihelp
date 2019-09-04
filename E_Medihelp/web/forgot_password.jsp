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
        <title>Sign In</title>
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
        <%@ include file="header.jsp" %>
        <!---->

        <!-- Start: MAIN CONTENT -->
        <div class="content">
            <div class="container">
                <div class="page-header">
                </div>
                <div class="row ">
                    <div class="span6 offset3">
                        <h4 class="widget-header"><i class="icon-lock"></i> Find Your Account</h4>
                        <div class="widget-body">
                            <div class="center-align">
                                <div class="page-header">
                                    <h5>Please enter your email address. We will send your Login Credentials.</h5>
                                </div>
                                <form class="form-horizontal form-signin-signup" name="forgotPWForm" action="Forgot_Password" method="Post">
                                    <input type="text" name="email" placeholder="Enter your email address">
                                    <div class="remember-me"></div>
                                    <input type="submit" value="Search" class="btn btn-primary btn-large" onclick="return ValidateForgotPW();">
                                </form>   
                                <h4><i class="icon-question-sign"></i> Don't have an account?</h4>
                                <a href="index.jsp" class="btn btn-large bottom-space">Signup</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: MAIN CONTENT -->
        
        <!--Email validation JS-->
        <script type="text/javascript">
          function ValidateForgotPW() {
                var emailAddress = document.forgotPWForm.email.value;
                filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                
                if (filter.test(emailAddress)) {
                    alert("We will send your login credentials.");                             
                    return true;
                }else{
                    alert("Invalied email address.");
                    return false;
                }
            }      
                        
        </script>  

        <!-- Include Footer -->
        <%@ include file="footer.jsp" %>
        <!---->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>

    </body>
</html>
