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

body {
	background-image:
		url("${pageContext.request.contextPath}/resources/img/background.jpg");
	style ="background-size: cover";
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
	<div align="center"><img src="${pageContext.request.contextPath}/resources/img/lss-logo.png" alt="LSS" /></div>
		<div class="container" id="registerData">
			<div class="row" id="pwd-container">
				<div class="col-md-4"></div>
				<div class="col-md-4">
			
		</div>
		
<!-- ----------------------------------- modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" data-toggle="tooltip" data-placement="bottom" title="Click Here To Close">&times;</button>
		<h4 class="modal-title" align="center">Identification</h4>
	</div>
<div class="modal-body">
	<div id="alert"></div>
		<input type="password" autofocus name="password" id="pinReg" tabindex="2" class="form-control" minlength = "4" maxlength="4" placeholder="Enter Pin Code" data-toggle="tooltip" data-placement="bottom" title="Enter Your Pin Number">
</div>
	<div class="modal-footer-mine">
			<button type="submit" class="btn btn-primary btn-md" value="Sign in" id="subid" data-toggle="tooltip" data-placement="bottom" title="Click To Identification" >OK</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" id="cancel" data-toggle="tooltip" data-placement="bottom" title="Click To Cancel">Cancel</button>
	</div>
		</div>
	</div>
</div>
	</div>
		
			</div>
			
			<input type="hidden" value="" id="hiddenPwd"/>
			
				

<!-- ...........................SCRIPT.............................. -->


<script type="text/javascript">

$body = $("body");

$(document).on({
    ajaxStart: function() { $body.addClass("loading");    },
     ajaxStop: function() { $body.removeClass("loading"); }    
});

</script>

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
		if ($('#loginname').val() == "") {
			// var elId=element.attr('loginname');
			$('#loginname').addClass("redBorder");
			$('#logincheck')
					.html(
							'<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Warning!</strong> Username is required</div>');
			return false;
		} else if ($('#loginpassword').val() == "") {
			$('#loginpassword').addClass("redBorder");
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

	$('#subid')
			.click(
					function() {
						if ($('#pinReg').val() == '') {
							$('#pinReg').addClass("redBorder");

							$('#alert')
									.html(
											'<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Warning!</strong>You cannot left this field empty</div>');
							//alert('Input can not be left blank');
						} else {
							var url = "registerAction.action";
							if ($("#hiddenPwd").val() != "") {
								url = "forgotPassword.action";
							}
							$('#logincheck').html("");
							var pinCode = $('#pinReg').val();
							$
									.ajax({
										"url" : url,
										"type" : "post",
										"data" : {
											"pinCode" : pinCode
										},
										"success" : function(response) {
											//alert(response);
											if (response == 'createAcc') {
												$('body').removeClass(
														'modal-open');
												$('.modal-backdrop').remove();
												window.location = "createAccount.jsp";
												//if ($('#forgotpassword').click(function()){
												//window.location = "forgot.jsp";}
											} else if (response == 'forgotpassword') {
												$('body').removeClass(
														'modal-open');
												$('.modal-backdrop').remove();
												//window.location = "createAccount.jsp";
												//if ($('#forgotpassword').click(function()){
												window.location = "forgot.jsp";
											} else {
												$('#alert')
														.html(
																'<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Warning!</strong>Please enter a valid pincode</div>');
											}
										},
										"error" : function() {
											alert("Page not found");
										}
									});

							return true;
						}
						$("#hiddenPwd").text("");
					});
</script>
