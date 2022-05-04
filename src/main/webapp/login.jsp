<%--
  Created by IntelliJ IDEA.
  User: kenis
  Date: 4/27/2022
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/pheader.html" %>
<html>
<head>
    <title>Join Us</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/includes/css/ocean-vibes.css" />
</head>
<body>
<h1>Join Us</h1>
<h2>Please log in or sign up to take classes or join a team</h2>

<p>Existing Members, Please Log In:</p>
<p style="color: red;">${adminerror}</p>
<form action="LoginServlet" method="post" onsubmit="return validate()">
    Username: <input id="username" name="username" type="text" /> <br/>
    Password: <input id="password" name="password" type="password" /> <br/>
    <input type="submit" name="Login" value="Login" /> <br/> <br/>
    <span id="error_msg"></span>
</form>
<br/>
<p style="color: red;">${error1}</p>
<br/>
<p>New Members, Please Sign Up:</p>
<form action="SignupServlet" method="post" onsubmit="return validate2()">
    Full Name: <input id="name2" name="name2" type="text" /> <br/>
    Username: <input id="username2" name="username2" type="text" /> <br/>
    Password: <input id="password2" name="password2" type="password" /> <br/>
    Re-enter Password: <input id="password3" name="password3" type="password" /> <br/>
    <input type="submit" name="SignUp" value="Sign Up" /> <br/> </br>
    <span id="error_msg2"></span>
</form>

<p style="color: red;">${error}</p>

</body>
<script>
    function validate() {
        var password = document.getElementById("password").value
        if (password === "") {
            document.getElementById("error_msg").innerHTML = "Please enter password."
            result = false
        } else if (username === "") {
            document.getElementById("error_msg2").innerHTML = "Please enter username."
            result = false
            return result
        }
    }
    function validate2() {
        var name2 = document.getElementById("name2").value
        var username2 = document.getElementById("username2").value
        var password2 = document.getElementById("password2").value
        var password3 = document.getElementById("password3").value
        if(name2 === "") {
            document.getElementById("error_msg2").innerHTML = "Please enter name."
            result = false
        } else if(username2 === "") {
            document.getElementById("error_msg2").innerHTML = "Please enter username."
            result = false
        } else if(password2 === "") {
            document.getElementById("error_msg2").innerHTML = "Please enter password."
            result = false
        } else if(password3 === ""){
            document.getElementById("error_msg2").innerHTML = "Please confirm password."
            result = false
        } else if(password2!== password3) {
            document.getElementById("error_msg2").innerHTML = "Passwords must match."
            result = false
        }
        return result
    }
</script>
<footer>
    <c:import url="/includes/pfooter.html" />
</footer>
</html>
