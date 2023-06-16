<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.dao.EventDao"%>
<%@page import="com.mvc.dao.UserDao"%>
<%@page import="com.mvc.bean.User"%>
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
    
    String type=request.getParameter("type");
    if(type!=null){
    	 request.getSession().setAttribute("availabilitytype", type);
    }
    String availabilitytype = "";
    availabilitytype = (String) session.getAttribute("availabilitytype"); 
    if (availabilitytype == null) {
    	availabilitytype = "";
    }
    String fullname = (String) session.getAttribute("fullname");
    if (fullname == null) {
    	fullname = "";
    }
    UserDao userDao = new UserDao(DatabaseConnection.getConnection());
    User user = new User();
    user.setUser_id(userid);
    List<User> users = userDao.getUsersList(user);
    
    EventDao ed=new EventDao(DatabaseConnection.getConnection());
    
    List<Event> mon = ed.getAvailableTimeSlots(userid,"mon",availabilitytype);
    List<Event> tue = ed.getAvailableTimeSlots(userid,"tue",availabilitytype);
    List<Event> wed = ed.getAvailableTimeSlots(userid,"wed",availabilitytype);
    List<Event> thu = ed.getAvailableTimeSlots(userid,"thu",availabilitytype);
    List<Event> fri = ed.getAvailableTimeSlots(userid,"fri",availabilitytype);
    List<Event> sat = ed.getAvailableTimeSlots(userid,"sat",availabilitytype);
    List<Event> sun = ed.getAvailableTimeSlots(userid,"sun",availabilitytype);
    List<Event> availabledays = ed.getAvailableDays(userid,availabilitytype);
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

