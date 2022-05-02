<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.xml.sax.SAXException" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="models.MatchModel" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.Node" %>
  Created by IntelliJ IDEA.
  User: kenis
  Date: 5/1/2022
  Time: 10:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pheader.html" %>
<html>
<head>
    <title>Neighborhood Pickleball</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<h1>Teams and Matches</h1>
<body>
<div>
    <h2>Our Matches:</h2>
    <p>Here is the upcoming match schedule:</p>
</div>
<div id="games">

    <%--3 stage approach
  1- read xml
  2 - make list - for each field in xml
  3 - display each field

    <%--Begin stage 1 and 2--%>
    <%
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder xdb = null;
        String path = application.getRealPath("/") +"includes/matches.xml";
        File path2 = new File(path);

        try {
            xdb = dbf.newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        Document matches = null;
        try {
            if (xdb != null) {
                matches = xdb.parse(path2);
            }
        } catch (SAXException e) {
            e.printStackTrace();
        }

//    populate list of teachers and their info
        if (matches != null) {
            Element docEle = matches.getDocumentElement();
            NodeList nl = docEle.getChildNodes();
            List<MatchModel> list = new ArrayList<>();

            int length = nl.getLength();
            //populate the list to parse later
            for (int i = 0; i < length; i++) {
                if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
                    Element el = (Element) nl.item(i);
                    String match_date = el.getElementsByTagName("match_date").item(0).getTextContent();
                    String location = el.getElementsByTagName("location").item(0).getTextContent();
                    String court = el.getElementsByTagName("court").item(0).getTextContent();
                    String team1 = el.getElementsByTagName("team1").item(0).getTextContent();
                    String team2 = el.getElementsByTagName("team2").item(0).getTextContent();

                    MatchModel matchModel = new MatchModel(match_date, location, court, team1, team2);
                    list.add(matchModel);
                }
            }


//    InstructorModel instructorModel = new InstructorModel(instructors.get(i), profiles.get(i), skills.get(i), teaches.get(i));
//    instlist.add(instructorModel);
                //stage 3 here
    %>
        <table>
            <tr>
                <th>Date</th>
                <th>Location</th>
                <th>Court</th>
                <th>Team1</th>
                <th>Team2</th>
            </tr>
            <c:forEach var="each_match" items="${list}">
                <tr>
                    <td>${each_match.getMatch_date()}</td>
                    <td>${each_match.getLocation()}</td>
                    <td>${each_match.getCourt()}</td>
                    <td>${each_match.getTeam1()}</td>
                    <td>${each_match.getTeam2()}</td>
                </tr>
            </c:forEach>
        </table>

    <%
        }
    %>


</div>
</body>
</html>
