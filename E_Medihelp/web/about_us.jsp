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
        <title>About Us</title>
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
        <%@include file="WEB-INF/logHeader.jsp" %>
        <!---->

        <!-- Start: Main content -->
        <div class="content">    
            <div class="container">
                <!-- Start: Product description -->
                <airticle class="article">
                    <div class="row bottom-space">
                        <div class="span12">
                            <div class="page-header">
                                <h1>About Us</h1>
                            </div>
                        </div>
                        <div class="span12 center-align">
                            <img src="img/Abt.jpg" class="thumbnail product-snap">            
                        </div>
                    </div>
                    <div class="row">
                        <div class="span10 offset1">
                            <p>
                                In this system provide solution for small and medium size medical centers all kinds of issues by implementing 
                                universal web application for small and medium size medical service industry. This system helpful for patent, 
                                doctor, as well as any one interacts with medical center. 
                                <br><br>
                              
                                The doctor point of view doctors able to create their own medical center account. This account related to 
                                his medical center. All medical center activities can manage using that account. Like that any doctor can 
                                create medical center account and use it for his medical center apart of establishing an information system 
                                to his medical center.
                                <br><br>
                                From a patient point of view patient able to access this universal software for access 
                                all small and medium size medical centers in a single place. Patient able to see the nearest medical center and 
                                doctor available time, current appointments. 
                                                                
                            </p>
                                                                                                                        
                        </div>      
                    </div>
                    
                </airticle>
                <!-- End: Product description -->
            </div>
        </div>

        <!-- End: Main content -->

        <!-- Include Footer -->
        <%@ include file="footer.jsp" %>
        <!---->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>

    </body>
</html>
