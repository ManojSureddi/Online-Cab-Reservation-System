<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>

<body id="mainpage">
<div id="wrapper"><br />
<section id="header">
<div class="container">
<div id="heading">

<h4 class="highlight">Cherry Brown's</h4>

<h2>Online Cab Service Reservation</h2>
</div>
<div id="loginheader">
<%
						if (session.getAttribute("user") != null) {					
							response.sendRedirect("MainPage.jsp");
						} else {
					%>
					<a href="Login.jsp" class="btn">Login</a> <a
						href="CustomerRegistration.jsp">Sign&nbsp;Up</a> <a
						href="Feedback.jsp">Feedback</a>
					<%
						}
					%>
  
  </div>
</div>
</section> <section id="two">
<div class="container">
<div id="sidebar" class="logside">
<h3 align="center">Hello! User</h3>
Cherry Brown offers a reliable metered taxi service in Ahmedabad,
Mumbai, Delhi and Jaipur through a fleet of modern, air conditioned cars
equipped with state-of-the-art GPS based communication technology.
Cherry Brown keeps updating its fleets (sedan, hatchback, SUV) by
purchasing brand new cars and auctioning off the used cars. It has a
team of well groomed, courteous and thoroughly trained chauffeurs and
booking agents.</div>
<div id="rightbox">
<form action="" id="formdiv" style="margin-top:5%;" method="post">
<p id="msgd"></p>
<h3 align="center">Login</h3>
<table>
	<tr>
		<td>Username</td>
		<td><input type="text" name="username" id="uname" placeholder="Username" ></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password" placeholder="Password"  id="pass" ></td>
	</tr>

	<tr>
		<td></td>
		<td><input type="button" value="login" class="submit" id="login"></td>
	</tr>
	<tr >
	<td></td>
		<td colspan="2" ><a href="CustomerRegistration.jsp">Register</a></td>
	</tr>


</table>

</form>
</div>
</div>
</section></div>
<script src="js/main.js"></script>
</body>
</html>