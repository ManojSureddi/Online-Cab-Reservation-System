<%@ page import="com.ocsr.utils.*"%>
<%@ page import="com.ocsr.bean.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
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
					<jsp:include page="header.jsp"></jsp:include></div>
			</div>
		</section>
		<section id="two">
			<div class="container">

				<%
					if (session.getAttribute("user") != null) {
				%>
				<div id="sidebar">
					<jsp:include page="sidebar.jsp"></jsp:include>
				</div>
				<%
					} else {
				%>
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
				<%
					}
				%>


				<div id="rightbox">
					<form name="feedbackform" action="FeedbackController" id="formdiv" style="width:580px;"
						method="post" onsubmit="return validate()">
						<center>
							<h3>Feedback Form</h3>
						</center>
						<p id="msg"></p>
						<table>
							<tr>
								<td><label>Name</label></td>
								<td><input type="text" name="name" placeholder="Name"
									id="name"></td>
							</tr>
							<tr>
								<td><label>Feedback Category</label></td>
								<td><select name="feedbackcategory" id="category">
										<option value="-1">Feedback Category</option>
										<option value="cab availability">Cab availability</option>
										<option value="cab arrival time">Cab arrival time</option>
										<option value="fare related">Fare related</option>
										<option value="cab condition">Cab condition</option>
										<option value="behavior-chauffeur">Behavior-Chauffeur</option>
										<option value="behavior-booking agent">Behavior-Booking
											Agent</option>
										<option value="others">Others</option>


								</select></td>
							</tr>
							<tr>
								<td><label>Feedback Type</label></td>
								<td><select name="feedbacktype" id="type">
										<option value="-1">Feedback Type</option>
										<option value="Comments">Comments</option>
										<option value="Feedback">Feedback</option>
										<option value="Suggestions">Suggestions</option>
								</select></td>
							</tr>
							<tr>
								<td>City</td>
								<td><select name="city" id="sourcecity">
										<option value="-1"> City</option>
										<option value="Jaipur">Jaipur</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Ahmedabad">Ahmedabad</option>
										<option value="New Delhi">Delhi</option>
								</select></td>
							</tr>
							<tr>
								<td><label>E-mail Id</label></td>
								<td><input type="email" name="emailid"
									placeholder="E-mail Id" id="email"></td>
							</tr>
							<tr>
								<td><label>Contact Number</label></td>
								<td><input type="text" name="contactnumber"
									id="contactnumber" placeholder="Contact Number" maxlength="10"></td>
							</tr>
							<tr>
								<td>Journey Date</td>
								<td><input type="date" name="date" id="date">
							</tr>
							<tr>
								<td><label>Car Number</label></td>
								<td><input type="text" name="carnumber" id="carnumber"
									placeholder="Car Number"></td>
							</tr>
							<tr>
								<td><label>Message</label></td>
								<td><textarea rows=4 cols=40 name="message" id="message"></textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" class="submit"
									value="submit feedback" /></td>
							</tr>
						</table>

					</form>
				</div>
			</div>
		</section>

		<script src="js/feedback.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>



		<%
			PreparedStatement ps = null;
			Connection con = null;
		%>
		<%
			try {
				con = Connector.getConnection();
				ps = con.prepareStatement("select name,message from ocsr_feedback order by FEEDBACK_ID DESC");
			} catch (Exception e) {
			}
		%>


		<%
			FeedbackBean feedbackBean = new FeedbackBean();
		%>
		<section id="feedbackcontainer">

			<%
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
			%>
			<div class="feedback">
				<div class="header btn btn-primary"><%=rs.getString(1)%></div>
				<div class="content"><%=rs.getString(2)%></div>
			</div>
			<%
				}
			%>
		
	</div>
	<script src="js/bootstrap.js"></script>
</body>
</html>