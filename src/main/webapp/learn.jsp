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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    DocumentBuilder xdb = null;
    String path = application.getRealPath("/") +"includes/instructors.xml";
    File path2 = new File (path);

    try {
      xdb = dbf.newDocumentBuilder();
    } catch (ParserConfigurationException e) {
      e.printStackTrace();
    }
    Document teachers = null;
    try {
      if (xdb != null) {
        teachers = xdb.parse(path2);
      }
    } catch (SAXException e) {
      e.printStackTrace();
    }
    NodeList instructorsnodes = null;
    NodeList profilesnodes = null;
    NodeList skillsnodes = null;
    NodeList teachesnodes = null;

    List<String> instructors = new ArrayList<String>();
    List<String> profiles = new ArrayList<String>();
    List<String> skills = new ArrayList<String>();
    List<String> teaches = new ArrayList<String>();
    List<InstructorModel> instlist = new ArrayList<>();

//    populate list of teachers and their info
    if (teachers != null) {
        instructorsnodes = teachers.getElementsByTagName("name");
        profilesnodes = teachers.getElementsByTagName("profile");
        skillsnodes = teachers.getElementsByTagName("skill_level");
        teachesnodes = teachers.getElementsByTagName("teaches_levels");

        int length = instructorsnodes.getLength();
        String picname = null;

%>
        <table>
    <%
        for (int i = 0; i < length; i++) {
        instructors.add(instructorsnodes.item(i).getFirstChild().getNodeValue());
        profiles.add(profilesnodes.item(i).getFirstChild().getNodeValue());
        skills.add(skillsnodes.item(i).getFirstChild().getNodeValue());
        teaches.add(teachesnodes.item(i).getFirstChild().getNodeValue());

        switch (i)
        {
            case 0:
                picname = "jessica.jpg";
                break;
            case 1:
                picname = "luke.jpg";
                break;
            case 2:
                picname = "martin.jpg";
                break;
            default:
                picname = "pball.png";
        }
            request.setAttribute("picname",picname);
            //stage 3 here
      %>
        <tr>
            <td rowspan="4">
                <img src="${pageContext.request.contextPath}/includes/images/${picname}" width="100" height="100"
                     style="vertical-align:middle;">
            </td>
            <td>
                <strong><%= instructors.get(i) %></strong>
            </td>
        </tr>
        <tr>
            <td>
                <strong>About: </strong> <%= profiles.get(i) %><br/>
            </td>
        </tr>
        <tr>
            <td>
        <strong>Personal Skill Level: </strong> <%= skills.get(i) %><br/>
            </td>
        </tr>
        <tr>
            <td>
        <strong>Teaches level(s): </strong><%= teaches.get(i) %><br/>
            </td>
        </tr>
        <%
        }
        %>
        </table>
  <%  }
  %>

</div>

<div id="classes">
    <h3><a href="ClassesServlet">Click here to find Upcoming Classes</a></h3>
</div>

</body>
<footer>
    <c:import url="/includes/pfooter.html" />
</footer>
</html>
