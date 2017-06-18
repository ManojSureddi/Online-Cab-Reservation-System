	
	<a href="index.jsp" class="btn">Home</a>
	<%
						if (session.getAttribute("user") != null ) {
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
					%>
					<a href="Login.jsp" class="btn">Login</a> <a
						href="CustomerRegistration.jsp">Sign&nbsp;Up</a> <a
						href="Feedback.jsp">Feedback</a>
					<%
						}
					%>