<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/includes/pheader.html" %>
<!DOCTYPE html>
<html>
<head>
    <title>Classes List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<body>
<h3>Sign Up for an Upcoming Class</h3>

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

<div id="classes">
    <h2>Upcoming classes:</h2>
</div>
<form action="ClassesServlet" method="post">
    Select Class Level:
    <label>
        <select name="level">
            <option value="all">All</option>
            <c:forEach var="each_level" items="${list_of_levels}" varStatus="loop">
                <option value="${each_level}">${each_level}</option>
            </c:forEach>
        </select>
    </label>
    <input type="submit" value="Filter" />
</form>
<br/>
<br/>
<table>
    <tr>
        <th>Date</th>
        <th>Time</th>
        <th>Instructor Name</th>
        <th>Level</th>
        <th>Action</th>
    </tr>
    <c:forEach var="each_class" items="${list_of_classes}">
        <tr>
            <td>${each_class.getClass_date()}</td>
            <td>${each_class.getClass_time()}</td>
            <td>${each_class.getClass_instructor()}</td>
            <td>${each_class.getClass_level()}</td>
            <td><a href="EnrollServlet?class_id=${each_class.getClass_id()}">Enroll</a> </td>
        </tr>
    </c:forEach>
</table>
<br/>
<br/>
<p>${message}</p>
<p>${error}</p>



        <%
/*        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            request.setAttribute("error", "Please login to continue (home1)..!!!");
            requestDispatcher.forward(request, response);
        }*/
/*    } else {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        request.setAttribute("error", "Please login to continue (home2)..!!!");
        requestDispatcher.forward(request, response);
    }*/
%>


</body>
</html>