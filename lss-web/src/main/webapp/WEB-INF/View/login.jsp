<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Lahore School System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tether.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/toastr.min.js"></script>
<link rel="stylesheet" type="text/css" href="lssc.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/original-bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lssc.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/toastr.min.css">

<style>
.redBorder {
	border-color: red;
}
</style>
</head>
<body background="${pageContext.request.contextPath}/resources/img/background.jpg" style="background-size: cover;">
	<div align="center">
		<img src="${pageContext.request.contextPath}/resources/img/lss-logo.png" alt="LSS" style="margin-top:90px;"/>
	</div>
	<div class="container" id="registerData">
		<div class="row" id="pwd-container">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<section class="login-form" style="padding-top: 40px;">
					<form id="login" method="post" action="j_spring_security_check" onsubmit="return myFunction()">
						<div align="center" style="padding-bottom: 20px;">
							<img src="${pageContext.request.contextPath}/resources/img/lss-logo2-300.png" alt="LSS" height="150" width="150" style="margin-bottom:10px;" />
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div id="logincheck"></div>
								<div class="form-group">
									<div class="input-group">
											<span class="input-group-addon"> <i
												class="glyphicon glyphicon-user"></i>
											</span> <input class="form-control" placeholder="Email" name="email" type="text" id="email"
												autofocus data-toggle="tooltip" data-placement="bottom" title="Enter Email">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"> <i
											class="glyphicon glyphicon-lock"></i>
										</span> <input class="form-control" placeholder="Password"
											type="password" name="password" id="password"
											data-toggle="tooltip" data-placement="bottom"
											title="Enter Password">
									</div>
								</div>
								<div class="form-group">
									<input type="submit" id="subbtn"
										class="btn btn-lg btn-primary btn-block" value="Login"
										data-toggle="tooltip" data-placement="bottom"
										title="Click Here To Login">
								</div>
							</div>
						</div>
					</form>

					<c:choose>
						<c:when test="${not empty error}">
							<script type="text/javascript">
								toastr.error("${msg}", "Error!", {
									"timeOut" : "3000",
									"progressBar" : true,
									"extendedTImeout" : "0"
								});
							 </script>
						</c:when>
						
						<c:when test="${not empty logout}">
							<script type="text/javascript">
								toastr.warning("${logoutMsg}", "", {
									"timeOut" : "3000",
									"progressBar" : true,
									"extendedTImeout" : "0"
								});
							 </script>
						</c:when>
						
					</c:choose>

				</section>
			</div>
		</div>
	</div>

	<input type="hidden" value="" id="hiddenPwd" />

	<!-- ...........................SCRIPT.............................. -->

	<script>
		$("#forgotpassword").click(function() {
			$("#hiddenPwd").val("forgot");
			//alert($("#hiddenPwd").val());
		});

		$("#cancel").click(function() {
			$("#hiddenPwd").val("");
			//alert($("#hiddenPwd").val());
		});

		function myFunction() {
			if ($('#email').val() == "") {
				$('#email').addClass("redBorder");
				toastr.error("Please enter email address.", "Error!", {
		              "timeOut": "3000",
		              "progressBar": true,           
		              "extendedTImeout": "0"
		          });
				return false;
			} else if ($('#password').val() == "") {
				$('#password').addClass("redBorder");
				toastr.error("Please Enter the password.", "Error!", {
		              "timeOut": "3000",
		              "progressBar": true,           
		              "extendedTImeout": "0"
		          });
				return false;
			} else {
				return true;
			}
		}
		$("input").focus(function() {
			$('#' + this.id).removeClass("redBorder");
		});

	</script>
</body>
</html>

