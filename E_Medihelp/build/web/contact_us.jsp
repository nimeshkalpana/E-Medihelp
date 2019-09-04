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
        <title>Contact Us</title>
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

        <!-- Start: MAIN CONTENT -->
        <div class="content">
            <div class="container">
                <div class="page-header">
                    <h1>Contact us</h1>
                </div>
                <div class="row-fluid">
                    <!-- Start: CONTACT US FORM -->
                    <div class="span4 offset1">
                        <div class="page-header">
                            <h2>Quick message</h2>
                        </div>
                        <form class="form-contact-us">
                            <div class="control-group">
                                <div class="controls">
                                    <input type="text" id="inputName" placeholder="Name">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="text" id="inputEmail" placeholder="Email">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <textarea id="inputMessage" placeholder="Message"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="submit" class="btn btn-primary btn-large" value="Send">
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- End: CONTACT US FORM -->
                    <!-- Start: OFFICES -->
                    <div class="span5 offset1">
                        <div class="page-header">
                            <h2>Offices</h2>
                        </div>
                        <h3>Sri Lanka</h3>
                        <div>
                            <address class="pull-left">
                                <strong>E-Medihelp,</strong><br>
                                23 Flower Ave, Site 600,<br>
                                Sri Lanka<br>
                            </address>
                            <div class="pull-right">
                                <div class="bottom-space">
                                    <i class="icon-phone icon-large"></i> (011)2604-904
                                </div>
                                <a href="mailto:contact@bootbusiness.com" class="contact-mail">
                                    <i class="icon-envelope icon-large"></i>
                                </a> contact@emedihelp.com
                            </div>
                            <div class="clearfix"></div>
                        </div>
<!--                        <h3>Europe</h3>
                        <div>
                            <address class="pull-left">
                                <strong>UnIIn, Inc.</strong><br>
                                55/3 Folsom Ave, Suite 600<br>
                                UK<br>
                            </address>
                            <div class="pull-right">
                                <div class="bottom-space">
                                    <i class="icon-phone icon-large"></i> (123) 123-1234
                                </div>
                                <a href="mailto:contact@bootbusiness.com" class="contact-mail">
                                    <i class="icon-envelope icon-large"></i>
                                </a> contact@uniin.com
                            </div>
                            <div class="clearfix"></div>
                        </div>-->
<!--                        <h3>Asia</h3>
                        <div>
                            <address class="pull-left">
                                <strong>UnIIn, Inc.</strong><br>
                                55 Reed Ave, Maharashta<br>
                                India<br>
                            </address>
                            <div class="pull-right">
                                <div class="bottom-space">
                                    <i class="icon-phone icon-large"></i> (034) 456-7856
                                </div>
                                <a href="mailto:contact@bootbusiness.com" class="contact-mail">
                                    <i class="icon-envelope icon-large"></i>
                                </a> contact@uniin.com
                            </div>
                            <div class="clearfix"></div>
                        </div>-->
                    </div>
                    <!-- End: OFFICES -->
                </div>
            </div>
        </div>
        <!-- End: MAIN CONTENT -->

        <!-- Include Footer -->
        <%@ include file="footer.jsp" %>
        <!---->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>

    </body>
</html>
