
<html>
<head>
<meta charset="utf-8">
<title></title>

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>

	
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
					%>

					<div class="dropdown">
						<a id="dLabel" role="button" data-toggle="dropdown"
							data-target="#" href="#"> Welcome <%=session.getAttribute("username")%>
							<span class="caret"></span>
						</a>


						<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
							<a href="ViewProfile.jsp">View Profile</a>
							<a href="UpdateProfile.jsp">Update Profile</a>
							<a href="Feedback.jsp">Feedback</a>
							<a href="Logout.jsp">Logout</a>
						</ul>
					</div>

					<%
						} else {
							session.setAttribute("referal", "Bookingpayment.jsp");
							response.sendRedirect("Login.jsp");
						}
					%>

</div>
</div>
</section> <section id="two">
<div class="container">
<div id="sidebar">
	<jsp:include page="sidebar.jsp"></jsp:include>
</div>
<div id="rightbox">

<form action="BookingController" method="post" name="myform" id="formdiv">
<h3 align="center">card details</h3>
<table>
<tr>
<td>
card type
</td>
<td >
<input type="radio" name=cardtype value=credit>Credit card</input>
<input type="radio" name=cardtype value=debit>Debit card</input>
</td></tr>
<tr><td>Card Details</td>
<td><input type="text" name="card" maxlength="16"></td>
</tr>
<tr><td>CVV Number</td>
<td><input type="text" name="cvv" ></td>
</tr>
<tr><td>Name on Card</td>
<td><input type="text" name="cname"></td>
</tr>
<tr><td><td><input type="submit" value="Pay" class="submit"></td>
</tr>
<input type="hidden" value="correct" name="booking">
</table>
</form>
</div>
</div>
</section></div>
		<script type="text/javascript" src="js/Payment.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>