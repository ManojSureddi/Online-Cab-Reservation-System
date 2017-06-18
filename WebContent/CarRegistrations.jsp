<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mystyle.css">
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
					<%if (session.getAttribute("user") != null ) { 
						if(!session.getAttribute("user").equals("admin")){
		response.sendRedirect("Login.jsp");
	}
}
					else{
						response.sendRedirect("Login.jsp");
					}
%>	
				</div>
			</div>
		</section>
		<section id="two">
			<div class="container">
				<div id="sidebar">
					<jsp:include page="sidebar.jsp"></jsp:include>
				</div>
				<div id="rightbox">
					<form action="CarRegistrationController" id="formdiv" method="post" onsubmit="return validate();">
					<p id="msg"></p>
					<% 
					if(session.getAttribute("carreg")!=null){
					Object sess=session.getAttribute("carreg");
					if(sess.equals("done")){
						%>
					<p>Registration Successfull </p>
					<% }
					else
					{
					%>
					<p>Car Not Registered</p>				
					<%
				
					} 
					session.removeAttribute("carreg");
					}
					%>
					
	
						<h3 align="center">Car Registration</h3>
						<table>

							<tr>
								<td>VIN</td>
								<td><input type="text" name="vin" id="vin"
									placeholder="VIN"></td>
							</tr>
							<tr>
								<td>City</td>
								<td><select name="source" id="city">
										<option value="-1">Select City</option>
										<option value="Jaipur">Jaipur</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Ahmedabad">Ahmedabad</option>
										<option value="New Delhi">Delhi</option>
								</select></td>
							</tr>
							<tr>
								<td>Carmake</td>
								<td><select name="carmake" id="carmake">
										<option value="-1">Select Carmake</option>
										<option value="maruti">Maruti</option>
										<option value="honda">Honda</option>
										<option value="toyoto">toyoto</option>
								</select></td>
							</tr>
							<td>Carmodel</td>
							<td><select name="carmodel" id="carmodel">
									<option value="-1">Select Carmodel</option>
									<option value="swift">Swift</option>
									<option value="celerio">Celerio</option>
									<option value="sx4">SX4</option>
							</select></td>
							</tr>
							<tr>
								<td>Capacity</td>
								<td><input type="text" name="capacity" id="capacity"
									placeholder="capacity"></td>
							</tr>
							<tr>
								<td>FleetType</td>
								<td><select name="fleettype" id="fleettype">
										<option value="-1">Select Fleet Type</option>
										<option value="suv">Suv</option>
										<option value="hatchback">Hatchback</option>
										<option value="Sedan">Sedan</option>
										<option value="passenger">Passenger</option>
								</select></td>
							</tr>
							<tr>
								<td>Features</td>
								<td><select name="features" multiple id="features">
									
										<option value="1">Automatic Transmission</option>
										<option value="2">Power Steering</option>
										<option value="3">A.C</option>
										<option value="4">Air bag</option>
										<option value="5">Anti lock brakes</option>
										<option value="6">Cruise control</option>
										<option value="7">CD player</option>
								</select></td>
							</tr>
							<tr>
								<td>Rent Per Day</td>
								<td><input type="text" name="rentperday" id="rentperday"
									placeholder="Rent Per Day"></td>
							</tr>
							<tr>
								<td>Car Number Plate</td>
								<td><input type="text" name="carnumberplate"
									id="carnumberplate" placeholder="Car Number Plate"></td>
							</tr>
							<tr>
								<td>Car Status</td>
								<td><select name="status" id="status">
										<option value="-1">Select Status</option>
										<option value="1">Available</option>
										<option value="0">Not Available</option>

								</select></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="hidden" name="referer" value="1"></input>
								</td>
							</tr>
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
	<script src="js/bootstrap.js"></script>
		<script src="js/carreg.js"></script>
</body>
</html>