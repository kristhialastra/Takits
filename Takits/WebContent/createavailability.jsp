<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.dao.UserDao"%>
<%@page import="com.mvc.bean.User"%>
<%@page import="com.mvc.dao.EventDao"%>
<%@page import="com.mvc.connection.DatabaseConnection"%>
<%@page import="com.mvc.bean.Event"%>
<%@page import="java.util.List"%>
<%
    String userid = "";
    userid = (String) session.getAttribute("userid"); //login status
    if (userid == null) {
    	userid = "";
    	response.sendRedirect("login.jsp");
    }
    
    String availabilitystatus = "";
    availabilitystatus = (String) session.getAttribute("availabilitystatus"); 
    if (availabilitystatus == null) {
    	availabilitystatus = "";
    }
    
    EventDao ed=new EventDao(DatabaseConnection.getConnection());
    UserDao userDao = new UserDao(DatabaseConnection.getConnection());
    User user = new User();
    user.setUser_id(userid);
    List<User> users = userDao.getUsersList(user);
    String fullname = (String) session.getAttribute("fullname");
    if (fullname == null) {
    	fullname = "";
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Takits</title>
<link rel="icon" type="image/x-icon" href="images/takits_purple.png">
<style>
/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.frnds-list {
	padding: 4px 20px 4px 20px;
	margin: 5px;
	background-color: #fdb927;
	display: inline-block;
	border-radius: 15px;
}

#myInput {
	margin-bottom: 10px;
}
/* Hide default HTML checkbox */
.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: black;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #fdb927;
}

