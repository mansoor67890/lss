<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="centered title">
		<h2>Submit Leave Form</h2>
	</div>
</div>
<hr class="featurette-divider"></hr>
<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<div class="tab-content">
				<div id="stripe" class="tab-pane fade in active">
					<form action="applyleave" class="require-validation" id="leaveForm"
						method="post">
						<br>
						<div class='form-row'>
							<div class='form-group required'>
								<div class='error form-group hide'>
									<div class='alert-danger alert'>Please correct the errors
										and try again.</div>
								</div>
								<label class='control-label'>From Date</label> <input
									class="form-control" id="fromDate" placeholder="Your Last Name"
									type="text" name="fromDate">
							</div>
						</div>
						<div class='form-row'>
							<div class='form-group card required'>
								<label class='control-label'>To Date</label> <input
									class="form-control" placeholder="To Date" type="text"
									name="toDate" id="toDate">
							</div>
						</div>
						<div class='form-row'>
							<div class='form-group card required'>
								<label>Leave Type</label> <select class="form-control" id="type" required
									name="type">
									<option selected disabled>Choose One:</option>
									<option>Medical leave</option>
									<option>casual</option>
								</select>
							</div>
						</div>
						<div class='form-row'>
							<div class='form-group cvc required'>
								<label>Reason</label>
								<textarea class="input-large form-control" id="reason"
									maxlength="500" name="reason" rows="10"></textarea>
								<span class="help-block"><p id="characterLeft"
										class="help-block ">You have reached the limit</p></span>
							</div>
						</div>
						<div class='form-row'>
							<div class='form-group'>
								<label class='control-label'></label>
								<button class='form-control btn btn-primary' type='submit'
									id="btnSubmit">Continue</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-6">
	<label class='control-label'></label> <br>
	<div class="panel panel-info">
		<div class="panel-body">
			<div class="form-group">
				<h2>
					<i>Total Casual Leaves</i>
				</h2>
			</div>
			<div class="paymentAmt">${employeeTotalCasualLeaves}/${totalCasualLeaves}</div>

			<div class="form-group">
				<h2>
					<i>Total Sick Leaves</i>
				</h2>
			</div>
			<div class="paymentAmt">${employeeTotalSickLeaves}/${totalSickLeaves}</div>

			<div class="form-group">
				<h2>
					<i>Monthly Sick Leaves</i>
				</h2>
				<div class="paymentAmt">${MonthlySickLeaves}</div>
			</div>

			<div class="form-group">
				<h2>
					<i>Monthly Casual Leaves</i>
				</h2>
				<div class="paymentAmt">${MonthlyCasualLeaves}</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		var dateToday = (new Date()).format('yyyy/mm/dd');

		$('#fromDate').datetimepicker({
			timepicker : false,
			value : dateToday,
			maxDate: '+1M -10D'
		});

		$('#toDate').datetimepicker({
			timepicker : false,
			value : dateToday,
		});

		$('#characterLeft').text('500 characters left');
		$('#reason').keydown(function() {
			var max = 500;
			var len = $(this).val().length;
			if (len >= max) {
				$('#characterLeft').text('You have reached the limit');
				$('#characterLeft').addClass('red');
				$('#btnSubmit').addClass('disabled');
			} else {
				var ch = max - len;
				$('#characterLeft').text(ch + ' characters left');
				$('#btnSubmit').removeClass('disabled');
				$('#characterLeft').removeClass('red');
			}
		});
	});
</script>