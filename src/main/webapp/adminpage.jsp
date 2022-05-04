<%@ page import="models.UserModel" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: kenis
  Date: 4/19/2022
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pheader.html" %>
<html>
<head>
    <title>Neighborhood Pickleball</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<body>
<h1>Admin Page</h1>
<%
        if(session.getAttribute("user") != null) {
            UserModel user = (UserModel) session.getAttribute("user");
%>          <p>${error}</p>
<%
            if (Objects.equals(user.getUsertype(), "admin")){
        %>
                <p>Hello, <%= user.getName() %><br/>
                <a href="LogoutServlet">Logout</a> </p>
<div>
                <p style="color: blue; text-align: left">${message}<br/>
                    ${error}</p>
                <h3>Add new classes:</h3>
                    <form action="AddClassesServlet" method="post" onsubmit="return validate()">
                        Class Date: <input id="cdate" name="cdate" type="date" /> <br/>
                        Class Time: <input id="ctime" name="ctime" type="time" /> <br/>
                        Instructor: <input id="cteacher" name="cteacher" type="text" /> <br/>
                        Class Level: <input id="clevel" name="clevel" type="text" /> <br/>
                        <input type="submit" name="addclass" value="Add Class" /> <br/> </br>
                    </form>
                </div>
                <div>
                    <p style="color: blue; text-align: left">${message2}<br/>
                        ${error}</p>
                    <h3>Make new team:</h3>
                    <form action="AddTeamsServlet" method="post" onsubmit="return validate2()">
                        Team Name: <input id="tname" name="tname" type="text" /> <br/>
                        First Member: <input id="member1" name="member1" type="text" /> <br/>
                        Second Member: <input id="member2" name="member2" type="text" /> <br/>
                        Team Type:
                        <label>
                        <select name="teamtype">
                            <option value="womens">Womens</option>
                            <option value="mens">Mens</option>
                            <option value="mixed">Mixed</option>
                        </select>
                    </label>
                        <input type="submit" name="addteam" value="Create Team" /> <br/> </br>
                    </form>
                </div>
            <% }
            else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                request.setAttribute("error", "You must be admin to continue.");
                requestDispatcher.forward(request, response);
            }
       } else {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
        request.setAttribute("adminerror", "You must be logged in as Admin to visit that page.");
        requestDispatcher.forward(request, response);
        }
%>
</body>
<script>
    function validate() {
    var date2 = document.getElementById("cdate").value
    var time2 = document.getElementById("ctime").value
    var teacher2 = document.getElementById("cteacher").value
    var level2 = document.getElementById("cvalue").value
    if(date2 === "") {
    document.getElementById("error_msg2").innerHTML = "Please enter valid date."
    result = false
    } else if(time2 === "") {
    document.getElementById("error_msg2").innerHTML = "Please enter valid time."
    result = false
    } else if(teacher2 === "") {
    document.getElementById("error_msg2").innerHTML = "Please enter instructor name."
    result = false
    } else if(level2 === ""){
    document.getElementById("error_msg2").innerHTML = "Please enter class level."
    result = false
    }
    return result
    }
</script>
</html>
