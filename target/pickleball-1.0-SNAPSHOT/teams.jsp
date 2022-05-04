<%--
  Created by IntelliJ IDEA.
  User: kenis
  Date: 4/20/2022
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pheader.html" %>
<html>
<head>
    <title>Neighborhood Pickleball</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<body>
<%--<jsp:include page="/TeamsServlet" />--%>
<h1><%= "Neighborhood Teams" %>
</h1>
<form action="TeamsServlet">
    Select Team Type:
    <label>
        <select name="ttype">
            <option value="all">All</option>
            <c:forEach var="each_type" items="${list_of_types}" varStatus="loop">
                <option value="${each_type}">${each_type}</option>
            </c:forEach>
        </select>
    </label>
    <input type="submit" value="Filter" />
</form>
<br/>
<br/>
<table style="width:40%; margin-left: auto; margin-right: auto; border: 1px; border-collapse: collapse;">
    <tr>
        <th style="text-align: left;">Team Name</th>
        <th style="text-align: left;">Team Type</th>
    </tr>
    <c:forEach var="each_team" items="${list_of_teams}">
        <tr>
            <td>${each_team.getTeam_name()}</td>
            <td>${each_team.getTeam_type()}</td>
        </tr>
    </c:forEach>
</table>
</body>
<footer>
    <c:import url="/includes/pfooter.html" />
</footer>
</html>