input:focus+.slider {
	box-shadow: 0 0 1px #fdb927;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

.time {
	border-radius: 8px;
	width: 90px;
	text-align: center;
	border: 2px solid black;
	margin: 2px;
}

.add-btn {
	font-weight: 900;
	font-size: 50px;
	margin: 0px;
	color: #552583;
}

.save-btn {
	background-color: #fdb927;
	border: none;
	color: white;
	padding: 4px 25px;
	border-radius: 15px;
}

.cancel-btn {
	color: black;
	font-weight: bolder;
	margin: 16px;
}

.notifications {
	margin: 8px auto;
	color: white;
}

a:link, a:visited {
	color: black;
	font-weight: bolder;
	text-align: center;
	text-decoration: none;
}

a:hover {
	color: white;
}

.event-link:hover {
	color: black;
}

.notifications:hover {
	color: white;
}

.takits-logo {
	margin: 40px 40px 10px 40px;
}

.event-type {
	background-color: #E5E4E2;
	padding: 20px 50px;
	margin: 15px 40px;
	border-radius: 20px;
}

.event-type:hover {
	color: white;
}

.box {
	margin-top: 30px;
}

.yellow {
	color: #fdb927;
}
.dropdown-item{
vertical-align: bottom;
}
.dropdown-item:hover{
border-radius: 20px;
}
.sign-out{
 background-color:#fdb927;
 border-radius:20px;
 margin-left: auto;
 margin: 5px;
 font-style: italic;
}
.fullname{
margin: 10px;
font-style: italic;
}
</style>
<script type="text/javascript">
function myFunction() {
	  // Get the checkbox
	  var mon = document.getElementById("Monday");
	  var addmo = document.getElementById("addmo");
	  var tue = document.getElementById("Tuesday");
	  var addtu = document.getElementById("addtu");
	  var wed = document.getElementById("Wednesday");
	  var addwe = document.getElementById("addwe");
	  var thu = document.getElementById("Thursday");
	  var addth = document.getElementById("addth");
	  var fri = document.getElementById("Friday");
	  var addfr = document.getElementById("addfr");
	  var sun = document.getElementById("Sunday");
	  var addsu = document.getElementById("addsu");
	  var sat = document.getElementById("Saturday");
	  var addsa = document.getElementById("addsa");

	  // If the checkbox is checked, display the output text
	  if (mon.checked == true){
		  addmo.style.display = "block";
	  } else {
		  addmo.style.display = "none";
	  }
	  if (tue.checked == true){
		  addtu.style.display = "block";
	  } else {
		  addtu.style.display = "none";
	  }
	  if (wed.checked == true){
		  addwe.style.display = "block";
	  } else {
		  addwe.style.display = "none";
	  }
	  if (thu.checked == true){
		  addth.style.display = "block";
	  } else {
		  addth.style.display = "none";
	  }
	  if (fri.checked == true){
		  addfr.style.display = "block";
	  } else {
		  addfr.style.display = "none";
	  }
	  if (sat.checked == true){
		  addsa.style.display = "block";
	  } else {
		  addsa.style.display = "none";
	  }
	  if (sun.checked == true){
		  addsu.style.display = "block";
	  } else {
		  addsu.style.display = "none";
	  }
	}
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 "
				style="background-color: #552583;">
				<div
					class="d-flex flex-column align-items-center  px-1 pt-2 text-white min-vh-100 "
					style="text-align: center;">

					<img src="images/takits.png" style="height: 60px;"
						class="img-responsive center-block takits-logo"
						style="margin: 0 auto;" />
						<div class="fullname">Hello, <%=fullname %>!</div>
						 <a href=""
						class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
						<span class="fs-9 d-none d-sm-inline"><b>Appoint your
								friends now by searching their for <span style="color: #fdb927;">username</span>
								and <span style="color: #fdb927;">personal code</span>
						</b></span>
					</a>
					<ul
						class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center "
						id="menu">

						<li class="nav-item"><a type="button" class="btn  pull-right"
							data-toggle="modal" data-target="#exampleModalCenter"> <img
								src="images/search.png" style="height: 40px;" /></a></li>
						<li class="nav-item"><a href="eventtypes.jsp"
							class="nav-link mb-1" style="padding: 0px;"> <i
								class="fs-4 bi-house"></i> <span
								class="ms-1 d-none d-sm-inline "><img
									src="images/eventtypes2.png" height="47px" /></span>

						</a></li>

						<li><a href="bookings.jsp" class="nav-link px-1 align-middle">
								<i class="fs-4 bi-house"></i> <span
								class="ms-1 d-none d-sm-inline"><img
									src="images/bookings.png" height="31px" /></span>
						</a></li>
						<li><a href="createavailability.jsp"
							class="nav-link px-0 align-middle"> <i class="fs-4 bi-house"></i>
								<span class="ms-1 d-none d-sm-inline"><img
									src="images/availability2.png" height="40px" /></span>
						</a></li>
						<li class="notifications"><a href="notifications.jsp"
							class="notifications"><i> <span class="notifications"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16"
											class=" px-0 align-middle ms-1 d-none d-sm-inline">
  <path
												d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
</svg> Notifications</span></i></a></li>
 </li> <br>
							  <li class="sign-out ">
							 	<a href="LogOutServlet" class="dropdown-item">Sign Out</a>
							 </li>
					</ul>
					<hr>

				</div>
			</div>
			<div class="col py-0 px-0">
				<div style="background-color: #E5E4E2; padding: 20px 0px 25px 40px;">
					<h1 style="color: #552583;">Availability</h1>
					Configure times when you are available.
					
	

				</div>
				<div class="box">
					<div class="event-type">
						<a href="availability.jsp?type=Brainstorming" class="event-link">Brainstorming</a>
					</div>
					<div class="event-type">
						<a href="availability.jsp?type=Chat w/ friends" class="event-link">Chat
							w/ friends</a>
					</div>
					<div class="event-type">
						<a href="availability.jsp?type=Corporate Meeting"
							class="event-link">Corporate Meeting</a>
					</div>
					<div class="event-type">
						<a href="availability.jsp?type=Deal Negotiation"
							class="event-link">Deal Negotiation</a>
					</div>
					<div class="event-type">
						<a href="availability.jsp?type=Class" class="event-link">Class</a>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content"
				style="background-color: #552583; border-radius: 20px; color: white;">
				<div class="modal-header text-center">
					<h6 class="modal-title" id="exampleModalLongTitle">
						Appoint now with your friends by searching for their <span
							class="yellow">username</span> and <span class="yellow">personal
							code</span>
					</h6>

				</div>
				<div class="modal-body">
					<input type="text" id="myInput" onkeyup="myFunction()"
						placeholder="Search for person name or id" class="form-control">
					<table id="myTable">
						<%
									if (!users.isEmpty()) {
									for (User u : users) {
								%>
						<tr>
							<td></td>
							<td>
								<div class="frnds-list">
									<svg style="color: black;" xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor"
										class="bi bi-person-fill" viewBox="0 0 16 16">
  <path
											d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
</svg>
									<a
										href="eventtypes.jsp?id=<%=u.getUser_id()%>&name=<%=u.getFullname()%>"><%=u.getUser_id() %>,
										<%=u.getFullname()%></a>
								</div>
							</td>
						</tr>
						<%
									}
								}
								%>
					</table>
					<br />
				</div>

			</div>
		</div>
	</div>
	<script src="js/script.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
            $(function () {
                $(".datepicker").datepicker();
            });
        </script>
</body>
</html>