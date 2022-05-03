<%--
  Created by IntelliJ IDEA.
  User: kenis
  Date: 4/18/2022
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pheader.html" %>

<%@ page isErrorPage = "true" %>
<html>
<head>
    <title>Server Side Error</title>
</head>
<body>
<h1>Oops, there seems to be a SERVER SIDE ERROR 500</h1>
<p>The explanation for your exception is:</p>p>
<%= exception %>
</body>
</html>
