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
        <title>FAQ</title>
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
                    <h1>The E-Medihelp frequently asked questions</h1>
                </div>  
                <div class="row">
                    <div class="span10 offset1">
                        <div class="accordion" id="faqAccordion">
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <h4>
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqAccordion" href="#faq1">
                                            <i class="icon-question-sign"></i> How do I channel through the internet ?
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq1" class="accordion-body collapse in">
                                    <div class="accordion-inner">
                                        <p>
                                            All you have to do is search for the doctor, using the search facility provided on this web site. 
                                            After selecting the required session of the doctor, you have to give details of the patient. 
                                         
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <h4>
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqAccordion" href="#faq2">
                                            <i class="icon-question-sign"></i> How can I get technical support for channeling through the internet ?
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq2" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <p>
                                            If you have encountered any difficulties using this web site, please call 071 0 556 445 between 8.30 a.m. 
                                            to 5.00 p.m. or the Hotline 071 0 885 777.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <h4>
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqAccordion" href="#faq3">
                                            <i class="icon-question-sign"></i> Whom should I call to get further information about doctors, my appointments or cancellations ?
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq3" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <p>
                                            For further information on doctors and appointments please contact:</br>
                                            Address : No.5, Ist cross street,</br>
                                            Colombo 04, Sri Lanka.</br>
                                            Call Centre Hotline : 071 1 555 777
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <h4>
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqAccordion" href="#faq4">
                                            <i class="icon-question-sign"></i> How do I make a suggestion about E-Medihelp?
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq4" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <p>
                                            You can send your valuable suggestions to emedihelp@gmail.com
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <h4>
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqAccordion" href="#faq5">
                                            <i class="icon-question-sign"></i> Are these services only available through web?
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq5" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <p>
                                            Yes. To serve you better we plan to provide apps for both Android and iOS based smart phones. 
                                            All these apps will be installed Free of Charge from Google Play for Android devices and Apple 
                                            App Store for iOS devices.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <h4>
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqAccordion" href="#faq6">
                                            <i class="icon-question-sign"></i> How secure are the health information that I store in My Health Records?
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq6" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <p>
                                            We take the security of health information seriously!! Therefore, we have taken measures to store personal health 
                                            information in secured servers that can only be accessed by you upon providing proper authorization credentials.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <h4>
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqAccordion" href="#faq7">
                                            <i class="icon-question-sign"></i> What are the health information available under My Health Records?
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq7" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <p>
                                            The health information includes details of doctor visits, prescriptions & etc. can be linked to your profile. 
                                            All your information can be tracked through a single account.
                                        </p>
                                    </div>
                                </div>
                            </div>
                          
                        </div>
                    </div>
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
