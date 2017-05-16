<hr>
<div class="container">
	<div class="row">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">Reset Password</h2>
							<p>Enter new password</p>
							<div class="panel-body">
								<form class="form" method="post" action="resetpassubmit" modelAttribute="ResetPasswordBean">
									<div class="form-group">
										<input type="password" class="form-control" name="password1"
											placeholder="New Password" value="" required>
									</div>

									<div class="form-group">
										 <input type="password"
											class="form-control" name="password2" placeholder="Confirm Password"
											value="" required>
									</div>
							
							<div class="form-group">
								<input type="hidden" name="userId" value="${user.id}"
									placeholder="password" value="" required>
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn-lg btn-primary btn-block"
									value="Reset Password">
							</div>
							</form>
						</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


