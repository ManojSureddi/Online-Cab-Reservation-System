<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>



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
				<form action="RentalController" method="post" id="formdiv"
					name="myform" onsubmit="return rentalValidation();">
				
					<p id="msg"></p>
					<h3 align="center">Rent a Cab</h3>
					<table>
						<tr>
							<td>Pickup Date</td>
							<td><input type="date" name="pdate"></td>
						</tr>

						<tr>
							<td>Pick Up Time</td>

							<td><select name="phours" class="mediumselect">
									<option value="-1">Hours</option>
									<%for(int counter=1;counter<=23;counter++){ %>
									<option value="<%=counter%>"><%= counter%></option>
									<%} %>

							</select> <select name="pminutes" class="mediumselect">
									<option value="-1">Minutes</option>
									<%for(int counter=1;counter<=59;counter++){ %>
									<option value="<%=counter%>"><%= counter%></option>
									<%} %>


							</select></td>
						</tr>

						<tr>
							<td>source</td>
							<td><select name="pickuplocation" id="sourcecity">
									<option value="-1">Source</option>
									<option value="Jaipur">Jaipur</option>
									<option value="Mumbai">Mumbai</option>
									<option value="New Delhi">Delhi</option>
									<option value="Ahmedabad">Ahmedabad</option>
							</select></td>
						</tr>
						<tr>
							<td>Pick up Location</td>
							<td><textarea id="FullAddress" name="fulladdress" cols="40"
									rows="5" class="fulladdressvalidator" onFocus="geolocate()"
									placeholder="Enter Address"></textarea></td>
						</tr>

						<tr>
							<td>Drop Date</td>
							<td><input type="date" name="ddate"></td>
						</tr>

						<tr>
						<tr>
							<td>Drop Time</td>

							<td><select name="dhours" class="mediumselect">
									<option value="-1">Hours</option>
									<%for(int counter=1;counter<=23;counter++){ %>
									<option value="<%=counter%>"><%= counter%></option>
									<%} %>


							</select> <select name="dminutes" class="mediumselect">
									<option value="-1">Minutes</option>
									<%for(int counter=1;counter<=59;counter++){ %>
									<option value="<%=counter%>"><%= counter%></option>
									<%} %>


							</select></td>
						</tr>

						<tr>
							<td>Destination</td>
							<td><select name="droplocation" id="destinationcity">
									<option value="-1">Destination</option>
									<option value="Jaipur">Jaipur</option>
									<option value="Mumbai">Mumbai</option>
									<option value="New Delhi">Delhi</option>
									<option value="Ahmedabad">Ahmedabad</option>
							</select></td>
						</tr>
						<tr>
							<td>Drop Location</td>
							<td><textarea id="FulldestAddress" name="fulldestaddress"
									cols="40" rows="5" class="fulladdressvalidator"
									onFocus="geolocate()" placeholder="Enter Address"></textarea></td>
						</tr>

						<tr>
							<td>Number Of Days</td>
							<td><select name="numberofdays">
									<%for(int counter=1;counter<=14;counter++){ %>
									<option value="<%=counter %>"><%=counter %></option>
									<%} %>
							</select></td>
						</tr>
					<tr>
							<td>Carmake</td>
							<td><select name="carmake" id="carmake"
								onchange="makeChanged();">

							</select></td>
						</tr>
						<tr>
							<td>CarType</td>
							<td><select name="cartype" id="cartype"
								onchange="modelChanged();">

							</select></td>
						</tr>
						<tr>
							<td>Carmodel</td>
							<td><select name="carmodel" id="carmodel">

							</select></td>
						</tr>
							<td>Features</td>
							<td><select name="features" multiple>

									<option value="1">Automatic Transmission</option>
									<option value="2">Power Steering</option>
									<option value="3">A.C</option>
									<option value="4">Air bag</option>
									<option value="5">Anti lock brakes</option>
									<option value="6">Cruise control</option>
									<option value="7">CD player</option>
							</select></td>
						</tr>
						<input type="hidden" value="rental" name="rental">
						<tr>
							<td></td>
							<td><input type="submit" class="submit" value="Rent a Car"></input></td>
						</tr>
					</table>

				</form>
			</div>
		</div>
		</section>
	</div>
		<script src="js/bootstrap.js"></script>
	<script src="js/populate.js"> </script>
	<script type="text/javascript" src="js\RentalValidation.js"></script>
	<script src="js/maps.js"></script>

</body>
</html>