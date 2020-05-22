<%-- 
    Document   : Contact
    Created on : Apr 1, 2020, 2:56:39 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link href="css/contact.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="body/Header.jsp" %>
        <div class="containBody">
            <div class="menu">
                <div class="separator">
                    <div class="home">
                        <div class="About">Contact </div>
                        <div class="font22px nameContact">PHOTOGRAPHER</div>
                        <table class="classTable">
                            <tr>
                                <td><div class="font16px smaltextContact">Address:</div></td> 
                                <td><div class="font16px smaltextContact contentContact">${contact.address}</div></td>
                            </tr>
                            <tr>
                                <td><div class="font16px smaltextContact">City:</div></td> 
                                <td><div class="font16px smaltextContact contentContact">${contact.city}</div></td>
                            </tr>
                            <tr>
                                <td><div class="font16px smaltextContact">Country:</div></td> 
                                <td><div class="font16px smaltextContact contentContact">${contact.country}</div></td>
                            </tr>
                        </table>
                        <table class="classTable">
                            <tr>
                                <td><div class="font16px tel_mail_Contact">Tel:</div></td>
                                <td><div class="font16px tel_mail_Contact contentContact">${contact.telephone}</div></td>
                            </tr>
                            <tr>
                                <td><div class="font16px tel_mail_Contact">Email:</div></td>
                                <td><div class="font16px tel_mail_Contact contentContact">${contact.email}</div></td>
                            </tr>
                        </table>
                        <div class="map"></div>
                    </div>
                    <%@include file="body/Right.jsp" %>
                </div>
            </div>
        </div>
        <%@include file="body/Footer.jsp" %>
    </body>
</html>
