<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.dao.UserDao"%>
<%@page import="com.mvc.connection.DatabaseConnection"%>
<%@page import="com.mvc.bean.User"%>
<%@page import="java.util.List"%>

<%
	String userid = "";
userid = (String) session.getAttribute("userid"); //login status
if (userid == null) {
	userid = "";
	response.sendRedirect("login.jsp");
}

UserDao userDao = new UserDao(DatabaseConnection.getConnection());
User user = new User();
user.setUser_id(userid);
List<User> users = userDao.getUsersList(user);

String id = request.getParameter("id");
if (id == null) {
	id = "";
}

String fullname = (String) session.getAttribute("fullname");
if (fullname == null) {
	fullname = "";
}
String name = request.getParameter("name");
if (name == null) {
	name = "";
}

String error = "";
error = (String) session.getAttribute("error"); //login status
if (error == null) {
	error = "";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Takits</title>
<link rel="icon" type="image/x-icon" href="images/takits_purple.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<style>
.event-type {
	background-color: #E5E4E2;
	padding: 20px 50px;
	margin: 15px 40px;
	border-radius: 20px;
}

a:link, a:visited {
	color: black;
	font-weight: bolder;
	text-align: center;
	text-decoration: none;
}

.selected-frnd {
	margin: 0px;
	padding: 20px 0px 0px 0px;
	text-align: center;
	font-style: italic;
}

.red-color {
	color: red;
}

.purple {
	color: #552583;
}

.yellow {
	color: #fdb927;
}

.frnds-list {
	padding: 4px 20px 4px 20px;
	margin: 5px;
	background-color: #fdb927;
	display: inline-block;
	border-radius: 15px;
}

li {
	margin: auto;
}

.notifications {
	margin: 10px auto;
	color: white;
	font-weight: normal;
	font-weight: lighter;
}

.notifications:hover {
	text-decoration: underline;
}

.takits-logo {
	margin: 40px 40px 10px 40px;
}

#myInput {
	margin-bottom: 10px;
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
</head>
<body>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 "
				style="background-color: #552583;">
				<div class=" px-1 pt-2 text-white min-vh-100 "
					style="text-align: center;">

					<img src="images/takits.png" style="height: 60px;"
						class="img-responsive center-block takits-logo"
						style="margin: 0 auto;" /> 
					<br/><div class="fullname">Hello, <%=fullname %>!</div>
						<a href=""
						class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
						<span class="fs-9 d-none d-sm-inline">Appoint your friends
							now by searching their for <span style="color: #fdb927;">username</span>
							and <span style="color: #fdb927;">personal code</span>
					</span>
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
									src="images/eventtypes.png" height="35px" /></span>

						</a></li>

						<li><a href="bookings.jsp" class="nav-link px-0 align-middle">
								<i class="fs-4 bi-house"></i> <span
								class="ms-1 d-none d-sm-inline"><img
									src="images/bookings.png" height="31px" /></span>
						</a></li>
						<li><a href="createavailability.jsp"
							class="nav-link px-0 align-middle"> <i class="fs-4 bi-house"></i>
								<span class="ms-1 d-none d-sm-inline"><img
									src="images/availability.png" height="31px" /></span>
						</a></li>
						<li class="notifications"><a href="notifications.jsp"><i>
									<span style="color: white;"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16"
											class="nav-link px-0 align-middle ms-1 d-none d-sm-inline">
  <path
												d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
</svg> Notifications</span>
							</i></a></li>
							<br>
							 <li class="sign-out ">
							 	<a href="LogOutServlet" class="dropdown-item">Sign Out</a>
							 </li>
					</ul>
					<hr>
		

				</div>
			</div>
			<div class="col py-0 px-0">
				<div style="background-color: #E5E4E2; padding: 20px 0px 25px 40px;">
					<h1 style="color: #552583;">Event Types</h1>
					Create events to share for people to book on your calendar.
					<!-- Button trigger modal -->
					<div class="float-right" style="display: inline-block;">
						<button type="button" class="btn  pull-right" data-toggle="modal"
							data-target="#exampleModalCenter"
							style="background-color: #552583; color: white; padding: 5px 20px; border-radius: 10px; margin-right: 50px;">
							+ New Appointment</button>
					
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
												<svg style="color: black;"
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-person-fill"
													viewBox="0 0 16 16">
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
				<%if(!name.isEmpty()){
					%>

				<div class="selected-frnd">
					Selected Friend:
					<%=id%>
					<%=name%>
				</div>
				<%}else{
	%>
				<div class="selected-frnd">No friend selected</div>
				<%} %>
				<div class="selected-frnd red-color">
					<%=error%><br />
				</div>
				<div class="event-type">
					<a href="eventsetup.jsp?type=Brainstorming&id=<%=id%>">Brainstorming</a>
				</div>
				<div class="event-type">
					<a href="eventsetup.jsp?type=Chat w/ friends&id=<%=id%>">Chat
						w/ friends</a>
				</div>
				<div class="event-type">
					<a href="eventsetup.jsp?type=Corporate Meeting&id=<%=id%>">Corporate
						Meeting</a>
				</div>
				<div class="event-type">
					<a href="eventsetup.jsp?type=Deal Negotiation&id=<%=id%>">Deal
						Negotiation</a>
				</div>
				<div class="event-type">
					<a href="eventsetup.jsp?type=Class&id=<%=id%>">Class</a>
				</div>

			</div>
		</div>
	</div>




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

	<script src="js/script.js"></script>
</body>
</html>