<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/includes/pheader.html" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pickleball</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<body>
<h1><%= "Neighborhood Pickleball" %>
</h1>
<br/>
<div>
    <%
        //    if (request.getSession() != null) {
        if(session.getAttribute("user") != null) {
            UserModel user = (UserModel) session.getAttribute("user");
    %>
    <p>Hello, <%= user.getName() %></p>
    <p> <a href="LogoutServlet">Logout</a> </p>
    <br/>
    <br/>
    <br/>
    <% }%>
</div>
<div>
    <p>Welcome to our Neighborhood Pickleball site.
        Visit the links below to learn about the group, get started by taking lessons, or to view the game schedule.</p>
</div>
<div class="tm-container">
    <nav class="tm-main-nav">
        <ul id="inline-popups">
            <li class="tm-nav-item">
                <a href="learn.jsp" class="tm-nav-link">
                    About Us
                    <i><img src="${pageContext.request.contextPath}/includes/images/play.png" width="50" height="50"
                            style="vertical-align:middle;"></i>
                </a>
            </li>
            <li class="tm-nav-item">
                <a href="classes.jsp" class="tm-nav-link">
                    Learn to Play
                    <i><img src="${pageContext.request.contextPath}/includes/images/play.png" width="50" height="50"
                            style="vertical-align:middle;"></i></a>
            </li>
            <li class="tm-nav-item">
                <a href="teams.jsp" class="tm-nav-link" >
                    Teams
                    <i><img src="${pageContext.request.contextPath}/includes/images/trophy.png" width="50" height="50"
                            style="vertical-align:middle;"></i></a>
            </li>
            <li class="tm-nav-item">
                <a href="index.jsp" class="tm-nav-link">
                    Match Schedule
                    <i><img src="${pageContext.request.contextPath}/includes/images/schedule.png" width="50" height="50"
                            style="vertical-align:middle;"></i></a>
            </li>

        </ul>
    </nav>
</div>
</body>
<footer>
    <c:import url="/includes/pfooter.html" />
</footer>
</html>