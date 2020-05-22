<%-- 
    Document   : Home
    Created on : Mar 30, 2020, 1:02:35 PM
    Author     : thang
--%>

<%@page import="Paging.HtmlHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
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
                                <c:out value="${textSend}" />
                            </c:when>
                            <c:otherwise>
                                <img class="bigImage" src="${contact.photo}" alt=""/>
                                <div class="i">
                                    <i>${contact.titlePhoto}</i>
                                </div>
                                <div class="listedGallery">
                                    <c:forEach items="${getAllGallery}" var="g">
                                        <div class="boxGallery">
                                            <div class="block-images">
                                            <a href="Gallery?id=${g.idGallery}"><img class="imgGallary" src="${g.imagesDescript}" alt=""/></a>
                                            </div>
                                            <div class="titleGallary">
                                                <a class="font22px " href="Gallery?id=${g.idGallery}" >View ${g.nameGallery}</a>
                                            </div>
                                            <p class="font16px short" >
                                                ${g.shortDes}
                                            </p>
                                        </div>
                                    </c:forEach>
                                </div>
                                <form action="Home" method="post">
                                    <%=HtmlHelper.pager(pageIndex, pageCount)%>
                                </form>
                                <div class="About">
                                    About me
                                </div>
                                <div class="font16px descript">
                                    ${contact.about}
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
