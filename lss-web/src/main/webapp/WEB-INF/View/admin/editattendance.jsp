<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<br>
<div class="container">
	<div class="row">


		<form class="form-horizontal" name="form1" action="editattendance"
			method="post" modelAttribute="editAttendanceForm" id="myForm">

			<div class="form-group">
			<div class="col-md-4">
				<label class="control-label">Edit Attendance For Date: </label>
					<label><fmt:formatDate value="${date}" pattern="MM-dd-yyyy" /></label>
				</div>
			</div>

			<div class="span12">
				<div class="menu">
					<div class="accordion">
						<div class="accordion-group">
							<table  class="table table-striped" name="attTable" id="attTable">
								<thead>
									<tr>
										<th>Employee Name</th>
										<th>Code</th>
										<th><input type="radio" class="allPresent" name="att" />Present</th>
										<th><input type="radio" class="allAbsent" name="att" />Absent</th>
										<th>Time In</th>
										<th>Time Out</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach varStatus="emp" var="employee"
										items="${editAttendanceForm.attendanceList}">
										<tr class="item">
											<td><input type="hidden"
												name="attendanceList[${emp.index}].employeeName"
												value="${employee.employeeName}">${employee.employeeName}</td>
											<td><input type="hidden"
												name="attendanceList[${emp.index}].code"
												value="${employee.code}">${employee.code}</td>
											<c:choose>
												<c:when test="${employee.isPresent=='present'}">
													<td><input type="radio" onclick="document.getElementById('attendanceList[${emp.index}].timeIn').disabled = false; document.getElementById('attendanceList[${emp.index}].timeOut').disabled = false;"
														name="attendanceList[${emp.index}].isPresent"
														class="present" checked="checked" value=present /></td>
													<td><input type="radio" onclick="document.getElementById('attendanceList[${emp.index}].timeIn').disabled = true;document.getElementById('attendanceList[${emp.index}].timeOut').disabled = true;"
														name="attendanceList[${emp.index}].isPresent"
														class="absent" value="absent" /></td>
												</c:when>
												<c:otherwise>
													<td><input type="radio" onclick="document.getElementById('attendanceList[${emp.index}].timeIn').disabled = false; document.getElementById('attendanceList[${emp.index}].timeOut').disabled = false;"
														name="attendanceList[${emp.index}].isPresent"
														class="present" value="present" /></td>
													<td><input type="radio" onclick="document.getElementById('attendanceList[${emp.index}].timeIn').disabled = true;document.getElementById('attendanceList[${emp.index}].timeOut').disabled = true;"
														name="attendanceList[${emp.index}].isPresent"
														class="absent" checked="checked" value="absent" /></td>
												</c:otherwise>
											</c:choose>
											<td>
												<div class="from-control">
													<input id="attendanceList[${emp.index}].timeIn" name="attendanceList[${emp.index}].timeIn" value="${employee.timeIn}" type="text" class="timein">
												</div>
											</td>
											<td>
												<div class="from-control">
													<input id="attendanceList[${emp.index}].timeOut" name="attendanceList[${emp.index}].timeOut" value="${employee.timeOut}" type="text" class="timeout">
												</div>
											</td>
										</tr>
										<input type="hidden"
												name="attendanceList[${emp.index}].date"
												value="${date}">
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


		
			$('.allPresent').click(
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
						$('[type=radio]').click(function(e) {
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