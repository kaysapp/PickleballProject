<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/includes/pheader.html" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pickleball</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<body style="margin:30;padding:30">
<h1><%= "Neighborhood Pickleball" %>
</h1>
<br/>
<div>
<p>Welcome to our Neighborhood Pickleball site.
    Visit the links below to learn about the group, get started by taking lessons, or to view the game schedule.</p>
</div>
    <div class="tm-container">
    <nav class="tm-main-nav">
        <ul id="inline-popups">
            <li class="tm-nav-item">
                <a href="aboutus.jsp" data-effect="mfp-move-from-top" class="tm-nav-link">
                    About Us
                    <i>insert picture here</i>
                </a>
            </li>
            <li class="tm-nav-item">
                <a href="learn.jsp" data-effect="mfp-move-from-top" class="tm-nav-link">
                    Learn to Play
                    <i>insert picture here</i>
                </a>
            </li>
            <li class="tm-nav-item">
                <a href="index.jsp" data-effect="mfp-move-from-top" class="tm-nav-link" >
                    Teams
                    <i>insert picture here</i>
                </a>
            </li>
            <li class="tm-nav-item">
                <a href="teams.jsp" data-effect="mfp-move-from-top" class="tm-nav-link">
                    Match Schedule
                    <i class=>insert picture here</i>
                </a>
            </li>

        </ul>
    </nav>
</div>

</body>
</html>