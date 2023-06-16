<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String userid = "";
userid = (String) session.getAttribute("userid"); //login status
if (userid == null) {
	userid = "";
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Takits</title>
<link rel="icon" type="image/x-icon" href="images/takits_purple.png">
<style>
.yellow-bg {
	background-color: #fdb927;
}

.white-bg {
	width: 600px;
	background-color: white;
	color: #552583;
	padding: 30px;
	margin: 150px auto;
	border-radius: 20px;
	text-align: center;
}

.code {
	display: inline-block; background-color : #552583;
	color: white;
	padding: 10px 20px;
	font-size: 40px;
	border-radius: 20px;
	background-color: #552583; color : white; padding : 10px 20px;
	font-size : 40px; border-radius : 20px;
	margin: 20px 20px 30px 20px;
}

.continue {
	background-color: #552583;
	color: white;
	text-decoration: none;
	padding: 10px 20px;
	border-radius: 20px;
	margin: 20px;
}

a:link {
	text-decoration: none;
	margin: 20px;
}
</style>
</head>
<body class="yellow-bg">
	<div class="white-bg">
		<h1>Welcome!</h1>
		<h3>Mabuhay!</h3>
		<h3>Please save the code below</h3>

		<span class="code"><%=userid%></span><br /> <a class="continue"
			href="eventtypes.jsp">Continue</a>
	</div>
</body>
</html>