a:link, a:visited {
	color: black;
	font-weight: bolder;
	text-align: center;
	text-decoration: none;
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

.save-btn-2 {
	background-color: #fdb927;
	border: none;
	color: white;
	padding: 6px 25px;
	border-radius: 4px;
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

a:hover {
	color: white;
}

.notifications {
	color: white;
}

.notifications:hover {
	color: white;
}

.takits-logo {
	margin: 40px 40px 10px 40px;
}
.fullname{
margin: 10px;
font-style: italic;
}
.purple {
	color: #552583;
}

.desc-sub {
	font-size: 17px;
	font-weight: bolder;
}

.title-3 {
	font-weight: bolder;
}

.error {
	color: #552583;
	margin: auto;
	text-align: center;
	font-style: italic;
}

.yellow {
	color: #fdb927;
}

.table-3 td, th {
	text-align: center;
	padding: 10px;
}

.table-3 {
	margin: 20px auto;
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
</style>
<script type="text/javascript">
function myFunction1() {
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
							data-toggle="modal" data-target="#exampleModalCenterFrnds"> <img
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
				<table class="table-3">
					<tr>
						<th>Mon</th>
						<th>Tue</th>
						<th>Wed</th>
						<th>Thu</th>
						<th>Fri</th>
						<th>Sat</th>
						<th>Sun</th>
					</tr>
					<%    if (!availabledays.isEmpty()) {
                        for (Event e : availabledays) {
                %><tr>
						<td><%=e.getMon() %></td>
						<td><%=e.getTue()%></td>
						<td><%=e.getWed() %></td>
						<td><%=e.getThu() %></td>
						<td><%=e.getFri()%></td>
						<td><%=e.getSat() %></td>
						<td><%=e.getSun() %></td>
					</tr>
					<%
                }
                }%>
				</table>
				<form action="SetWeeksAvailableServlet?type=<%=availabilitytype %>"
					method="post">
					<div
						style="background-color: #E5E4E2; margin: 30px; padding: 20px; border-radius: 25px;">
						<div class="error"><%=availabilitystatus %></div>
						<h3 class="purple"><%=availabilitytype %></h3>
						<div class="float-right" style="display: inline-block;">
							<a href="createavailability.jsp" class="cancel-btn">Cancel</a>
							<button type="submit" class="save-btn">Save</button>
						</div>
						<span class="desc-sub">Description:</span>
						<p>Configure times when you are available.</p>
						<h5 class="title-3">Weekly Schedule:</h5>


						<!-- Rounded switch -->
						<br /> <label class="switch"> <input type="checkbox"
							name="Monday" id="Monday" onclick="myFunction1()"> <span
							class="slider round"></span>
						</label> Monday<br />
						<button type="button" class="btn add-btn" data-toggle="modal"
							data-target="#exampleModalMonday" id="addmo"
							style="display: none">+ Add</button>
						<%    if (!mon.isEmpty()) {
                        for (Event e : mon) {
                %>
						<input value="<%=e.getStarttime() %>" readonly class="time" /> - <input
							value=" <%=e.getEndtime() %>" readonly class="time" /> <a
							href="DeleteAvailability?id=<%=e.getEventid() %>"><svg
								xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								fill="#552583" class="bi bi-trash" viewBox="0 0 16 16">
  <path
									d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
  <path
									d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
</svg></a><br />
						<%
                        }
                    }else{
                    	%>
						No time slots saved on Monday
						<%}
                %>

						<br />
						<br /> <label class="switch"> <input type="checkbox"
							name="Tuesday" id="Tuesday" onclick="myFunction1()"> <span
							class="slider round"></span>
						</label> Tuesday<br />
						<button type="button" class="btn add-btn" data-toggle="modal"
							data-target="#exampleModalTuesday" id="addtu"
							style="display: none">+ Add</button>
						<%    if (!tue.isEmpty()) {
                        for (Event e : tue) {
                %>
						<input value="<%=e.getStarttime() %>" readonly class="time" /> - <input
							value=" <%=e.getEndtime() %>" readonly class="time" />
						<%=e.getStarttime() %>to
						<%=e.getEndtime() %>
						<a href="DeleteAvailability?id=<%=e.getEventid() %>"><svg
								xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								fill="#552583" class="bi bi-trash" viewBox="0 0 16 16">
  <path
									d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
  <path
									d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
</svg></a>
				</form>
				<br />
				<%
                        }
                    }else{
                    	%>
				No time slots saved on Tuesday
				<%}
                %>
				<br />
				<br /> <label class="switch"> <input type="checkbox"
					name="Wednesday" id="Wednesday" onclick="myFunction1()"> <span
					class="slider round"></span>
				</label> Wednesday<br />
				<button type="button" class="btn add-btn" data-toggle="modal"
					data-target="#exampleModalWednesday" id="addwe"
					style="display: none">+ Add</button>
				<%    if (!wed.isEmpty()) {
                        for (Event e : wed) {
                %>
				<input value="<%=e.getStarttime() %>" readonly class="time" /> - <input
					value=" <%=e.getEndtime() %>" readonly class="time" /> <a
					href="DeleteAvailability?id=<%=e.getEventid() %>"><svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="#552583" class="bi bi-trash" viewBox="0 0 16 16">
  <path
							d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
  <path
							d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
</svg></a><br />
				<%
                        }
                    }else{
                    	%>
				No time slots saved on Wednesday
				<%}
                %>
				<br />
				<br /> <label class="switch"> <input type="checkbox"
					name="Thursday" id="Thursday" onclick="myFunction1()"> <span
					class="slider round"></span>
				</label> Thursday<br />
				<button type="button" class="btn add-btn" data-toggle="modal"
					data-target="#exampleModalThursday" id="addth"
					style="display: none">+ Add</button>

				<%    if (!thu.isEmpty()) {
                        for (Event e : thu) {
                %>
				<input value="<%=e.getStarttime() %>" readonly class="time" /> - <input
					value=" <%=e.getEndtime() %>" readonly class="time" />
				<%=e.getStarttime() %>to
				<%=e.getEndtime() %>
				<a href="DeleteAvailability?id=<%=e.getEventid() %>"><svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="#552583" class="bi bi-trash" viewBox="0 0 16 16">
  <path
							d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
  <path
							d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
</svg></a><br />
				<%
                        }
                    }else{
                    	%>
				No time slots saved on Thursday
				<%}
                %>
				<br />
				<br /> <label class="switch"> <input type="checkbox"
					name="Friday" id="Friday" onclick="myFunction1()"> <span
					class="slider round"></span>
				</label> Friday<br />
				<button type="button" class="btn add-btn" data-toggle="modal"
					data-target="#exampleModalFriday" id="addfr" style="display: none">
					+ Add</button>
				<%    if (!fri.isEmpty()) {
                        for (Event e : fri) {
                %>
				<input value="<%=e.getStarttime() %>" readonly class="time" /> - <input
					value=" <%=e.getEndtime() %>" readonly class="time" /> <a
					href="DeleteAvailability?id=<%=e.getEventid() %>"><svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="#552583" class="bi bi-trash" viewBox="0 0 16 16">
  <path
							d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
  <path
							d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
</svg></a><br />
				<%
                        }
                    }else{
                    	%>
				No time slots saved on Friday
				<%}
                %>
				<br />
				<br /> <label class="switch"> <input type="checkbox"
					name="Saturday" id="Saturday" onclick="myFunction1()"> <span
					class="slider round"></span>
				</label> Saturday<br />
				<button type="button" class="btn add-btn" data-toggle="modal"
					data-target="#exampleModalSaturday" id="addsa"
					style="display: none">+ Add</button>
				<%    if (!sat.isEmpty()) {
                        for (Event e : sat) {
                %>
				<input value="<%=e.getStarttime() %>" readonly class="time" /> - <input
					value=" <%=e.getEndtime() %>" readonly class="time" /> <a
					href="DeleteAvailability?id=<%=e.getEventid() %>"><svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="#552583" class="bi bi-trash" viewBox="0 0 16 16">
  <path
							d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
  <path
							d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
</svg></a><br />
				<%
                        }
                    }else{
                    	%>
				No time slots saved on Saturday
				<%}
                %>
				<br />
				<br /> <label class="switch"> <input type="checkbox"
					name="Sunday" id="Sunday" onclick="myFunction1()"> <span
					class="slider round"></span>
				</label> Sunday<br />
				<button type="button" class="btn add-btn" data-toggle="modal"
					data-target="#exampleModalSunday" id="addsu" style="display: none">
					+ Add</button>
				<%    if (!sun.isEmpty()) {
                        for (Event e : sun) {
                %>
				<input value="<%=e.getStarttime() %>" readonly class="time" /> - <input
					value=" <%=e.getEndtime() %>" readonly class="time" /> <a
					href="DeleteAvailability?id=<%=e.getEventid() %>"><svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="#552583" class="bi bi-trash" viewBox="0 0 16 16">
  <path
							d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
  <path
							d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
</svg></a>
				<%
                        }
                    }else{
                    	%>
				No time slots saved on Sunday
				<%}
                %><br />
				<br />






				</form>


				<!-- Modal -->
				<div class="modal fade" id="exampleModalMonday" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content "
							style="background-color: #552583; border-radius: 20px; color: white;">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Set
									Available Time on Monday</h5>

							</div>
							<form
								action="SetAvailabilityServlet?day=mon&type=<%=availabilitytype %>"
								method="post">
								<div class="modal-body">
									<div class="row">

										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="starttime" id="form2Example13"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example13">Start Time</label>
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="endtime" id="form2Example15"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example15">End Time</label>
											</div>
										</div>
									</div>



								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>

									<button type="submit" class=" save-btn-2">Save</button>
								</div>
							</form>
						</div>
					</div>

				</div>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalTuesday" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content "
							style="background-color: #552583; border-radius: 20px; color: white;">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Set
									Available Time on Tuesday</h5>

							</div>
							<form
								action="SetAvailabilityServlet?day=tue&type=<%=availabilitytype %>"
								method="post">
								<div class="modal-body">

									<div class="row">

										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="starttime" id="form2Example13"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example13">Start Time</label>
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="endtime" id="form2Example15"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example15">End Time</label>
											</div>
										</div>
									</div>


								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
									<button type="submit" class=" save-btn-2">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModalWednesday" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content"
							style="background-color: #552583; border-radius: 20px; color: white;">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Set
									Available Time on Wednesday</h5>

							</div>
							<form
								action="SetAvailabilityServlet?day=wed&type=<%=availabilitytype %>"
								method="post">
								<div class="modal-body">

									<div class="row">

										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="starttime" id="form2Example13"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example13">Start Time</label>
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="endtime" id="form2Example15"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example15">End Time</label>
											</div>
										</div>
									</div>


								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
									<button type="submit" class=" save-btn-2">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModalThursday" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content"
							style="background-color: #552583; border-radius: 20px; color: white;">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Set
									Available Time on Thursday</h5>

							</div>
							<form
								action="SetAvailabilityServlet?day=thu&type=<%=availabilitytype %>"
								method="post">
								<div class="modal-body">

									<div class="row">

										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="starttime" id="form2Example13"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example13">Start Time</label>
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="endtime" id="form2Example15"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example15">End Time</label>
											</div>
										</div>
									</div>


								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
									<button type="submit" class=" save-btn-2">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModalFriday" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content"
							style="background-color: #552583; border-radius: 20px; color: white;">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Set
									Available Time on Friday</h5>

							</div>
							<form
								action="SetAvailabilityServlet?day=fri&type=<%=availabilitytype %>"
								method="post">
								<div class="modal-body">

									<div class="row">

										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="starttime" id="form2Example13"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example13">Start Time</label>
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="endtime" id="form2Example15"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example15">End Time</label>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
									<button type="submit" class=" save-btn-2">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>


				<!-- Modal -->
				<div class="modal fade" id="exampleModalSaturday" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content"
							style="background-color: #552583; border-radius: 20px; color: white;">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Set
									Available Time on Saturday</h5>

							</div>
							<form
								action="SetAvailabilityServlet?day=sat&type=<%=availabilitytype %>"
								method="post">
								<div class="modal-body">
									<div class="row">

										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="starttime" id="form2Example13"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example13">Start Time</label>
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="endtime" id="form2Example15"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example15">End Time</label>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>

									<button type="submit" class=" save-btn-2">Save</button>
								</div>
							</form>
						</div>
					</div>

				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModalSunday" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content"
							style="background-color: #552583; border-radius: 20px; color: white;">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Set
									Available Time on Sunday</h5>

							</div>
							<form
								action="SetAvailabilityServlet?day=sun&type=<%=availabilitytype %>"
								method="post">
								<div class="modal-body">

									<div class="row">

										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="starttime" id="form2Example13"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example13">Start Time</label>
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline mb-3">
												<input type="time" name="endtime" id="form2Example15"
													class="form-control form-control-lg" required /> <label
													class="form-label" for="form2Example15">End Time</label>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>

									<button type="submit" class=" save-btn-2">Save</button>
								</div>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenterFrnds" tabindex="-1"
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