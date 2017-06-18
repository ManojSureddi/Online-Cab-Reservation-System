<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">


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
Mumbai, Delhi and Jaipur through a fleet of modern, air conditioned cars
equipped with state-of-the-art GPS based communication technology.
Cherry Brown keeps updating its fleets (sedan, hatchback, SUV) by
purchasing brand new cars and auctioning off the used cars. It has a
team of well groomed, courteous and thoroughly trained chauffeurs and
booking agents.
				</div>
				<div id="rightbox">
				
					<form action="CustomerRegistrationController" id="formdiv" method="post" onsubmit="return validateCustomer();">
					<% 
					if(session.getAttribute("CustomerRegistration")!=null){
					Object sess=session.getAttribute("CustomerRegistration");
					if(sess.equals("invalid")){
						%>
					<p>User Already Exist</p>
					<% }
					else if(sess.equals("valid")){
					
					%>
					<p>Registered Successfully</p>
					
					<%
					
					} 
					else{
						
						%>
						<p>Registered UnSuccessfully</p>
						<% 
					}
					session.removeAttribute("CustomerRegistration");
					}
					%>
					<h4 align="center">Customer Registration</h4>
					<p id="msg"></p>
<table align="center">
<tr><td>Name:</td><td><input type="text" name="name" id="name" placeholder="Name" ></input>
</td></tr>
<tr><td>Email:</td><td><input type="email" name="email" id="email"  placeholder="Email Address" ></input>
</td></tr>
<tr><td>Phone:</td><td><input type="text" name="phone" id="phone" maxlength="10" placeholder="Phone" ></input>
</td></tr>
<tr><td>Address:</td><td><textarea cols="10" rows="5" placeholder="Address" name="address" id="address"></textarea>
</td></tr>
<tr><td>Gender:</td>

<td><select name="gender" id="gender" class="thinselect">
<option value="-1">Gender</option>
<option value="M">Male</option>
<option value="F">Female</option>
</select>
</td></tr>
							<tr>
								<td>Date Of Birth</td>
								<td><input type="date" name="date" id="date"></td>
							</tr>
<tr><td>Tracking Number:</td><td><input type="text" name="trackingnumber" id="T_number" maxlength="10" placeholder="Tracking number" ></input>
</td></tr>
<tr><td>License Number:</td><td><input type="text" name="licensenumber" maxlength="14" id="L_number" placeholder="License number" ></input>
</td></tr>
<tr><td>Password:</td><td><input type="password" name="password" id="password" placeholder="Password" >
</td></tr>
<tr><td>Confirm Password:</td><td><input type="password" name="confirmpassword" id="confirmpassword" placeholder="Confirm Password" ></input>
</td></tr>
<%
Random rand=new Random();
int a=rand.nextInt(12);
int b=rand.nextInt(12);
%>
<tr><td></td><td>

<%
if(session.getAttribute("capcha")!=null){
	%>
	
	<p>Enter Valid Captcha</p>
	<%
	
}


%>
</td></tr>
<tr><td>
<input type="hidden" name="fv" id="fv"  size="3" value="<%=a %>">
<input type="hidden" id="sv" name="sv" size="3" value="<%=b %>">
<b><%=a %>+<%=b %>=</b></td><td><input type="text" id="result" name="result" size="3"></td></tr>
<tr>
								<td></td>
								<td><input type="submit" class="submit"></input></td>
							</tr>
</table>
					</form>
				</div>
			</div>
		</section>
	</div>
	<script src="js/custreg.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
		<script src="js/maps.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>