<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.dao.UserDao"%>
<%@page import="com.mvc.connection.DatabaseConnection"%>
<%@page import="com.mvc.bean.User"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.bean.Event"%>
<%@page import="com.mvc.dao.EventDao"%>
<%
String fullname = (String) session.getAttribute("fullname");
if (fullname == null) {
	fullname = "";
}
        String eventsetup =(String) session.getAttribute("eventsetup");
        if(eventsetup==null){
        	eventsetup="";
        }
        String partnerid =request.getParameter("id");
        if(partnerid==null){
        	partnerid="";
        }
        String type =request.getParameter("type");
        if(type==null){
        	type="";
        }
        if(!type.equals("")){
        	 request.getSession().setAttribute("type", type);
        }
        if(!partnerid.equals("")){
        	 request.getSession().setAttribute("partnerid", partnerid);
        }
        String partneridsess = "";
        partneridsess = (String) session.getAttribute("partnerid");
        if(partneridsess==null){
        	partneridsess="";
        }
        
        String typestatus = "";
        typestatus = (String) session.getAttribute("type");
        if(typestatus==null){
        	typestatus="";
        }
    	String userid = "";
        userid = (String) session.getAttribute("userid"); 
        if (userid == null) {
        	userid = "";
        	response.sendRedirect("login.jsp");
        }else{
        	 if(typestatus.equals("") || partneridsess.equals("")){
            	 request.getSession().setAttribute("error", "Please select a friend and an event type!");
            	response.sendRedirect("eventtypes.jsp");
            }else{
            	 request.getSession().setAttribute("error", "");
            }
        }
        UserDao userDao = new UserDao(DatabaseConnection.getConnection());
        User user = new User();
        user.setUser_id(userid);
        List<User> users = userDao.getUsersList(user);
        EventDao ed=new EventDao(DatabaseConnection.getConnection());
        
        List<Event> availabledays = ed.getAvailableDays(partneridsess,typestatus);
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
<script>
function selectlocation(that) {
    if (that.value == "In person") {
        document.getElementById("inperson").style.display = "block";
        document.getElementById("link").style.display = "none";
        document.getElementById("phone").style.display = "none";
        document.getElementById("additional").style.display = "none";
    } else if(that.value == "Link") {
        document.getElementById("link").style.display = "block";
        document.getElementById("phone").style.display = "none";
        document.getElementById("inperson").style.display = "none";
        document.getElementById("additional").style.display = "none";
    } else if(that.value == "Attendee phone number") {
        document.getElementById("phone").style.display = "block";
        document.getElementById("inperson").style.display = "none";
        document.getElementById("link").style.display = "none";
        document.getElementById("additional").style.display = "none";
    }  else if(that.value == "Additional inputs") {
        document.getElementById("additional").style.display = "block";
        document.getElementById("inperson").style.display = "none";
        document.getElementById("link").style.display = "none";
        document.getElementById("phone").style.display = "none";
    }else if(that.value == "Picking Durations") {
    	document.getElementById("inperson").style.display = "none";
        document.getElementById("link").style.display = "none";
        document.getElementById("phone").style.display = "none";
        document.getElementById("additional").style.display = "none";
    }
    else {
    	document.getElementById("inperson").style.display = "none";
        document.getElementById("link").style.display = "none";
        document.getElementById("phone").style.display = "none";
        document.getElementById("additional").style.display = "none";
    }
}
</script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
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

