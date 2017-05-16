<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<br>
<div class="container">
	<div class="row">
		<form class="form-horizontal" name="form1" action="markattendance"
			
			method="post" modelAttribute="attendanceForm" id="myForm">

			<div class="form-group">
				<label class="col-md-1 control-label">Select Date</label>
				<div class="col-md-4">
					<input type='text' name="date" class="form-control"
						id='datetimepicker4' /> 
				</div>
			</div>
			
			<div class="span12">
				<div class="menu">
					<div class="accordion">
						<div class="accordion-group">
							<table class="table table-striped" name="attTable" id="attTable">
								<thead>
									<tr>
										<th>Employee Name</th>
										<th>Code</th>
										<th><input type="radio" class="all" name="present"
											value="" checked="true" />Present</th>
										<th><input type="radio" class="allAbsent" name="present" />Absent</th>
										<th>Time In</th>
										<th>Time Out</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach varStatus="emp" var="employee"
										items="${attendanceForm.attendanceList}">
										<tr class="item">
											<td><input type="hidden"
												name="attendanceList[${emp.index}].employeeName"
												value="${employee.employeeName}">${employee.employeeName}</td>
											<td><input type="hidden"
												name="attendanceList[${emp.index}].code"
												value="${employee.code}">${employee.code}</td>
											<td><input type="radio"
												onclick="document.getElementById('attendanceList[${emp.index}].timeIn').disabled = false; document.getElementById('attendanceList[${emp.index}].timeOut').disabled = false;"
												name="attendanceList[${emp.index}].isPresent" checked="true"
												class="present" value="present" /></td>
											<td><input type="radio"
												onclick="document.getElementById('attendanceList[${emp.index}].timeIn').disabled = true;document.getElementById('attendanceList[${emp.index}].timeOut').disabled = true;"
												name="attendanceList[${emp.index}].isPresent" class="absent"
												value="absent" /></td>
											<td>
												<div class="from-control">
													<input id="attendanceList[${emp.index}].timeIn" name="attendanceList[${emp.index}].timeIn" type="text" class="from-control timein">
												</div>
											</td>
											<td>
												<div class="from-control">
													<input id="attendanceList[${emp.index}].timeOut" name="attendanceList[${emp.index}].timeOut" type="text" class="from-control timeout">
												</div>
											</td>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<input class="btn btn-primary" value="Save Changes" id="postData"
					type="submit">
			</div>
		</form>
	</div>

	<div>
		<script type="text/javascript">

		$(function() {
			var dateToday = (new Date()).format('yyyy/mm/dd');
			
			$('#datetimepicker4').datetimepicker({
				 timepicker: false,
				 format:'Y/m/d',
				 value: dateToday,
				 maxDate: '+1M +10D'
				});

			$('.timein').val('09:00');
			
			$('.timein').change().datetimepicker({
				 format:'H:i',
				    step:5,
				    datepicker: false
				
			});

			$('.timeout').val('17:00');
			$('.timeout').change().datetimepicker({
				 format:'H:i',
				    step:5,
				    datepicker: false
			});
			
		});

			$('.all').click(
					function(e) {
						e.stopPropagation();
						var $this = $(this);
						if ($this.is(":checked")) {
							$this.parents('.table-striped').find(".present")
									.prop("checked", true);
						} else {
							$this.parents('.list-group').find(".absent").prop(
									"checked", false);
							$this.prop("checked", false);
						}
						$('[type=checkbox]').click(function(e) {
							e.stopPropagation();
						});
						$('.timeout,.timein').prop('disabled',false);
					});
			$('.allAbsent').click(
					function() {
						var $this = $(this);
						if ($this.is(":checked")) {
							$this.parents('.table-striped').find(".absent")
									.prop("checked", true);
							$('.timeout,.timein').prop('disabled',true);
						}
					});


			
		</script>
	</div>
</div>