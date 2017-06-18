<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title> cancel booking</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mystyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
<jsp:include page="header.jsp"></jsp:include>

</div>

</div>
</section> <section id="two">
<div class="container">
<div id="sidebar">
	<jsp:include page="sidebar.jsp"></jsp:include>
</div>
<div id="rightbox">

<form action="CancelBookingController" id="formdiv" method="post" onsubmit="return validate()">
<% 
					if(session.getAttribute("Cancel")!=null){
					Object sess=session.getAttribute("Cancel");
					if(sess.equals("invalid")){
						%>
					<p>No Records Found</p>
					<% }
					else
					{
					%>
					<p>Deleted Successfully</p>				
					<%
					
					} 
					
					}
					%>

<h3 align="center"padding:10px;>Cancel Booking</h3>
<p id="msg"></p>
<table>
	<tr>
		<td>Booking Id</td>
		<td><input type="text" name="bookingid" id="bookingid" placeholder="booking id"></input></td>
	</tr>

	<tr >
		<td></td>
		<td><input type="submit" class="submit" value="cancel booking"></input></td>
	</tr>
</table>
</form>
</div>
</div>
</section></div>
		<script src="js/bootstrap.js"></script>
</body>
</html>

