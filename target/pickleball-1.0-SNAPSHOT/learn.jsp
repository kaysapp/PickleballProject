<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="java.io.File" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.xml.sax.SAXException" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: kenis
  Date: 4/20/2022
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>About Us</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<body>
<h1><%= "Learn to Play" %>
</h1>
</head>
<body>
<div>
  <p>Our neighborhood has instructors for all skill levels. </p>
    Pickleball is ranked in levels 1.0 - 5.0. <br />
    <ul>
      <li>Beginners are levels 1.0 - 2.0</li>
      <li>Intermediate is level 3.0 - 3.5</li>
      <li>Advanced is level 4.0 - 4.5</li>
    </ul>
  <br/>
  <h2>Our Instructors:</h2>
  <br/>

  <%--3 stage approach
1- read xml
2 - make list - for each field in xml
3 - display each field

  <%--Begin stage 1 and 2--%>
<%
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    DocumentBuilder db = null;
    String path = application.getRealPath("/") +"includes/instructors.xml";
    File path2 = new File (path);

    try {
      db = dbf.newDocumentBuilder();
    } catch (ParserConfigurationException e) {
      e.printStackTrace();
    }
    Document teachers = null;
    try {
      if (db != null) {
        teachers = db.parse(path2);
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

//    populate list of teachers and their info
    if (teachers != null) {
    instructorsnodes = teachers.getElementsByTagName("name");
    profilesnodes = teachers.getElementsByTagName("profile");
    skillsnodes = teachers.getElementsByTagName("skill_level");
    teachesnodes = teachers.getElementsByTagName("teaches_levels");


    for (int i = 0; i < instructorsnodes.getLength(); i++) {
    instructors.add(instructorsnodes.item(i).getFirstChild().getNodeValue());
    profiles.add(profilesnodes.item(i).getFirstChild().getNodeValue());
    skills.add(skillsnodes.item(i).getFirstChild().getNodeValue());
    teaches.add(teachesnodes.item(i).getFirstChild().getNodeValue());
    }

    }
    int i=1;
    for(String instructor:instructors){
  %>
    <%=instructor%><br/>

<% }
    %>
</div>
</body>
</html>
