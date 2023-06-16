<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
    String status1 = "";
    status1 = (String) session.getAttribute("regstatus"); //login status
    if (status1 == null) {
        status1 = "";
    }

%>
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
<style>
.form-outline .form-control:focus ~.form-notch .form-notch-middle {
	border-top: 0;
}

.form-outline .form-control ~.form-notch .form-notch-leading {
	border-radius: 10px 0 0 10px;
}

.form-outline .form-control ~.form-notch .form-notch-trailing {
	border-radius: 0px 10px 10px 0px;
}

.form-control {
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
}

.form-rounded {
	border-radius: 5rem;
}

.status {
	color: red;
	margin: 10px;
}
</style>
</head>
<body>

	<section class="vh-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6 text-black">

					<div class="px-5 ms-xl-4">
						<i class=" fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>

					</div>

					<div
						class="d-flex align-items-center h-custom-2 px-5 ms-xl-5 mt-5 pt-5 pt-xl-0 "
						style="text-align: center; padding-left: 20px;">

						<form action="LoginServlet" method="post" style="width: 28rem;"
							class="align-items-center">

							<h3 class="fw-normal mb-3 pb-3 mt-5"
								style="letter-spacing: 32px;">
								<b><span style="color: #552583;">MABU</span><span
									style="color: #fdb927">HAY!</span></b>
							</h3>

							<div class="status"><%=status1 %></div>
							<div class="form-outline mb-4">
								<input type="text" placeholder="johndoe123" name="username"
									required id="form2Example18"
									class="form-control form-control-lg" /> <label
									class="form-label" for="form2Example18">Email or
									Username</label>
							</div>

							<div class="form-outline mb-4">
								<input type="password" placeholder="Password" name="password"
									required id="form2Example28"
									class="form-control form-control-lg form-rounded"
									style="border-radius: 3px;" /> <label class="form-label"
									for="form2Example28">Password</label>
							</div>

							<div class="pt-1 mb-4">
								<button class="btn btn-info btn-lg btn-block " type="submit"
									style="border-radius: 30px; background-color: #fbd927; color: black;">Log
									in</button>
							</div>

							
							<p>
								<a href="register.jsp" class="link-info">Don't have an
									account?</a>
							</p>

						</form>

					</div>

				</div>
				<div class="col-sm-6 px-0 d-none d-sm-block">
					<img src="images/logo.png" alt="Login image" class="w-100 vh-100"
						style="object-position: left;">
				</div>
			</div>
		</div>
	</section>

	<!-- MDB -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>
</body>
</html>