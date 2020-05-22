<%-- 
    Document   : Gallery
    Created on : Apr 1, 2020, 4:13:50 PM
    Author     : thang
--%>

<%@page import="Paging.HtmlHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link href="css/gallery.css" rel="stylesheet" type="text/css"/>
        <script src="js/jscript.js" type="text/javascript"></script>
        <%
            Integer pageIndex = (Integer) request.getAttribute("pageindex");
            Integer pageCount = (Integer) request.getAttribute("pagecount");
        %>
    </head>
    <body>
        <%@include file="body/Header.jsp" %>
        <div class="containBody">
            <div class="menu">
                <div class="separator">
                    <div class="home">
                        <c:choose>
                            <c:when test="${textSend != null}">
                                <div class="font22px"><c:out value="${textSend}"></c:out></div>
                            </c:when>
                            <c:otherwise>
                                <div class="About">${gallery.nameGallery}</div>
                                <img id="imgDes" class="imgDes" src="${gallery.imagesDescript}" alt=""/>
                                <div class="divImg">
                                    <div class="listImage">
                                        <c:forEach items="${detailGalleryList}" var="dg">
                                                <img onclick="switchImg(this.src)" class="itemImage boderImage" src="${dg.imageDetail}" alt=""/>
                                        </c:forEach>
                                    </div>
                                    <form action="Gallery" method="post">
                                        <input type="hidden" name="id" value="${gallery.idGallery}">
                                        <%=HtmlHelper.pager(pageIndex, pageCount)%>
                                    </form>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <%@include file="body/Right.jsp" %>
                </div>
            </div>
        </div>
        <%@include file="body/Footer.jsp" %>
    </body>
</html>
