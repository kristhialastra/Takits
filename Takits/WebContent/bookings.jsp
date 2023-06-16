<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.dao.EventDao"%>
<%@page import="com.mvc.dao.UserDao"%>
<%@page import="com.mvc.bean.User"%>
<%@page import="com.mvc.connection.DatabaseConnection"%>
<%@page import="com.mvc.bean.Event"%>
<%@page import="java.util.List"%>
<%
    String eventsetup =(String) session.getAttribute("bookings");
    if(eventsetup==null){
    	eventsetup="";
    }
    String userid = "";
    userid = (String) session.getAttribute("userid"); //login status
    if (userid == null) {
    	userid = "";
    	response.sendRedirect("login.jsp");
    }
    System.out.println(userid);
    EventDao eventDao=new EventDao(DatabaseConnection.getConnection());
    Event event=new Event();
    event.setUser_id(userid);
    List<Event> upcoming = eventDao.getUpcomingBookings(event);
    List<Event> past = eventDao.getPastBookings(event);
    List<Event> rescheduled = eventDao.getRescheduledBookings(event);
    List<Event> cancelled = eventDao.getCancelledBookings(event);

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
.notifications {
	margin: 10px auto;
	color: white;
}

a:link, a:visited {
	color: black;
}
.fullname{
margin: 10px;
font-style: italic;
}
.takits-logo {
	margin: 40px 40px 10px 40px;
}

.frnds-list {
	padding: 4px 20px 4px 20px;
	margin: 5px;
	background-color: #fdb927;
	display: inline-block;
	border-radius: 15px;
	color: black;
	font-weight: bolder;
}

#myInput {
	margin-bottom: 10px;
}

.error {
	text-align: center;
	font-style: italic;
	color: red;
	padding-bottom: 20px;
}

.yellow {
	color: #fdb927;
}

.table-2 td {
	padding: 20px;
	text-align: center;
}

.table-row {
	background-color: #E5E4E2;
	margin: 5px;
	border-radius: 15px;
}

.table-2 {
	margin: auto;
}

tr:first-child td:first-child {
	border-top-left-radius: 25px;
}

tr:first-child td:last-child {
	border-top-right-radius: 25px;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 25px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 25px;
}

.event-info {
	font-weight: bolder;
	text-align: left;
}

.nav-link {
	color: #552583;
}

.r-btn {
	background-color: #fdb927;
	border: none;
	color: white;
}

