<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title> cancel booking</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mystyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
	<script src="js/CancelRental.js">
</script>
	
</head>
<body id="mainpage">
<div id="wrapper"><br />
<section id="header">
<div class="container">
<div id="heading">

<h4 class="highlight">Cherry Brown's</h4>

<h2>Online Cab Service Reservation</h2>
</div>
<div id="loginheader"> <jsp:include page="header.jsp"></jsp:include></div>
</div>
</section> <section id="two">
<div class="container">
<div id="sidebar">
<jsp:include page="sidebar.jsp"></jsp:include>
</div>
<div id="rightbox">

<form action="cancelReservationController" id="formdiv" method="post" onsubmit="return validate()">
<% 
					if(session.getAttribute("Cancel")!=null){
					Object sess=session.getAttribute("Cancel");
					if(sess.equals("valid")){
						%>
					<p>Deleted Successfully</p>
					<% }
					else
					{
					%>
					<p>No Records Found</p>
					
					<%
					
					} 
					session.removeAttribute("Cancel");
					}
					%>

<h3 align="center"padding:10px;>Cancel Renting</h3>
<p id="msg"></p>

<table align="center">
	<tr>
		<td>Rental Id</td>
		<td><input type="text" name="rentalid" id="rentalid" placeholder="rentalid"></input></td>
	</tr>

	<tr>
		<td></td>
		<td><input type="submit" class="submit"></input></td>
	</tr>
</table>
</form>
</div>
</div>
</section></div>
		<script src="js/bootstrap.js"></script>
</body>
</html>
