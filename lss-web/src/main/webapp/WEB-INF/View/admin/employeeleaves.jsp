<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">

		<div class="panel-group">
		<div class="panel panel-info">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Employee Name</th>
						<th>Date Applied</th>
						<th>Date From</th>
						<th>Date To</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="leave" items="${leaves}">
						<tr>
							<td>${leave.employee.name}</td>
							<td>${leave.applicationDate}</td>
							<td>${leave.fromDate}</td>
							<td>${leave.toDate}</td>
							<c:choose>
								<c:when test="${leave.isGranted==0}">
									<td><span class="label label-warning">Pending</span> <a href="employeeleaves/${leave.id}">view</a> </td>
								</c:when>
								<c:when test="${leave.isGranted==1}">
									<td><span class="label label-success">Approved</span> <a href="employeeleaves/${leave.id}">view</a> </td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-danger">Denied</span> <a href="employeeleaves/${leave.id}">view</a> </td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>

	</div>
</div>