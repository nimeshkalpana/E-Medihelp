<%-- 
    Document   : footer
    Created on : Jun 8, 2018, 6:58:11 PM
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
    <body>

        <!-- Start: FOOTER -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="span2">
                        <h4><i class="icon-beaker icon-white"></i> About</h4>
                        <nav>
                            <ul class="quick-links">
                                <li><a href="about_us.jsp">Our works</a></li>
                                <li><a href="about_us.jsp">Patnerships</a></li>
                                <li><a href="about_us.jsp">Leadership</a></li>
                            </ul>
                        </nav>          
                    </div>
                    <div class="span2">
                        <h4><i class="icon-thumbs-up icon-white"></i> Support</h4>
                        <nav>
                            <ul class="quick-links">
                                <li><a href="faq.jsp">FAQ</a></li>
                                <li><a href="contact_us.jsp">Contact us</a></li>            
                            </ul>
                        </nav>
                    </div>
                    <div class="span2">
                        <h4><i class="icon-legal icon-white"></i> Legal</h4>
                        <nav>
                            <ul class="quick-links">
                                <li><a href="#">License</a></li>
                                <li><a href="#">Terms of Use</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Security</a></li>      
                            </ul>
                        </nav>            
                    </div>
                    <div class="span3">
                        <h4>Get in touch</h4>
                        <div class="social-icons-row">
                            <a href="https://twitter.com/login?lang=en" target="blank"><i class="icon-twitter"></i></a>
                            <a href="https://www.facebook.com/" target="blank"><i class="icon-facebook"></i></a>
                            <a href="https://lk.linkedin.com/" target="blank"><i class="icon-linkedin"></i></a>                                         
                        </div>
                        <div class="social-icons-row">
                            <i class="icon-phone icon-large phone-number"></i> +778722297
                        </div>
                    </div>      
                    <div class="span3">
                        <h4>Get updated by email</h4>
                        <form name="subscribeForm" action="Subscribe" method="Post">
                            <input type="text" name="email" placeholder="Email address">
                            <input type="submit" class="btn btn-primary" value="Subscribe" onclick="return ValidatelogSubscribe();">
                        </form>
                       
                    </div>
                </div>
            </div>
            <hr class="footer-divider">
            <div class="container">
                <p>
                    &copy; 2018 ClamaXSoft, Inc. All Rights Reserved.
                </p>
            </div>
        </footer>
        <!-- End: FOOTER -->
        
         <script type="text/javascript">
            function ValidatelogSubscribe() {
                var emailAddress = document.subscribeForm.email.value;
                filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                
                if (filter.test(emailAddress)) {
                    alert("We will send our update and new features.");                             
                    return true;
                }else{
                    alert("Invalied email address.");
                    return false;
                }
            }
        </script> 

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>
    </body>
</html>
