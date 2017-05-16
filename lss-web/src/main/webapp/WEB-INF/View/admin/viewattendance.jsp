<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.table-fixed thead {
	width: 97%;
}

.table-fixed tbody {
	height: 500px;
	overflow-y: auto;
	width: 100%;
}

.table-fixed thead,.table-fixed tbody,.table-fixed tr,.table-fixed td,.table-fixed th
	{
	display: block;
}

.table-fixed tbody td,.table-fixed thead>tr>th {
	float: left;
	border-bottom-width: 0;
}
</style>


<div class="container">
	<div class="panel-group">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h1>View Attendance</h1>
			</div>
			<div class="panel-body">
				<form id="eventForm" method="post" class="form-horizontal"
					action="viewattendance">
					<div class="form-group">
						<label class="col-xs-3 control-label">Select Employee</label>
						<div class="col-xs-5">
							<div class="ui-select">
								<select name="username" id="user_name" class="form-control">
									<c:forEach var="employee" items="${employeeList}">
										<option>${employee.code}--${employee.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">From Date</label>
						<div class="col-xs-5">
							<input type='date' name="startDate" class="form-control"
								id='startDate' />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">To Date</label>
						<div class="col-xs-5">
							<input type='date' name="endDate" class="form-control"
								id='endDate' />
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-5 col-xs-offset-3">
							<button type="submit" id="showData" class="btn btn-default">Show</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>



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