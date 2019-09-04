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
            <div class="container">
                <div class="page-header">
                    <div class="pull-right">
                        <b>Your last visit :</b> <%= new Date(session.getLastAccessedTime())%><br>
                        <%
                            LoginBean bean = (LoginBean) request.getAttribute("logBean");
                            out.print("<b>You logged in as : </b>" + bean.getFirstName());
                            int uID = bean.getUserID();
                        %> 

                    </div>
                    <h1>Medical Center Dashboard</h1>  
                </div>
            </div>
                          <!-- Start : Medical Center Detail-->
            <div class = "container">
                <div class="row-fluid">
                    <div class="span10 offset1">
                        <div class="page-header ">
                             <form action="Patient_appointments_for_doctors" method="post" name="Form">                                       
                              <button  type="Submit" class="btn btn-large" style="float:right; margin-right: 5px;margin-top: 0px;" name="doctor_appointment" value="<%=uID%>">Patient Appointments</button>
                               </form> 
                            <h2>Medical Center Detail</h2>
                           
                        </div>
                        <form class="form-add-user" action="MC_Add_Detail" method="Post">
                            <div class="span5 offset1">
                                <div class="control-group ">
                                    <div class="controls">
                                        <input type="text" name="name" id="name" placeholder="Name">
                                    </div>
                                </div>
                            </div>

                            <div class="span5 offset1">
                                <div class="control-group">
                                    <div class="controls">
                                        <input type="text" name="address" id="address" placeholder="Address">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <input type="hidden" name="mcID" id="mcID" value="<%= uID %>">
                                        <input type="submit" class="btn btn-primary btn-large" value="Add">
                                    </div>
                                </div>
                            </div>   
                        </form>
                                        <div class="center-align signupMessage">
                                            <%
                                                Object detailSuccessAlert = request.getAttribute("detailAddSuccess");
                                                if (detailSuccessAlert != null) {
                                                    out.print("<b>" + request.getAttribute("detailAddSuccess") + "</b>");
                                                }
                                                Object detailFailAlert = request.getAttribute("detailAddFail");
                                                    if (detailFailAlert != null) {
                                                out.print("<b>" + request.getAttribute("detailAddFail") + "</b>");
                                                } 
                                            %>
                                        </div>                
                    </div>
                </div>
            </div>
            <!-- End: Medical Center Detail-->
            <!-- Start : Add User-->
            <div class = "container">
                <div class="row-fluid">
                    <div class="span10 offset1">
                        <div class="page-header ">
                            <h2>Add User</h2>
                        </div>
                        <form class="form-add-user" action="MC_Add_User" method="Post">
                            <div class="span5 offset1">
                                <div class="control-group ">
                                    <div class="controls">
                                        <input type="text" name="name" id="name" placeholder="Name">
                                    </div>
                                </div>

                                <div class="control-group ">
                                    <div class="controls">
                                        <input type="text" name="contactNo" id="contactNo" placeholder="Contact No">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="text" name="dsignation" id="dsignation" placeholder="Designation">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="text" name="dutyEndTime" id="dutyEndTime" placeholder="Duty End Time">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="password" name="password" id="password" placeholder="Password">
                                    </div>
                                </div>
                            </div>

                            <div class="span5 offset1">
                                <div class="control-group">
                                    <div class="controls">
                                        <input type="text" name="address" id="address" placeholder="Address">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="email" name="email" id="email" placeholder="Email">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="text" name="dutyStartTime" id="dutyStartTime" placeholder="Duty Start Time">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="text" name="userName" id="userName" placeholder="User Name">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <input type="hidden" name="mcID" id="mcID" value="<%= uID %>">
                                        <input type="submit" class="btn btn-primary btn-large" value="Add">
                                    </div>
                                </div>
                            </div>   
                        </form>
                                        <div class="center-align signupMessage">
                                            <%
                                                Object userSuccessAlert = request.getAttribute("userAddSuccess");
                                                if (userSuccessAlert != null) {
                                                    out.print("<b>" + request.getAttribute("userAddSuccess") + "</b>");
                                                }
                                                Object userFailAlert = request.getAttribute("userAddFail");
                                                    if (userFailAlert != null) {
                                                out.print("<b>" + request.getAttribute("userAddFail") + "</b>");
                                                } 
                                            %>
                                        </div>                
                    </div>
                </div>
            </div>
            <!-- End: ADD USER-->
            <!-- Start: CURRENT USER-->
            <div class = "container">
                <div class="row-fluid">
                    <div class="span10 offset1">
                        <div class="page-header ">
                            <h2>Current Users</h2>
                        </div>
                        <table align="center" cellpadding="5" cellspacing="5" border="10">
                            <tr bgcolor="#BDBDBD">
                                <td align="center"><b>Name</b></td>
                                <td align="center"><b>Address</b></td>
                                <td align="center"><b>Contact No</b></td>
                                <td align="center"><b>Email</b></td>
                                <td align="center"><b>Designation</b></td>
                                <td align="center"><b>Duty Start Time</b></td>
                                <td align="center"><b>Duty End Time</b></td>
                                <td align="center"><b>Remove User</b></td>
                            </tr>
                            <%
                                try {
                                    Connection connection = DBConnection.connection();
                                    Statement statement = connection.createStatement();
                                    String sql = "SELECT `id`, `name`, `address`, `contact_number`, `email`, `designation`, `duty_start_time`, `duty_end_time`, `user_name`, `password`, `medical_center_id` FROM `medical_center_users` where `medical_center_id`='"+uID+"'";

                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>
                            <tr bgcolor="#F2F2F2">
                                <td align="center"><%=resultSet.getString("name")%></td>
                                <td align="center"><%=resultSet.getString("address")%></td>
                                <td align="center"><%=resultSet.getString("contact_number")%></td>
                                <td align="center"><%=resultSet.getString("email")%></td>
                                <td align="center"><%=resultSet.getString("designation")%></td>
                                <td align="center"><%=resultSet.getString("duty_start_time")%></td>
                                <td align="center"><%=resultSet.getString("duty_end_time")%></td>
                                <td>
                                    <form action="MC_Delete_User" method="post" name="Delete_Form">
                                        <input type="hidden" name="mcID" id="mcID" value="<%= uID %>">
                                        <button type="Submit" style="margin-top: 15px; margin-left: 10px;" class="btn btn-small" name="Delete" value="<%=resultSet.getString("id")%>">Remove</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }                               
                            %>
                        </table>
                    </div>
                </div>
            </div>
            <!--End: CURRENT USER-->
          
        </div>
        <!-- End: MAIN CONTENT -->

        <!-- Include Footer -->
        <%@ include file="logFooter.jsp" %>
        <!---->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/boot-business.js"></script>

    </body>
</html>
