<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 title="Select months and click to see the Attendance Issues">View Attendance Issues</h3>
			</div>
			<div class="panel-body">
			
				<form id="eventForm" method="post" class="form-horizontal" action="viewattendanceissues">
				
					<div class="form-group">
						<label class="col-xs-3 control-label">From Date</label>
						<div class="col-xs-5">
							<input type='date' name="fromDate" class="form-control"
								id='startDate' />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-3 control-label">To Date</label>
						<div class="col-xs-5">
							<input type='date' name="toDate" class="form-control"
								id='endDate' />
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-5 col-xs-offset-3">
							<button type="submit" class="btn btn-default">Show</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<c:choose>
	<c:when test="${empty attendancereport}">
		<c:if test="${not empty msg}">
		<div class="container">
		<div id="embed">
					<script type="text/javascript">
					$("#embed").html("<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong></strong> ${msg}</div>");
					</script>
				</div>
				</div>
		</c:if>
	</c:when>
	<c:otherwise>
	<div class="container">
	<div class="row">
		<div class="panel">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>Employee Name</th>
							<th>Date Applied</th>
							<th>Attendance Date</th>
							<th>Reason</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="report" items="${attendancereport}">
							<tr>
								<td>${report.attendance.employee.name}</td>
								<td>${report.applicationDate}</td>
								<td>${report.attendance.date}</td>
								<td>${report.empComment}</td>
								<c:choose>
									<c:when test="${report.pending.status==0}">
										<td><span class="label label-warning">Pending</span></td>
										<td><a class="btn btn-info" href="viewattendanceissue/${report.attendance.id}">view</a></td>
									</c:when>
									<c:when test="${report.pending.status==1}">
										<td><span class="label label-success">Approved</span></td>
										<td><a class="btn btn-info" href="viewattendanceissue/${report.attendance.id}">view</a></td>
									</c:when>
									<c:otherwise>
										<td><span class="label label-danger">Denied</span></td>
										<td><a class="btn btn-info" href="viewattendanceissue/${report.attendance.id}">view</a>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>

					</tbody>
				</table>
		</div>
	</div>
</div>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
	$(function() {
		var dateToday = (new Date()).format('yyyy/mm/dd');

		$('#startDate').datetimepicker({
			timepicker : false,
			format : 'Y/m/d',
			value : dateToday
		});

		$('#endDate').datetimepicker({
			timepicker : false,
			format : 'Y/m/d',
			value : dateToday
		});
	});
</script>





