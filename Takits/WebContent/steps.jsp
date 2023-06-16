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

.learn-btn {
	background-color: #fdb927;
	border: none;
	color: white;
	padding: 15px 20px;
	font-weight: bolder;
}

.yellow {
	color: #fdb927;
}

.heading {
	text-align: center;
	margin: 20px;
	color: #552583;
}

.yellow-bg {
	background-color: #fdb927;
}

.steps {
	background-color: #552583;
	height: 200px;
	width: 500px;
	display: inline-block;
	border-radius: 10px;
	color: white;
	font-size: 30px;
	padding: 10px 20px;
	margin: 5px;
	text-align: left;
}

.container {
	padding: 0px 20px;
	text-align: center;
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
	<div
		style="text-align: center; vertical-align: middle; background-color: #E5E4E2; padding: 0px;">
		<ul style="text-align: center; vertical-align: middle">
			<li><img src="images/takits_purple.png" height="80px" /></li>
			<li><a href="home.jsp" class="nav-link">HOME</a></li>
			<li><a href="about.jsp" class="nav-link">ABOUT US</a></li>
			<li><a href="steps.jsp" class="active">STEPS</a></li>
			<li><a href="contacts.jsp" class="nav-link">CONTACTS</a></li>
			<li><a href="login.jsp" class="nav-link">LOGIN</a></li>
			<li><a href="register.jsp" class="nav-link">SIGN UP</a></li>
		</ul>
	</div>
	<div class="heading">
		<h1>
			STE<span class="yellow">PS</span>
		</h1>
	</div>
	<div class="container">
		<div class="steps">
			STEP <span class="yellow">01</span>
		<p style="font-size:14px; text-align: justify;">Start by creating your Takits account - simply fill in your name, email, contact number, desired username, and confirm password. And don't forget to save your code after. Once you've signed up successfully, you'll be directed to the login page to enter your username and password for access.</p>
		</div>
		<div class="steps">
			STEP <span class="yellow">02</span>
		<p style="font-size:14px; text-align: justify;">Select the username and code of the friend you want to make an appointment in the search bar. By doing this, you can now set an appointment to his/her in the "Event types" section, by making the title, description, duration, and location of the meeting, according to the availability of this friend. </p>
		</div>
		<div class="steps">
            STEP <span class="yellow">03</span>
        <p style="font-size:14px; text-align: justify;">After creating an event, your booked appointment will be visible in the "Bookings" tab. If any changes are needed, you can reschedule or cancel the appointment effortlessly.</p>
        </div>
         <div class="steps">
            STEP <span class="yellow">04</span>
         <p style="font-size:14px; text-align: justify;">Set your availability in the "Availability" tab by creating time blocks when you are available for appointments. The set availability syncs with the calendars of the invitees when they book an appointment with you.</p>
       </div>
	</div>
	
	<br><br><br><br><br>

    <div class="footer">
		Copyright &copy; 2023. Designed by <span class="yellow">Group 2
			BSIT 1-1</span>
	</div>
</body>
</html>