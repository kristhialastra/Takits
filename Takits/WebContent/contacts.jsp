<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Takits</title>
<link rel="icon" type="image/x-icon" href="images/takits_purple.png">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.css"
	rel="stylesheet" />
</head>
<style>
body {
	background-color: #552583;
}

ul {
	list-style-type: none;
}

ul>li {
	display: inline-block;
	margin: 20px 40px 10px 40px;
	color: white;
	letter-spacing: 5px;
	font-weight: bolder;
}

.active {
	color: #fdb927;
}

.active:hover {
	color: black;
}

ul {
	display: flex;
	align-items: center;
	text-align: center;
	display: inline-block;
}

.nav-link {
	color: #552583;
}

.yellow {
	color: #fdb927;
}

.heading {
	text-align: center;
	margin: 40px;
	color: white;
}

.yellow-bg {
	background-color: #fdb927;
}

.footer {
	position: absolute;
	bottom: 0;
	text-align: center;
	background-color: #fdb927;
	width: 100%;
	color: white;
	padding: 10px;
	font-size: 20px;
	font-weight: bolder;
}

.desc {
	margin: 50px;
	font-size:25px;
}


.purple {
	color: #552583;
}

.img {
	height: 120px;
}

.img2 {
	height: 110px;
}

.img3 {
	height: 127px;
	margin: 5px;
}
</style>
<body>
	<div
		style="text-align: center; vertical-align: middle; background-color: #E5E4E2; padding: 0px;">
		<ul style="text-align: center; vertical-align: middle">
			<li><img src="images/takits_purple.png" height="80px" /></li>
			<li><a href="home.jsp" class="nav-link">HOME</a></li>
			<li><a href="about.jsp" class="nav-link">ABOUT US</a></li>
			<li><a href="steps.jsp" class="nav-link">STEPS</a></li>
			<li><a href="contacts.jsp" class="active">CONTACTS</a></li>
			<li><a href="login.jsp" class="nav-link">LOGIN</a></li>
			<li><a href="register.jsp" class="nav-link">SIGN UP</a></li>
		</ul>
	</div>
	<div class="heading">
		<h1>
			CON<span class="yellow">TACTS</span>
		</h1>
		<div class="desc"><h3>Need assistance or have a specific inquiry? Our team will be more than happy to assist you. Contact us now!</h3></div>
		<img src="images/twitter.png" class="img" /> 
		<img src="images/facebook.png" class="img2" /> 
		<img src="images/instagram.png" class="img3" />
	</div>
	<div class="footer">
		Copyright &copy; 2023. Designed by <span class="purple">Group 2
			BSIT 1-1</span>
	</div>

</body>
</html>