.thumbnail {
	border: 0;
	background: transparent;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.save-btn {
	background-color: #fdb927;
	border: none;
	color: white;
	padding: 4px 25px;
	border-radius: 15px;
}

.form-outline .form-control:focus ~.form-notch .form-notch-leading {
	border-top: .125rem solid black;
	border-bottom: .125rem solid black;
	border-left: .125rem solid black;
}

.form-outline .form-control:focus ~.form-notch .form-notch-trailing {
	border-top: .125rem solid black;
	border-right: .125rem solid black;
	border-bottom: .125rem solid black;
}

.form-outline .form-control:focus ~.form-notch .form-notch-middle {
	border-top: 0;
	border-bottom: .125rem solid black;
}

.form-outline .form-control ~.form-notch .form-notch-leading {
	border-radius: 10px 0 0 10px;
}

.form-outline .form-control ~.form-notch .form-notch-trailing {
	border-radius: 0px 10px 10px 0px;
}

.form-outline .form-control ~.form-notch .form-notch-leading {
	border-top: .125rem solid black;
	border-left: .125rem solid black;
	border-bottom: .125rem solid black;
}

.form-outline .form-control ~.form-notch .form-notch-trailing {
	border-top: .125rem solid black;
	border-right: .125rem solid black;
	border-bottom: .125rem solid black;
}

.form-outline .form-control ~.form-notch .form-notch-middle {
	border-top: .125rem solid black;
	border-bottom: .125rem solid black;
}

.form-label:active {
	background-color: red !important;
	color: black;
}

.event-type {
	margin: 5px 10px;
}

li {
	margin: auto;
}

.div-a {
	text-align: center;
	margin-top: 10px;
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

.error {
	text-align: center;
	padding: 15px;
	font-style: italic;
	color: red;
}

.yellow {
	color: #fdb927;
}
.dropdown-item{
vertical-align: bottom;
}
.dropdown-item:hover{
border-radius: 20px;
padding: 5px 20px;
}
.sign-out{
 position: absolute;
       bottom: 0;
 margin-left: auto;
 margin: 5px;
 font-style: italic;
}
.fullname{
margin: 10px;
font-style: italic;
}
.table-3 td, th {
	text-align: center;
	padding: 10px;
}
.btnview{
border: none;
margin: 10px;
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
						style="margin: 0 auto;" /> 	<div class="fullname"><%=fullname %></div><a href=""
						class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				
						<span class="fs-9 d-none d-sm-inline">Appoint your friends
							now by searching their for <span style="color: #fdb927;">username</span>
							and <span style="color: #fdb927;">personal code</span>
					</span>
					</a>
					<ul
						class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center "
						id="menu">
						<li class="nav-item"><a type="button" class="  pull-right"
							data-toggle="modal" data-target="#exampleModalCenter"> <img
								src="images/search.png" style="height: 40px;" /></a></li>
						<li class="nav-item event-type "><a href="eventtypes.jsp"
							class=" mb-1" style="padding: 0px;"> <i class="fs-4 bi-house"></i>
								<span class="ms-1 d-none d-sm-inline "><img
									src="images/eventtypes.png" height="35px" /></span>

						</a></li>

						<li class="event-type "><a href="bookings.jsp"
							class=" px-0 align-middle"> <i class="fs-4 bi-house"></i> <span
								class="ms-1 d-none d-sm-inline"><img
									src="images/bookings.png" height="31px" /></span>
						</a></li>
						<li class="event-type "><a href="createavailability.jsp"
							class="px-0 align-middle"> <i class="fs-4 bi-house"></i> <span
								class="ms-1 d-none d-sm-inline"><img
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
							 <li class="sign-out ">
							 	<a href="LogOutServlet" class="dropdown-item">Sign Out</a>
							
					</ul>


				</div>
			</div>
			<div class="col py-0 px-0">
				<div style="background-color: #E5E4E2; padding: 20px 0px 25px 40px;">
					<h1 style="color: #552583;">Event Setup</h1>


				</div>
				<div class="div-a">
					Person Selected:
					<%=partneridsess %>, Event Type:
					<%=typestatus %><br/>
					<button type="button" class=" pull-right btnview" data-toggle="modal"
							data-target="#viewAvailability"
							style="background-color: #552583; color: white; padding: 5px 20px; border-radius: 10px; margin-right: 5px;">
							View Availability</button>
					</div>
				<div class="error">
					<%=eventsetup %></div>
				<div
					style="background-color: #E5E4E2; margin: 10px 30px 30px 30px; padding: 30px; border-radius: 15px; overflow: hidden;">
					<form
						action="EventSetupServlet?partner=<%=partneridsess %>&eventtype=<%= typestatus%>"
						method="post" enctype="multipart/form-data">

						<div class="form-outline mb-3 ">
							<input type="text" name="title" required id="form2Example10"
								class="form-control" /> <label class="form-label"
								for="form2Example10">Title</label>
						</div>

						<div class="form-outline mb-3">

							<textarea rows="2" cols="12" id="description" name="description"
								id="form2Example11" class="form-control form-control-lg"></textarea>
							<label class="form-label" for="form2Example11">Description(optional)</label>
						</div>
						<div class="row">
							<div class="col-md-6 mb-2">
								<div class="form-outline mb-3">


									<input type="text" class="form-control datepicker"
										id="form2Example12" name="startdate" required> <label
										class="form-label" for="form2Example12">Start Date</label>
								</div>
							</div>
							<div class="col-md-6 mb-2">
								<div class="form-outline mb-3">
									<input type="time" name="starttime" id="form2Example13"
										class="form-control form-control-lg" required /> <label
										class="form-label" for="form2Example13">Start Time</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-2">
								<div class="form-outline mb-3">

									<input type="text" class="form-control datepicker"
										id="form2Example14" name="enddate" required> <label
										class="form-label" for="form2Example14">End Date</label>
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

						<div class="form-outline mb-3">
							<label for="form2Example16">Location</label> <select
								onchange="selectlocation(this);" required name="location"
								id="form2Example16" class="form-control form-control-lg">

								<option value="">Choose a Location</option>
								<option value="In person">In person</option>
								<option value="Link">Link</option>
								<option value="Attendee phone number">Attendee phone
									number</option>
								
								<option value="Additional inputs">Additional inputs</option>

							</select>
						</div>

						<div id="inperson" style="display: none;"
							class="form-outline mb-3">
							<textarea rows="2" cols="12" id="address " name="address"
								class="form-control form-control-lg"
								placeholder="Enter your address"></textarea>
							<br /> <label class="form-label" for="address">Address</label>
						</div>
						<div id="link" style="display: none;" class="form-outline mb-3">

							<input type="url" id="meetlink" name="link"
								class="form-control form-control-lg"
								placeholder="Enter your meet link"> <label
								class="form-label" for="meetlink">Link</label>
						</div>

						<div id="phone" style="display: none;" class="form-outline mb-3">
							<input type="number" name="contact" id="phoneno" value="0"
								class="form-control form-control-lg"
								placeholder="Enter your phone no" /> <label class="form-label"
								for="phoneno">Phone No</label>
						</div>


						<div id="additional" style="display: none;"
							class="form-outline mb-3">
							<textarea rows="2" cols="12" id="additionalinput"
								name="additionalinfo" class="form-control form-control-lg"
								placeholder="Enter additional information"></textarea>
							<label class="form-label" for="additionalinput">Additional
								Info</label>
						</div>
						<div class="form-outline mb-3">

							<label class="" for="form2Example16">Attach
								Media(optional)</label> <input type="file" name="file"
								id="form2Example16" class="form-control form-control-lg">

						</div>


						<div class="float-right">

							<a href="eventtypes.jsp" class=" pull-right"
								style="margin: 10px;">Cancel</a>
							<button type="submit" class="save-btn pull-right">Save</button>
						</div>


					</form>
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
	
	
		<!-- Modal -->
	<div class="modal fade" id="viewAvailability" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content"
				style="background-color: #552583; border-radius: 20px; color: white;">
				<div class="modal-header text-center">
					<h6 class="modal-title" id="exampleModalLongTitle">
					View Partner's  <span
							class="yellow">Availability</span></center>
					</h6>

				</div>
				<div class="modal-body">

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
					<%   
					List<Event> mon = ed.getAvailableTimeSlots(partneridsess,"mon",typestatus);
				    List<Event> tue = ed.getAvailableTimeSlots(partneridsess,"tue",typestatus);
				    List<Event> wed = ed.getAvailableTimeSlots(partneridsess,"wed",typestatus);
				    List<Event> thu = ed.getAvailableTimeSlots(partneridsess,"thu",typestatus);
				    List<Event> fri = ed.getAvailableTimeSlots(partneridsess,"fri",typestatus);
				    List<Event> sat = ed.getAvailableTimeSlots(partneridsess,"sat",typestatus);
				    List<Event> sun = ed.getAvailableTimeSlots(partneridsess,"sun",typestatus);
					if (!availabledays.isEmpty()) {
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
							</table>
					<%
					
					if(e.getMon().equals("yes")){
						  if(!mon.isEmpty()){
							  for(Event mo:mon){
								  %>
								Mon  <%=mo.getStarttime() %> - <%=mo.getEndtime() %><br/>
								  <%
							  }
						  }
					}
					if(e.getTue().equals("yes")){
						  if(!tue.isEmpty()){
							  for(Event tu:tue){
								  %>
								Tue  <%=tu.getStarttime()%> - <%=tu.getEndtime() %><br/>
								  <%
							  }
						  }
					}
					
					if(e.getWed().equals("yes")){
						  if(!wed.isEmpty()){
							  for(Event we:wed){
								  %>
								Wed  <%=we.getStarttime()%> - <%=we.getEndtime() %><br/>
								  <%
							  }
						  }
					}
					
					if(e.getThu().equals("yes")){
						  if(!thu.isEmpty()){
							  for(Event th:thu){
								  %>
								Thu  <%=th.getStarttime() %> - <%=th.getEndtime() %><br/>
								  <%
							  }
						  }
					}
	              
					
					if(e.getFri().equals("yes")){
						  if(!fri.isEmpty()){
							  for(Event fr:fri){
								  %>
								Fri  <%=fr.getStarttime()%> - <%=fr.getEndtime() %><br/>
								  <%
							  }
						  }
					}
					
					if(e.getSat().equals("yes")){
						  if(!sat.isEmpty()){
							  for(Event sa:sat){
								  %>
								Sat  <%=sa.getStarttime() %> - <%=sa.getEndtime() %><br/>
								  <%
							  }
						  }
					}
	              
					
					if(e.getSun().equals("yes")){
						  if(!sun.isEmpty()){
							  for(Event su:sun){
								  %>
								Sun  <%=su.getStarttime()%> - <%=su.getEndtime() %><br/>
								  <%
							  }
						  }
					}
					
				
					
					
                        }
                }else{
                %>
              This person has not yet set their availability.
                <%
                }
                %>
                

				
					
					<br />
				</div>

			</div>
		</div>
	</div>
	
	
	<script src="js/script.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>
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