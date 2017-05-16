<html lang="en">
<head>
<title>Lahore School System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tether.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="lssc.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/original-bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lssc.css">

<style>
.modal-loading {
	display: none;
	position: fixed;
	z-index: 1000;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	background: rgba(255, 255, 255, .8)
		url('http://i.stack.imgur.com/FhHRx.gif') 50% 50% no-repeat;
}

/* When the body has the loading class, we turn
   the scrollbar off with overflow:hidden */
body.loading {
	overflow: hidden;
}

/* Anytime the body has the loading class, our
   modal element will be visible */
body.loading .modal-loading {
	display: block;
}

.modal-footer-mine {
	padding: 15px;
	text-align: center;
	border-top: 1px solid #e5e5e5;
}

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
											</span> <input class="form-control" placeholder="Email" name="email" type="text" id=""
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
			//alert($('#clickme').val().length);
			if ($('#email').val() == "") {
				// var elId=element.attr('loginname');
				$('#email').addClass("redBorder");
				$('#logincheck')
						.html(
								'<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Warning!</strong> Username is required</div>');
				return false;
			} else if ($('#password').val() == "") {
				$('#password').addClass("redBorder");
				$('#logincheck')
						.html(
								'<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Warning!</strong> Password is required</div>');
				return false;
			} else {

				$('#logincheck').html("");
				return true;

			}
		}
		$("input").focus(function() {
			$('#' + this.id).removeClass("redBorder");
		});
	</script>
</body>
</html>

