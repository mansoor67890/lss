<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
body {
	background-color: #eeeeee;
}

.Absolute-Center {
	margin: auto;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
}

.Absolute-Center.is-Responsive {
	width: 50%;
	height: 50%;
	min-width: 200px;
	max-width: 400px;
	padding: 40px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/SP_SC_Hibernate">Home</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<li class="page-scroll"><a href="login">Login</a></li>
			</ul>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="Absolute-Center">
				<div class="col-sm-4 col-md-6 col-md-offset-1">
					<!-- For showing error -->
					<div id="embed"></div>

					<div class="panel panel-default" action="a.jsp">
						<div class="panel-heading">
							<div class="text-center">
								<h2>Sign up</h2>
							</div>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<label for="inputName" class="col-sm-3 control-label">Name</label>
									<div class="col-sm-9">
										<input class="form-control" id="name"
											placeholder="Enter your full name" required="true"
											type="text">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail" class="col-sm-3 control-label">Email</label>
									<div class="col-sm-9">
										<input class="form-control" id="email"
											placeholder="Enter your Email address" required="true"
											type="email">
									</div>
								</div>

								<div class="form-group">
									<label for="inputPassword1" class="col-sm-3 control-label">Password</label>
									<div class="col-sm-9">
										<input class="form-control" id="password"
											placeholder="Password" required="true" type="password">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword2" class="col-sm-3 control-label">Confirm
										Password</label>
									<div class="col-sm-9">
										<input class="form-control" id="cpassword"
											placeholder="Password" required="true" type="password">
									</div>
								</div>

								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-success btn-sm">Sign up</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


		function signup() {
			var userId = null;
			//alert("im here");

			name = $('#name').val();
			pass = $('#password').val();
			pass2 = $('#cpassword').val();
			email = $('#email').val();
			/* if (name == "" || pass == "" || email == "") {
				//alert("Please enter username password email");
				//$('.alert').show();
				$("#embed").html("<div class='alert alert-warning alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><p>Please fill all fields!</p></div>");	
				return;
			} 

			if (pass.length < 8 || pass2.length < 8) {
				$("#embed").html("<div class='alert alert-warning alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><p>Password must be 8 characters long!</p></div>");
				//alert("password must be 8 characters long");
				return;
			}
			*/
			if (pass != pass2) {
				$("#embed").html("<div class='alert alert-danger' role='alert'><p>passwords are not same!</p></div>");
				//alert("passwords are not same");
				return;
			}

			
			/*
			* Use CryptoJs Sha1 function
			* to get hash of the password
			*var userdata = {
			username : $('#name').val(),
			password : $('#password').val(),
			user_email : $('#email').val(),
			enabled : true
		};

		var userDataJson = JSON.stringify(userdata);
		//alert(userDataJson);	
		var userDataUri = "https://localhost:8443/SP_SC_Hibernate/api/users/adduser";

		$.ajax({
			type : "POST",
			url : userDataUri,
			data : userDataJson,
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				//	alert("userUploadDone");
				userId = JSON.parse(data);
				//	alert(userId);
				addprofile(userId);
				//alert("I'm back");
				addRole(userId);
			},
			error : function(data) {
				//	alert("error");
				userId = Json.parse(data);
				//		alert(userId);

			}
		});
	}

	function addprofile(a) {
		var profiledata = {
			"location" : $('#country').val(),
			"state" : $('#state').val(),
			"country" : $('#country').val(),
			"organization" : $('#organization').val(),
			"organizational_Unit" : $('#organization').val(),
			"userid" : a,
			"common_Name" : $('#name').val()
		};
		var profileDataJson = JSON.stringify(profiledata);
		//alert(profileDataJson);
		//var finalObj = $.extend(userId, profileData);
		//alert(finalObj);
		var profileDataUri = "https://localhost:8443/SP_SC_Hibernate/api/users/addprofile";

		$.ajax({
			type : "POST",
			url : profileDataUri,
			data : profileDataJson,
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				//	alert("prrofile Success");
				//var headers = data.getAllResponseHeaders().toLowerCase();
				//	alert(data);
				//alert("profileSuccess");
			},
			error : function() {
				//	alert("error");
			}
		});
	}

	function addRole(userId) {
		var userRole = {
			role : "ROLE_USER"
		};
		userRole = JSON.stringify(userRole);
		var roleUrl = "https://localhost:8443/SP_SC_Hibernate/api/users/"
				+ userId + "/addUserRole";
		$.ajax({
					type : "POST",
					url : roleUrl,
					data : userRole,
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						//alert("Success");
						//var headers = data.getAllResponseHeaders().toLowerCase();
						//alert(data);
						window.location
								.assign("https://localhost:8443/SP_SC_Hibernate/login")
					},
					error : function() {
						//	alert("error");
						window.location
								.assign("https://localhost:8443/SP_SC_Hibernate/login");
					}
				});
	}
			*/
			
		 	/* var pass3=$('#password').val();
			var password1=CryptoJS.SHA1(pass3);
			var hash=password1.toString(CryptoJS.enc.Base64);
			 */
			
	</script>
</body>
</html>