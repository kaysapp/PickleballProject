<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="java.io.File" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.xml.sax.SAXException" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.InstructorModel" %>
<%@ page import="models.TeamsModel" %>

<%--
  Created by IntelliJ IDEA.
  User: kenis
  Date: 4/20/2022
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pheader.html" %>
<html>
<head>
  <title>About Us</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<body>
<h1><%= "About our Neighborhood Pickleball" %>
</h1>
</head>
<br/>
<p>Due to popular demand, our neighborhood is now offering Pickleball!  It's fun for all ages.
    Our courts are available for recreational use and for those who would like to compete.
    Check out our gallery for pictures.
</p>
<p>For beginners and those who want to improve their skills, we offer lessons by experienced players.</p>
<p>Those who are ready to play in a match can sign up.  Check our upcoming match schedule.</p>
<div>
  <p>Our neighborhood has instructors for all skill levels. </p>
    Pickleball is ranked in levels 1.0 - 5.0. <br />
    <ul>
      <li>Beginners are levels 1.0 - 2.0</li>
      <li>Intermediate is level 3.0 - 3.5</li>
      <li>Advanced is level 4.0 - 4.5</li>
    </ul>
  <br/>
</div>
<div id="instructors">
  <h2>Our Instructors:</h2>
  <br/>

  <%--3 stage approach
1- read xml
2 - make list - for each field in xml
3 - display each field

  <%--Begin stage 1 and 2--%>
<%

//    populate list of teachers and their info
        int length = 0;
        String picname = null;
%>
    request.setAttribute("picname",picname);
        <table>
        <tr>
            <td>
                <img src="${pageContext.request.contextPath}/includes/images/${picname}" width="100" height="100"
                     style="vertical-align:middle;">
            </td>
            <td>
                <img src="${pageContext.request.contextPath}/includes/images/${picname}" width="100" height="100"
                     style="vertical-align:middle;">
            </td>
            <td>
                <img src="${pageContext.request.contextPath}/includes/images/${picname}" width="100" height="100"
                     style="vertical-align:middle;">
            </td>
            <td>
                <img src="${pageContext.request.contextPath}/includes/images/${picname}" width="100" height="100"
                     style="vertical-align:middle;">
            </td>
        </tr>
        </table>

</div>


</body>
</html>
