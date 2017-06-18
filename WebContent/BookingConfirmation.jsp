<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.ocsr.utils.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Rental</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
			<div id="sidebar">
	<jsp:include page="sidebar.jsp"></jsp:include>
			</div>
<div id="rightbox">
			<form action="Bookingpayment.jsp" id="formdiv" method="post" name="myform">
				<%
					PreparedStatement ps1 = null;
					PreparedStatement ps2 = null;
					ResultSet rs1=null;
					ResultSet rs2=null;
					Connection con = null; 
					Connection con1 = null; 
					String carId=null;
					
		if(session.getAttribute("bookId")!=null)		{	
				Object tempBookingId=session.getAttribute("bookId");
				Object bookingBean=session.getAttribute("obj");
				String bookingId=tempBookingId.toString();System.out.println("inconf");
				if(bookingId!=null)
				{
		
				System.out.println("in r conf class");
					try {
						con = Connector.getConnection();
						con1 = Connector.getConnection();
						ps1=con.prepareStatement("select * from temp_ocsr_booking where booking_id=? ");
						ps1.setString(1,bookingId);
						rs1 = ps1.executeQuery();
					while (rs1.next()) {
				%>
				<table><tr><td>Booking date:</td><td><%=rs1.getString("booking_date")%></td></tr>
				<tr><td>source:</td><td><%=rs1.getString("source")%></td></tr>
				<tr><td>Destination:</td><td><%=rs1.getString("Destination")%></td></tr>
				<tr><td>Start time:</td><td><%=rs1.getString("Start_time")%></td></tr>

				<% carId=rs1.getString("car_id"); 
				System.out.println(carId);
				
					}
					ps2 = con.prepareStatement("select * from ocsr_fleet where car_id=?");
					ps2.setString(1,carId);
				    rs2 = ps2.executeQuery();
					while (rs2.next()) {
				%>

				<tr><td>Car make:</td><td><%=rs2.getString("CarMake")%></td></tr>
				<tr><td>Car model:</td><td><%=rs2.getString("CarModel")%></td></tr>
				<tr><td>Car type:</td><td><%=rs2.getString("FleetType")%></td></tr>
				<tr><td>Features:</td><td><%=rs2.getString("Features")%></td></tr>
				<tr><td>Security Deposit:</td><td><%=rs2.getInt("SECURITY_DEPOSIT")%></td></tr></table>
				<%
					}
					}catch(SQLException e)
					{
						e.printStackTrace();
					}catch(ClassNotFoundException e)
					{
						e.printStackTrace();
					}
				%>
				<p align="center">
				<tr><td></td>
			<td><input type="submit" value="confirm" class="submit">
			</td></tr>
		</p>
		</form>
		<% }
		}	
				else
		{%>
		Car is not available.<br>Please... Select another car.<br>
		<a href="BookingPage.jsp" class="btn btn-primary">Book Another Car</a>
		<% }%>
	
			
		</div>
		
	<script src="js/bootstrap.js"></script>
	
</body>
</html>