<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.xml.sax.SAXException" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="models.MatchModel" %>
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
        List<MatchModel> list = new ArrayList<>();


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

        NodeList match_dates = null;
        NodeList locations = null;
        NodeList courts = null;
        NodeList team1s = null;
        NodeList team2s = null;

        List<String> match_date = new ArrayList<String>();
        List<String> location = new ArrayList<String>();
        List<String> court = new ArrayList<String>();
        List<String> team1 = new ArrayList<String>();
        List<String> team2 = new ArrayList<String>();


//    populate list of matches and their info
        if (matches != null) {

            match_dates = matches.getElementsByTagName("match_date");
            locations = matches.getElementsByTagName("location");
            courts = matches.getElementsByTagName("court");
            team1s = matches.getElementsByTagName("team1");
            team2s = matches.getElementsByTagName("team2");

            int length = match_dates.getLength();

            //populate the list to parse later
            for (int i = 0; i < length; i++) {
                match_date.add(match_dates.item(i).getFirstChild().getNodeValue());
                location.add(locations.item(i).getFirstChild().getNodeValue());
                court.add(courts.item(i).getFirstChild().getNodeValue());
                team1.add(team1s.item(i).getFirstChild().getNodeValue());
                team2.add(team2s.item(i).getFirstChild().getNodeValue());

                //MatchModel matchModel = new MatchModel(match_date, location, court, team1, team2);
                //list.add(matchModel);
            }

            request.setAttribute("length",length);
            request.setAttribute("list", list);
                //stage 3 here
    %>
        <table style="width:70%; margin-left: auto; margin-right: auto; border: 1px; border-collapse: collapse;">
            <tr>
                <th style="text-align:left; width:15%;">Date</th>
                <th style="text-align:left; width:25%;">Location</th>
                <th style="text-align:left; width:10%;">Court</th>
                <th style="text-align:left; width:25%;">Team1</th>
                <th style="text-align:left; width:25%;">Team2</th>
            </tr>
<%--NEED HELP WITH THIS VARIABLE REFERENCE--%>
  <%          for (int i = 0; i < length; i++) { %>
                <tr>
                    <td> <%= match_date.get(i) %></td>
                    <td> <%= location.get(i) %></td>
                    <td> <%= court.get(i) %></td>
                    <td> <%= team1.get(i) %></td>
                    <td> <%= team2.get(i) %></td>
                </tr>
          <%  } %>
        </table>
    <%

        }
    %>
</div>
</body>
<footer>
    <c:import url="/includes/pfooter.html" />
</footer>
</html>
