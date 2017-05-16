<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<br>
<br>
<div class="container">
	<div class="row">
		<form class="form-horizontal" name="form1" action="/cpc-web/user/reportAttendance"
			method="post" id="myForm">
			<div class="span12">
				<div class="menu">
					<div class="accordion">
						<div class="accordion-group">
							<table class="table table-striped" name="attTable" id="attTable">
								<thead>
									<tr>
									
										<th>Present</th>
										<th>Absent</th>
										<th>Time In</th>
										<th>Time Out</th>
													<th>Reason</th>
									</tr>
								</thead>
								<tbody>
									<tr class="item">
										<c:choose>
											<c:when test="${userAttendance.attendance=='present'}">
												<td><input type="radio" name="isPresent"
													class="present" checked="checked" value=present /></td>
												<td><input type="radio" name="isPresent" class="absent"
													value="absent" /></td>
											</c:when>
											<c:otherwise>
												<td><input type="radio"
													onclick="document.getElementById('timeIn').disabled = false; document.getElementById('timeOut').disabled = false;"
													name="isPresent" class="present" value="present" /></td>
												<td><input type="radio" name="isPresent" class="absent"
													checked="checked" value="absent" /></td>
											</c:otherwise>
										</c:choose>
										<td>
											<div class="from-control">
												<input id="timeIn" name="timeIn"
													value="${userAttendance.timeIn}" type="text" class="timein form-control">
											</div>
										</td>
										<td>
												<input id="timeOut" name="timeOut" 
													value="${userAttendance.timeOut}" type="text"
													class="timeout form-control">
										</td>
										<td> 
												<input type="text" class="form-control" name="reason" placeholder="Please give a reason">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
				
			<div class="col-md-4">
				<input type="hidden" name="attendaceId" value="${userAttendance.id}" type="text">
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
					format : 'H:i',
					step : 5,
					datepicker : false
				});

				$('.timeout').val('17:00');
				$('.timeout').change().datetimepicker({
					format : 'H:i',
					step : 5,
					datepicker : false
				});
			});
		</script>
	</div>
</div>