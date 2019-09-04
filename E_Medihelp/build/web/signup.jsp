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
        <title>Sign Up</title>
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
                    <h1>Signup to E-Madihelp</h1>
                </div>
                <div class="row">
                    <div class="span6 offset3">
                        <h4 class="widget-header"><i class="icon-gift"></i> Be a part of E-Madihelp</h4>
                        <div class="widget-body">
                            <div class="center-align">
                                <form class="form-horizontal form-signin-signup" action="Register_User" method="Post">
                                    <input type="text" name="name" id="name" placeholder="Name">
                                    <input type="text" name="email" id="email" placeholder="Email">                                 
                                    <input type="text" name="uName" id="uName" placeholder="User Name">
                                    <input type="password" name="password" id="password" placeholder="Password">
                                    <input type="password" name="password_confirmation" id="password_confirmation" placeholder="Password Confirmation">
                                    <div>
                                        <select name="category">
                                            <option value="student">Student</option>
                                            <option value="industry">Industry</option>
                                            <option value="university">University</option>                                        
                                        </select>
                                        <br> 
                                        <br> 

                                    </div>
                                    <div>
                                        <input type="submit" value="Signup" class="btn btn-primary btn-large" id="btnSubmit" onclick="return ValidateSignUp();">
                                    </div>
                                </form>
                                <h4><i class="icon-question-sign"></i> Already have an account?</h4>
                                <a href="signin.jsp" class="btn btn-large bottom-space">Signin</a>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: MAIN CONTENT -->

        <!--password validation js-->
        <script type="text/javascript">
            function ValidateSignUp() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("password_confirmation").value;
                if (password != confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }
                return true;
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
