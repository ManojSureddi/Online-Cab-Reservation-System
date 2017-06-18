<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body id="home">
<div id="wrapper">
<br/>
<section id="header">
<div class="container">
<div id="loginheader">
<%
					if (session.getAttribute("user")!= null) {
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
</section>
<section id="one">
<div class="container">
<div id="title">
<h1>Cherry Brown Cab Services</h1>
</div>
<div class="butregion">

<a href="BookingPage.jsp" class="but"  >Booking</a>
<a href="Rental.jsp" class="but">Rental</a>

</div>
<div id="about">
<p>
Cherry Brown offers a reliable metered taxi service in Ahmedabad, Mumbai, Delhi and Jaipur through a
fleet of modern, air conditioned cars equipped with state-of-the-art GPS based communication technology.
Cherry Brown keeps updating its fleets (sedan, hatchback, SUV) by purchasing brand new cars and
auctioning off the used cars. It has a team of well groomed, courteous and thoroughly trained chauffeurs
and booking agents.

</p>
</div>
</div>
</section>


<br/>
</div>
<script src="js/bootstrap.js"></script>
</body>
</html>
