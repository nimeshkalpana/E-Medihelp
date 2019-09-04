<%-- 
    Document   : index
    Created on : Jun 8, 2018, 9:48:00 AM
    Author     : Rajitha
--%>

<%@page import="Beans_DB_Package.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <title>Dashboard</title>
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
                            out.print("<b>You logged in as : </b>" + bean.getUname());
                        %> 

                    </div>
                    <h1>Admin Dashboard</h1>
                </div>
                <div class = "container">

                    <h2 align="center"><font><strong>Your Approval Needed</strong></font></h2>
                    <br>
                     <br><br>
                                                <div class="center-align signupMessage">
                                            <%
                                           
                                                Object userSuccessAlert3 = request.getAttribute("rejectacceptuser");
                                                if (userSuccessAlert3 != null) {
                                                     
                                                    out.print("<b>" + request.getAttribute("rejectacceptuser") + "</b>");
                                                   
                                                }
                                               
                                            %>
                                        </div>  
                    <br><br>
                    <h4 align="center">Pending Patient</h4>
                    <table align="center" cellpadding="5" cellspacing="5" border="10">
                       
                        <tr bgcolor="#BDBDBD">
                            <td align = "center"><b>First Name</b></td>
                            <td align = "center"><b>Surname</b></td>
                            <td align = "center"><b>Email or Mobile</b></td>
                            <td align = "center"><b>Gender</b></td>
                            <td align = "center"><b>Accept User</b></td>
                            <td align = "center"><b>Reject User</b></td>
                        </tr>
                        <%
                            try {
                                Connection connection = DBConnection.connection();
                                Statement statement = connection.createStatement();
                                String sql = "SELECT `id`,`first_name`, `surname`, `mobile_or_email`, `gender` FROM `patient_not_registered`";

                                ResultSet resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr bgcolor="#F2F2F2">

                            <td align = "center"><%=resultSet.getString("first_name")%></td>
                            <td align = "center"><%=resultSet.getString("surname")%></td>
                            <td align = "center"><%=resultSet.getString("mobile_or_email")%></td>
                            <td align = "center"><%=resultSet.getString("gender")%></td>
                            <td>
                            <form action="Accept_User" method="post" name="Add_Form">
                            <button type="Submit" class="btn btn-small" name="Add" value="<%=resultSet.getString("id")%>">Accept</button>
                            </form>
                            </td>
                            <td>
                            <form action="Delete_User" method="post" name="Delete_Form">
                            <button type="Submit" class="btn btn-small" name="Delete" value="<%=resultSet.getString("id")%>">Reject</button>
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
                    <br>
                    <br><br>
                                                <div class="center-align signupMessage">
                                            <%
                                           
                                                Object userSuccessAlert2 = request.getAttribute("rejectacceptdoctor");
                                                if (userSuccessAlert2 != null) {
                                                     
                                                    out.print("<b>" + request.getAttribute("rejectacceptdoctor") + "</b>");
                                                   
                                                }
                                               
                                            %>
                                        </div>  
                    <br><br>
                    <h4 align="center">Pending Doctor</h4>
                    <table align="center" cellpadding="5" cellspacing="5" border="10">
                       
                        <tr bgcolor="#BDBDBD">
                            <td align = "center"><b>First Name</b></td>
                            <td align = "center"><b>Surname</b></td>
                            <td align = "center"><b>Doctor Registration Number</b></td>
                            <td align = "center"><b>Medical Center Registration Number</b></td>
                            <td align = "center"><b>Email or Mobile</b></td>
                            <td align = "center"><b>Accept Account</b></td>
                            <td align = "center"><b>Reject Account</b></td>
                        </tr>
                        <%
                            try {
                                Connection connection = DBConnection.connection();
                                Statement statement = connection.createStatement();
                                //String sql = "SELECT `id`,`first_name`, `surname`, `mobile_or_email`, `gender` FROM `patient_not_registered`";
                                String sql ="SELECT `id`, `first_name`, `surname`, `doctor_registration_number`, `medical_center_registration_number`, `mobile_or_email` FROM `doctor_not_registered`";

                                ResultSet resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr bgcolor="#F2F2F2">

                            <td align = "center"><%=resultSet.getString("first_name")%></td>
                            <td align = "center"><%=resultSet.getString("surname")%></td>
                            <td align = "center"><%=resultSet.getString("doctor_registration_number")%></td>
                            <td align = "center"><%=resultSet.getString("medical_center_registration_number")%></td>
                            <td align = "center"><%=resultSet.getString("mobile_or_email")%></td>
                            <td>
                            <form action="Accept_Medical_Center" method="post" name="Account_Add_Form">
                            <button  style="margin-left: 18px; margin-top: 10px;"type="Submit" class="btn btn-small" name="Addd" value="<%=resultSet.getString("id")%>">Accept</button>
                            </form>
                            </td>
                            <td>
                            <form action="Delete_Medical_Center" method="post" name="Account_Delete_Form">
                            <button style="margin-left: 18px; margin-top: 10px;" type="Submit" class="btn btn-small" name="Delete" value="<%=resultSet.getString("id")%>">Reject</button>
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
                    <br>
                    <br><br>
                    <br>
                    <!-- Start :REgistered users-->
                    <h2 align="center"><font><strong>Registered Users</strong></font></h2>
                    <br>
                      <br><br>
                                                <div class="center-align signupMessage">
                                            <%
                                           
                                                Object userSuccessAlert1 = request.getAttribute("deleteusersuccessful");
                                                if (userSuccessAlert1 != null) {
                                                     
                                                    out.print("<b>" + request.getAttribute("deleteusersuccessful") + "</b>");
                                                   
                                                }
                                               
                                            %>
                                        </div>  
                    <br><br>
                    <h4 align="center">Registered Patients </h4>
                    <table align="center" cellpadding="5" cellspacing="5" border="10">
                       
                        <tr bgcolor="#BDBDBD">
                            <td align = "center"><b>First Name</b></td>
                            <td align = "center"><b>Surname</b></td>
                            <td align = "center"><b>Email or Mobile</b></td>
                            <td align = "center"><b>Gender</b></td>
                            <td align = "center"><b>Remove Patient</b></td>
                            
                        </tr>
                        <%
                            try {
                                Connection connection = DBConnection.connection();
                                Statement statement = connection.createStatement();
                                String sql = "SELECT `id`,`first_name`, `surname`, `mobile_or_email`, `gender` FROM `patient_registered`";

                                ResultSet resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr bgcolor="#F2F2F2">

                            <td align = "center"><%=resultSet.getString("first_name")%></td>
                            <td align = "center"><%=resultSet.getString("surname")%></td>
                            <td align = "center"><%=resultSet.getString("mobile_or_email")%></td>
                            <td align = "center"><%=resultSet.getString("gender")%></td>
                            
                            <td>
                            <form action="Delete_Registered_User" method="post" name="Delete_Form">
                            <button  style="margin-left: 18px; margin-top: 10px;"type="Submit" class="btn btn-small" name="Delete" value="<%=resultSet.getString("id")%>">Remove</button>
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
                    <br><br>
                                                <div class="center-align signupMessage">
                                            <%
                                           
                                                Object userSuccessAlert = request.getAttribute("deletesuccessful");
                                                if (userSuccessAlert != null) {
                                                     
                                                    out.print("<b>" + request.getAttribute("deletesuccessful") + "</b>");
                                                   
                                                }
                                               
                                            %>
                                        </div>  
                    <br><br>
                    
                    <h4 align="center">Registered Doctors</h4>
                    <table align="center" cellpadding="5" cellspacing="5" border="10">
                       
                        <tr bgcolor="#BDBDBD">
                            <td align = "center"><b>First Name</b></td>
                            <td align = "center"><b>Surname</b></td>
                            <td align = "center"><b>Doctor Registration Number</b></td>
                            <td align = "center"><b>Medical Center Registration Number</b></td>
                            <td align = "center"><b>Email or Mobile</b></td>
                            <td align = "center"><b>Remove doctor</b></td>
                        </tr>
                        <%
                            try {
                                Connection connection = DBConnection.connection();
                                Statement statement = connection.createStatement();
                                //String sql = "SELECT `id`,`first_name`, `surname`, `mobile_or_email`, `gender` FROM `patient_not_registered`";
                                String sql ="SELECT `id`, `first_name`, `surname`, `doctor_registration_number`, `medical_center_registration_number`, `mobile_or_email` FROM `doctor_registered`";

                                ResultSet resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr bgcolor="#F2F2F2">

                            <td align = "center"><%=resultSet.getString("first_name")%></td>
                            <td align = "center"><%=resultSet.getString("surname")%></td>
                            <td align = "center"><%=resultSet.getString("doctor_registration_number")%></td>
                            <td align = "center"><%=resultSet.getString("medical_center_registration_number")%></td>
                            <td align = "center"><%=resultSet.getString("mobile_or_email")%></td>
                            
                            <td>
                            <form action="Delete_Registered_doctor" method="post" name="Account_Delete_Form">
                            <button style="margin-left: 18px; margin-top: 10px;" type="Submit" class="btn btn-small" name="Delete" value="<%=resultSet.getString("id")%>">Remove</button>
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
                    <!-- End: Registered users-->
            </div>
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
