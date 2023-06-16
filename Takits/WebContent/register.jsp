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
</style>
</head>
<body>





	<section class="vh-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6 px-0 d-none d-sm-block">
					<img src="images/signup.png" alt="Login image" class="w-100 vh-100"
						style="object-position: left;">
				</div>
				<div class="col-sm-6 text-black">



					<div
						class="d-flex align-items-center h-custom-2 px-5 ms-xl-5 mt-2 pt-5 pt-xl-0 "
						style="text-align: center; padding-left: 20px;">

						<form action="registerServlet" method="post" style="width: 30rem;">
							<h3></h3>
							<h3 class="fw-normal mb-3 pb-3 " style="letter-spacing: 2px;">
								<b><span style="color: #552583;">SIGN </span><span
									style="color: #fdb927"> UP</span></b>
							</h3>
							<h6 class="fw-normal mb-3 pb-3 " style="letter-spacing: 2px;"><%= status1 %></h6>

							<div class="form-outline mb-3">
								<input type="email" placeholder="johndoe@gmail.com" name="email"
									required id="form2Example18"
									class="form-control form-control-lg" /> <label
									class="form-label" for="form2Example18">Enter your
									email to get started</label>
							</div>
							<div class="form-outline mb-3">
								<input type="text" placeholder="John Doe" name="fullname"
									required id="form2Example18"
									class="form-control form-control-lg" /> <label
									class="form-label" for="form2Example18">Enter your full
									name</label>
							</div>
							<div class="form-outline mb-3">
								<input type="tel" placeholder="9876543210" name="contact"
									pattern="[0-9]{10}" required id="form2Example18"
									class="form-control form-control-lg" /> <label
									class="form-label" for="form2Example18">Enter Contact
									No</label>
							</div>
							<div class="form-outline mb-3">
								<input type="text" placeholder="johndoe123" name="username"
									required id="form2Example18"
									class="form-control form-control-lg" /> <label
									class="form-label" for="form2Example18">Enter a
									Username</label>
							</div>

							<div class="row">
								<div class="col-md-6 mb-2">
									<div class="form-outline mb-2">
										<input type="password" placeholder="Password" name="password"
											pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,15}$"
											required id="form2Example28"
											class="form-control form-control-lg form-rounded"
											style="border-radius: 3px;" /> <label class="form-label"
											for="form2Example28">Choose a Password</label>
									</div>
								</div>
								<div class="col-md-6 ">
									<div class="form-outline ">
										<input type="password" placeholder="Re-Enter Password"
											name="password2"
											pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,15}$"
											required id="form2Example28"
											class="form-control form-control-lg form-rounded"
											style="border-radius: 3px;" /> <label class="form-label"
											for="form2Example28">Confirm Password</label>
									</div>
								</div>
							</div>
							<div class=" mb-3">
								<img src="images/password.png" style="height: 80px;"
									class="mb-4 d-flex justify-content-between" />
								<button class="btn btn-info btn-lg btn-block " type="submit"
									style="border-radius: 10px; background-color: #552583;">Continue</button>
							</div>


							<p>
								<a href="login.jsp" class="link-info">Already have an
									account?</a>
							</p>

						</form>

					</div>

				</div>

			</div>
		</div>
	</section>

	<!-- MDB -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>
</body>
</html>