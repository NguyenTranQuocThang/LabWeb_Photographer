<%-- 
    Document   : Header
    Created on : Mar 27, 2020, 12:58:31 PM
    Author     : thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/header.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="containMenu">
            <div class="menu innerMenu">
                <ul>
                    <li class="widthHomeMenu">
                        <a  class=" font16px <c:if test="${check == 'home'}" >boldJS</c:if> "  href="Home">
                                My front page
                            </a>
                        </li>
                    <c:forEach items="${top3Gallery}" var="g">
                        <li class="widthPageMenu">
                            <a  class="font16px <c:if test="${checkBold ==g.idGallery}">boldJS</c:if> " href="Gallery?id=${g.idGallery}">
                                ${g.nameGallery}
                            </a>
                        </li>
                    </c:forEach>
                    <li class="widthPageMenu">
                        <a  class="font16px <c:if test="${check == 'contact'}" >boldJS</c:if>" href="Contact">
                            Contact
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="containerSubMenu">
            <div class="menu">
                <div class="separateMenu">
                    <div><a class="link" href="Home"><div class="img"></div></a></div>
                    <div class="rightMenu">
                        <a  class="link" href="Home"><div class="photoText">PHOTOGRAPHER</div></a>
                        <div class="welcomText font22px">Welcome to this website</div>   
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
