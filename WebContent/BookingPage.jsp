<!doctype html>
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
					<form action="BookingController" method="post" id="formdiv" onsubmit="return validate();">
					<p id="msg"></p>
						<h3 align="center">Book a Cab</h3>
						<table>
							<tr>
								<td>Start Date</td>
								<td><input type="date" name="date" id="date"></td>
							</tr>
							<tr>
								<td>Source City</td>
								<td><select name="source" id="sourcecity">
										<option value="-1">Select source</option>
										<option value="Jaipur">Jaipur</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Ahmedabad">Ahmedabad</option>
										<option value="New Delhi">Delhi</option>
								</select></td>
							</tr>
							<tr>
								<td>Source</td>
								<td><textarea id="FullAddress" name="FullAddress" cols="40"
										rows="5" class="fulladdressvalidator" onFocus="geolocate()"
										placeholder="Enter Address"></textarea></td>
							</tr>
							<tr>
								<td>Destination City</td>
								<td><select name="source" id="destinationcity">
										<option value="-1">Select Destination</option>
										<option value="Jaipur">Jaipur</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Ahmedabad">Ahmedabad</option>
										<option value="New Delhi">Delhi</option>
								</select></td>
							</tr>
							<tr>
								<td>Destination</td>
								<td><textarea id="FulldestAddress" name="FulldestAddress"
										cols="40" rows="5" class="fulladdressvalidator"
										onFocus="geolocate()" placeholder="Enter Address"></textarea></td>
							</tr>
							<tr>
								<td>Pick Up Time</td>

								<td><select name="hours" class="mediumselect">
										<option value="-1">Hours</option>
										<%
											for (int counter = 01; counter < 24; counter++) {
										%>
										<option value="<%=counter%>"><%=counter%></option>
										<%
											}
										%>

								</select> <select name="minutes" class="mediumselect">
										<option value="-1">Minutes</option>
										<%
											for (int counter = 1; counter < 60; counter++) {
										%>
										<option value="<%=counter%>"><%=counter%>
										</option>
										<%
											}
										%>


								</select></td>
							</tr>
							<tr>
								<td>Number Of Days</td>
								<td><input type="radio" name="numberofdays" value="1"
									checked>One Day<input type="radio" name="numberofdays"
									value="2">Two Days</td>
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
							<tr>
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
                    <input type="hidden" value="booking" name="booking"/>
							<tr>
								<td></td>
								<td><input type="submit" class="submit" value="Book a Car"></input></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</section>
	</div>
	<script src="js/bootstrap.js"></script>
		<script src="js/bookacab.js"></script>
			<script src="js/populate.js"> </script>
	<script src="js/maps.js"></script>
</body>
</html>