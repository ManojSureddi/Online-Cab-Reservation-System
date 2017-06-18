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

					<a href="index.jsp"><h4 class="highlight">Cherry Brown's</h4></a>

					<h2>Online Cab Service Reservation</h2>
				</div>
				<div id="loginheader">
				<%if(session.getAttribute("referal")!=null){
					String referer=session.getAttribute("referal").toString();
					response.sendRedirect(referer);
					
				} %>
					<jsp:include page="header.jsp"></jsp:include>
				</div>
			</div>
		</section>
		<section id="two">
			<div class="container">
				<div id="sidebar">
					<jsp:include page="sidebar.jsp"></jsp:include>
				</div>
			</div>
		</section>
	</div>
	<script src="js/bootstrap.js"></script>
</body>
</html>