.r-btn:hover {
	background-color: #fdb927;
	border: none;
	color: white;
	font-weight: bolder;
}
.dropdown-item{
vertical-align: bottom;
font-weight: bolder;
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
						style="margin: 0 auto;" /><div class="fullname">Hello, <%=fullname %>!</div><a href=""
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
							class="nav-link" style="padding: 0px;"> <i
								class="fs-4 bi-house"></i> <span
								class="ms-1 d-none d-sm-inline "><img
									src="images/eventtypes2.png" height="47px" /></span>

						</a></li>

						<li><a href="bookings.jsp" class="nav-link px-0 align-middle">
								<i class="fs-4 bi-house"></i> <span
								class="ms-1 d-none d-sm-inline"><img
									src="images/bookings2.png" height="41px" /></span>
						</a></li>
						<li><a href="createavailability.jsp"
							class="nav-link px-0 align-middle"> <i class="fs-4 bi-house"></i>
								<span class="ms-1 d-none d-sm-inline mx-2"><img
									src="images/availability.png" height="30px" /></span>
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
							 </li>
							 <br>
							  <li class="sign-out ">
							 	<a href="LogOutServlet" class="dropdown-item">Sign Out</a>
					</ul>
					<hr>

				</div>
			</div>
			<div class="col py-0 px-0">
				<div style="background-color: #E5E4E2; padding: 20px 0px 25px 40px;">
					<h1 style="color: #552583;">Bookings</h1>
					See upcoming and past events booked through your event types.
					
			

				</div>
				<div style="padding: 40px;">
					<div class="error"><%=eventsetup %></div>
					<ul class="nav nav-pills mb-3 text-center" id="pills-tab"
						role="tablist" style="display: flex; justify-content: center;">
						<li class="nav-item" role="presentation">
							<button class="nav-link active " id="pills-upcoming-tab"
								data-bs-toggle="pill" data-bs-target="#pills-upcoming"
								type="button" role="tab" aria-controls="pills-home"
								aria-selected="true">Upcoming</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link " id="pills-past-tab"
								data-bs-toggle="pill" data-bs-target="#pills-past" type="button"
								role="tab" aria-controls="pills-profile" aria-selected="false">Past</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="pills-rescheduled-tab"
								data-bs-toggle="pill" data-bs-target="#pills-rescheduled"
								type="button" role="tab" aria-controls="pills-contact"
								aria-selected="false">Rescheduled</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="pills-cancelled-tab"
								data-bs-toggle="pill" data-bs-target="#pills-cancelled"
								type="button" role="tab" aria-controls="pills-contact"
								aria-selected="false">Cancelled</button>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-upcoming"
							role="tabpanel" aria-labelledby="pills-upcoming-tab">

							<table class="table-2">
								<%    if (!upcoming.isEmpty()) {
                        for (Event e : upcoming) {
                %>

								<tr class="table-row">

									<td><%=e.getStart() %> - <%=e.getEnd() %></td>
									<td class="event-info"><%=e.getEventtype() %> between <%=e.getFullname() %>
										<%
             
              
               String usersname = userDao.getUsersName(e);
                %> and <%= usersname %> <br />Title: <%=e.getTitle() %>


										<br /> Description: <%=e.getDescription() %></td>

									<td>
										<button type="button" class="btn r-btn" data-toggle="modal"
											data-target="#exampleModalCenter">Reschedule</button> <!-- Modal -->
										<div class="modal fade" id="exampleModalCenter" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalCenterTitle"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content"
													style="background-color: #552583; border-radius: 20px; color: white;">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLongTitle">Request
															Reschedule</h5>

													</div>
													<div class="modal-body">

														<% 
String requestedto="";
if(userid.equals(e.getOrganizer() )){
	requestedto= e.getUser_id();
}else{
	requestedto=e.getOrganizer();
}
%>

														<form
															action="RescheduleBookingServlet?id=<%=e.getEventid() %>&requested=<%=requestedto %>"
															method="post">
															<div class="modal-body">
																<div class="form-outline mb-3">
																	<textarea rows="2" cols="12" name="reason"
																		placeholder="Enter reason for rescheduling"
																		class="form-control" required></textarea>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-danger"
																	data-dismiss="modal">Close</button>
																<button type="submit" class="btn r-btn">Save
																	changes</button>
															</div>
														</form>
													</div>
												</div>
											</div>
									</td>
									<td>
										<button type="button" class="btn btn-danger"
											data-toggle="modal" data-target="#exampleModalCenter-2">
											Cancel</button> <!-- Modal -->
										<div class="modal fade" id="exampleModalCenter-2"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content"
													style="background-color: #552583; border-radius: 20px; color: white;">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLongTitle">Are
															you sure you want to cancel this meet?</h5>

													</div>
													<% 

if(userid.equals(e.getOrganizer() )){
	requestedto= e.getUser_id();
}else{
	requestedto=e.getOrganizer();
}
%>

													<form
														action="CancelBookingServlet?id=<%=e.getEventid() %>&requested=<%=requestedto %>&purpose=Cancelling"
														method="post">
														<div class="modal-body">
															Canceling this meet cannot be undone <br />
															<div class="form-outline mb-3">

																<textarea rows="2" cols="12" name="reason"
																	placeholder="Enter reason for cancelling"
																	class="form-control" required></textarea>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn r-btn"
																data-dismiss="modal">Close</button>


															<button type="submit" class="btn btn-danger ">Cancel</button>

														</div>
													</form>
												</div>
											</div>
										</div>


									</td>
								</tr>






								<%
                        }
                    }else{
                    	
                   
                %>
								<div style="text-align: center;">No upcoming meetings</div>
								<%
                    }
                %>
							</table>

						</div>
						<div class="tab-pane fade" id="pills-past" role="tabpanel"
							aria-labelledby="pills-past-tab">

							<table class="table-2">
								<%    if (!past.isEmpty()) {
                        for (Event p : past) {
                %>

								<tr class="table-row">
									<td><%=p.getStart() %> - <%=p.getEnd() %></td>
									<td class="event-info"><%=p.getEventtype() %> between <%=p.getFullname() %>
										<%
             
              
               String usersname = userDao.getUsersName(p);
                %> and <%= usersname %> <br />Title: <%=p.getTitle() %>


										<br /> Description: <%=p.getDescription() %></td>
								</tr>



								<%
                        }
                    }else{
                    	
                   
                %>
								<div style="text-align: center;">No past meetings</div>
								<%
                    }
                %>
							</table>
						</div>
						<div class="tab-pane fade" id="pills-rescheduled" role="tabpanel"
							aria-labelledby="pills-rescheduled-tab">
							<table class="table-2">
								<%    if (!rescheduled.isEmpty()) {
                        for (Event e : rescheduled) {
                %>

								<tr class="table-row">
									<td><%=e.getStart() %> - <%=e.getEnd() %></td>
									<td class="event-info"><%=e.getEventtype() %> between <%=e.getFullname() %>
										<%
             
              
               String usersname = userDao.getUsersName(e);
                %> and <%= usersname %> <br />Title: <%=e.getTitle() %>


										<br /> Description: <%=e.getDescription() %></td>
									<td><%=e.getStatus() %></td>
									<td><%=e.getReason() %></td>
								</tr>



								<%
                        }
                    }else{
                    	
                   
                %>
								<div style="text-align: center;">No Rescheduled meetings</div>
								<%
                    }
                %>
							</table>
						</div>
						<div class="tab-pane fade" id="pills-cancelled" role="tabpanel"
							aria-labelledby="pills-cancelled-tab">

							<table class="table-2">
								<%    if (!cancelled.isEmpty()) {
                        for (Event e : cancelled) {
                %>

								<tr class="table-row">
									<td><%=e.getStart() %> - <%=e.getEnd() %></td>
									<td class="event-info"><%=e.getEventtype() %> between <%=e.getFullname() %>
										<%
             
              
               String usersname = userDao.getUsersName(e);
                %> and <%= usersname %> <br />Title: <%=e.getTitle() %>


										<br /> Description: <%=e.getDescription() %></td>
									<td><%=e.getReason() %></td>
								</tr>

								<!-- Button trigger modal -->



								<%
                        }
                    }else{
                    	
                   
                %>
								<div style="text-align: center;">No cancelled meetings</div>
								<%
                    }
                %>
							</table>
						</div>
					</div>

				</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
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

</body>
</html>