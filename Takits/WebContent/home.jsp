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
	margin: 40px;
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
	color: white;
}

.nav-link:hover {
	color: black;
}

.learn-btn {
	background-color: #fdb927;
	border: none;
	color: white;
	padding: 15px 20px;
	font-weight: bolder;
}

.learn-btn:hover {
	color: black;
}

.tagline {
	color: #fdb927;
	font-size: 22px;
	margin-bottom: 25px;
}

.description {
	color: white;
	font-size: 17px;
	margin-bottom: 35px;
}

.desc {
	display: inline-block;
	width: 50%;
	vertical-align: top;
	padding: 50px;
	text-align: center;
}

.takits-img {
	display: inline-block;
}

.welcome {
	color: white;
	margin-bottom: 10px;
	font-size: 80px;
}

.yellow {
	color: #fdb927;
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
    
.purple {
	color: #552583;
}



</style>
<body>
	
	<div style="text-align: center; vertical-align: middle">
		<ul style="text-align: center; vertical-align: middle">
			<li><img src="images/Takits_Logo_Violet.png" height="50px" /></li>
			<li><a href="home.jsp" class="active">HOME</a></li>
			<li><a href="about.jsp" class="nav-link">ABOUT US</a></li>
			<li><a href="steps.jsp" class="nav-link">STEPS</a></li>
			<li><a href="contacts.jsp" class="nav-link">CONTACTS</a></li>
			<li><a href="login.jsp" class="nav-link">LOGIN</a></li>
			<li><a href="register.jsp" class="nav-link">SIGN UP</a></li>
		</ul>
	</div>
	<div class="desc">
		<h1 class="welcome">
			Welcome to <span class="yellow">Takits</span>
		</h1>
		<h3 class="tagline">Unlock the power of efficient scheduling one click at a time</h3>
		<h4 class="description">Experience the freedom of hassle-free appointment management with Takits, where we help you effortlessly manage your schedule from anywhere, at any time!</h4>
		<a class="learn-btn" href="about.jsp">Learn More</a>
	</div>
	<div class="takits-img">
		<img src="images/homepg.png" />
	</div>
	
	<div class="footer">
		Copyright &copy; 2023. Designed by <span class="purple">Group 2
			BSIT 1-1</span>
	</div>
	
</body>
</html>