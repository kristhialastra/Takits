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

.sticky-navbar {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 100;
    background-color: #E5E4E2;
  }

.learn-btn {
	background-color: #fdb927;
	border: none;
	color: white;
	padding: 15px 20px;
	font-weight: bolder;
}

.tagline {
	color: #fdb927;
	font-size: 20px;
	margin-bottom: 25px;
}

.description {
	color: white;
	font-size: 15px;
	margin-bottom: 25px;
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
	font-size: 50px;
}

.yellow {
	color: #fdb927;
}

.about-us {
	margin: 30px 50px 50px 50px;
	background-color: #fdb927;
	padding: 70px 50px;
	color: black;
	font-size: 20px;
}

.heading {
	text-align: center;
	margin: 30px;
	color: #552583;
	margin-top:10rem;
}

.yellow-bg {
	background-color: #fdb927;
}

.meet {
	padding: 50px;
	text-align: center;
}

.card {
	width: 100%;
	background-color: #552583;
	color: white;
	text-align: center;
	padding: 20px;
	font-size: 13px;
	z-index: 0;
}

.span-1 {
	display: inline-block;
	font-size: 15px;
	margin: 10px 0px 20px 0px;
}

.span-2 {
	display: inline-block;
	font-size: 15px;
	margin: 70px 0px 20px 0px;
}

.img {
	width: 70%;
	height: 150px;
	background-color: #E5E4E2;
	border-radius: 15px;
	margin: 0 auto;
	z-index: 3;
	position: relative;
	top: 70px;
}

.container {
	text-align: center;
	display: inline-block;
	width: 20%;
	padding: 0px;
	margin: 40px;
}

.footer {
    
    bottom: 0;
    text-align: center;
    background-color: #552583;
    width: 100%;
    color: white;
    padding: 10px;
    font-size: 20px;
    font-weight: bolder;
    
    }

</style>
<body>
	<div class="sticky-navbar" style="text-align: center; vertical-align: middle; padding: 0px;">
  <ul style="text-align: center; vertical-align: middle">
    <li><img src="images/takits_purple.png" height="80px" /></li>
    <li><a href="home.jsp" class="nav-link">HOME</a></li>
    <li><a href="about.jsp" class="active">ABOUT US</a></li>
    <li><a href="steps.jsp" class="nav-link">STEPS</a></li>
    <li><a href="contacts.jsp" class="nav-link">CONTACTS</a></li>
    <li><a href="login.jsp" class="nav-link">LOGIN</a></li>
    <li><a href="register.jsp" class="nav-link">SIGN UP</a></li>
  </ul>
</div>
	<div class="heading">
		<h1>
			ABOUT <span class="yellow">US</span>
		</h1>
	</div>
	<div class="about-us">Welcome to Takits, your ultimate online appointment scheduling software, revolutionizing the way you manage your appointments with convenience and reliability. We understand the value of your time and the importance of efficient scheduling, which is why our software empowers you to streamline your booking process, save valuable time, and improve your productivity. Say goodbye to the hassle of traditional appointment management and embrace the freedom of scheduling anytime, anywhere, with our accessible web application, available to you 24/7. Join thousands of satisfied users who have discovered the power of Takits and experience the seamless appointment management you deserve</div>

	<div class="heading">

		<h1>
			MEET OUR <span class="yellow">TEAM</span>
		</h1>
	</div>
	<div class="meet yellow-bg">
		Behind every line of code and every pixel of design, lies the expertise and dedication of our talented team. Meet the brilliant minds shaping the future of online booking with Takits.
		<div class="container">
			<div class="img">
			<img src="images/kristhia.jpg" alt="Kristhia" style="width: 200px; height: 200px; border-radius: 7%;">
			</div>
			<div class="card ">
				<h4 class="span-2">
				<br><br><br>
					<span class="yellow">Kristhia Lastra</span>
				</h4>
				<h4 class="span-1">
					Project <span class="yellow ">Manager</span>
				</h4>
				Meet Kristhia, our brilliant Project Manager at Takits.  She ensures that every aspect of our software is meticulously planned, executed, and delivered to exceed your expectations. She collaborates closely with our talented team to drive innovation, streamline processes, and ensure a seamless user experience.
			</div>
		</div>
		<div class="container">
			<div class="img">
			<img src="images/erych.jpg" alt="Erych" style="width: 200px; height:200px; border-radius:7%;">
			</div>
			<div class="card ">
				<h4 class="span-2">
				<br><br><br>
					<span class="yellow">Erych Rubio</span>
				</h4>
				<h4 class="span-1">
					Business <span class="yellow ">Analyst</span>
				</h4>
				Introducing Erych, our talented Business Analyst at Takits. As a crucial member of our development team, Erych plays a pivotal role in translating user requirements into actionable insights. Sarah's expertise ensures that our software aligns perfectly with your needs, offering a seamless and intuitive experience. 
			</div>
		</div>
		<div class="container">
			<div class="img">
			<img src="images/faith.jpg" alt="Faith" style="width: 200px; height:200px; border-radius:7%;">
			</div>
			<div class="card ">
				<h4 class="span-2">
				<br><br><br>
					<span class="yellow">Faith Aguilera</span>
				</h4>
				<h4 class="span-1">
					Tes<span class="yellow ">ter</span>
				</h4>
				Allow us to introduce Faith, our meticulous Tester at Takits. With her keen eye for detail , she plays a crucial role in ensuring that our application meets the highest standards of functionality. She diligently puts our software through rigorous testing, identifying any bugs to be resolved before it reaches your hands. 
			<br><br>
			</div>
		</div>
		<div class="container">
			<div class="img">
			<img src="images/rizza.jpg" alt="Rizza" style="width:200px; height:200px; border-radius:7%;">
			</div>
			<div class="card ">
				<h4 class="span-2">
				<br><br><br>
					<span class="yellow">Rizza Pardales</span>
				</h4>
				<h4 class="span-1">
					Prog<span class="yellow ">rammer</span>
				</h4>
				Introducing Rizza, our talented Programmer at Takits. With her expertise in coding and development, Rizza brings life to our application through her exceptional programming skills. She is responsible for writing clean, efficient, and scalable code that forms the backbone of our software. 
			</div>
		</div>
		<div class="container">
			<div class="img">
			<img src="images/yuri.jpg" alt="Yuri" style="height:200px; width:200px; border-radius:7%;">
			</div>
			<div class="card ">
				<h4 class="span-2">
				<br><br><br>
					<span class="yellow">Yuri Egipto</span>
				</h4>
				<h4 class="span-1">
					Prog<span class="yellow ">rammer</span>
				</h4>
				Say hello to Yuri, the programming wizard behind Takits. With his exceptional coding skills, Yuri turns ideas into reality, shaping our application into a powerful tool for efficient appointment management. He also ensures that Takits stands out in its performance, offering you a truly remarkable experience.
			</div>
		</div>
	</div>
	
	<div class="footer">
		Copyright &copy; 2023. Designed by <span class="yellow">Group 2
			BSIT 1-1</span>
	</div>
</body>
</html>