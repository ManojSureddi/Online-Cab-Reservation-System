<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ocsr.utils.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ocsr.bean.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	function printPaymentForm(divName) {
		var printContents = document.getElementById(divName).innerHTML;
		w = window.open();
		w.document.write(printContents);
		w.print();
		w.close();
	}
</script>
</head>
<body id="mainpage">
	<div id="wrapper">
		<br />
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
		</section>
		<section id="two">
			<div class="container">
				<div id="sidebar" class="logside">
					<h3 align="center">Hello! User</h3>
					Cherry Brown offers a reliable metered taxi service in Ahmedabad,
					Mumbai, Delhi and Jaipur through a fleet of modern, air conditioned
					cars equipped with state-of-the-art GPS based communication
					technology. Cherry Brown keeps updating its fleets (sedan,
					hatchback, SUV) by purchasing brand new cars and auctioning off the
					used cars. It has a team of well groomed, courteous and thoroughly
					trained chauffeurs and booking agents.
				</div>
				<%Connection con=null;
				con=Connector.getConnection();
				PreparedStatement ps=null;
				PreparedStatement ps1=null;
				ResultSet rs=null;
				ResultSet rs1=null;
				Bookingbean bean=(Bookingbean)session.getAttribute("obj");
				Object paymentObj=session.getAttribute("bconfirm");
				String payment=paymentObj.toString();%>

				<div id="rightbox">
					<form action="" id="formdiv">

						<div id="payment">
							<h3>Payment Confirmation</h3>
							<table>
								<tr>
									<td><label>Booking Id:</label></td>
									<td><%= bean.getBookingId() %></td>
								</tr>
								<tr>
									<td><label>Car Id:</label></td>
									<td><%= bean.getCarId() %></td>
								</tr>
								<tr>
									<td><label>Car Make:</label></td>
									<td><%= bean.getCarMake() %></td>
								</tr>
								<tr>
									<td><label>Car Model:</label></td>
									<td><%=bean.getCarModel() %></td>
								</tr>
								<tr>
									<td><label>Fleet Type:</label></td>
									<td><%= bean.getCarType() %></td>
								</tr>
								<tr>
									<td><label>Source:</label></td>
									<td><%= bean.getSource() %></td>
								</tr>
								<tr>
									<td><label>Destination:</label></td>
									<td><%=bean.getDestination() %></td>
								</tr>
								<tr>
									<td><label>Number Of days:</label></td>
									<td><%=bean.getNumberOfDays() %></td>
								</tr>
								<tr>
									<td><label>Conveyance:</label></td>
									<td><%=bean.getConveyance() %></td>
								</tr>

								<tr>
									<td><label>Total:</label></td>
									<td><%=bean.getTotalAmount() %></td>
								</tr>
							</table>

						</div>
						<p align="center">
							<input type="button" onclick="printPaymentForm('payment')"
								value="Print" class="submit">
						</p>
					</form>
				</div>
				<% session.removeAttribute("obj"); %>
			</div>
		</section>
	</div>
</body>
</html>