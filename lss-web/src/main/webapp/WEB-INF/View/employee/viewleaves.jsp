<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<br>
<div class="container">
	<div class="row">

		<div class="form-group">
			<div class="col-md-5"></div>
		</div>

		<div class="panel panel-default">
    		<div class="panel-body">
							<table class="table table-hover table-condensed">
								<thead>
									<tr>
										<th>Application Date</th>
										<th>From Date</th>
										<th>To Date</th>
										<th>Reason</th>
										<th>Status</th>
										<th>Admin's Comment</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="leave" items="${userLeaves}">
										<tr>
											<td><label><fmt:formatDate
														value="${leave.applicationDate}" pattern="MM-dd-yyyy" /></label></td>
											<td><label><fmt:formatDate
														value="${leave.fromDate}" pattern="MM-dd-yyyy" /></label></td>
											<td><label><fmt:formatDate
														value="${leave.toDate}" pattern="MM-dd-yyyy" /></label></td>
											<td><label> ${leave.reason} </label></td>

											<c:choose>
												<c:when test="${leave.isGranted eq 0}">
													<td><label><span class="label label-warning">Pending</span></label></td>
												</c:when>
												<c:when test="${leave.isGranted eq 1}">
													<td><label><span class="label label-success">Approved</span></label></td>
												</c:when>
												<c:when test="${leave.isGranted=='2'}">
													<td><label><span class="label label-danger">Denied</span></label></td>
												</c:when>
												<c:otherwise>
													<td></td>
												</c:otherwise>
											</c:choose>
											<td><label> ${leave.comment} </label></td>
											<td><label><a class="btn btn-info" href="viewleave/${leave.id}">view</a> </label></td>
									</c:forEach>
								</tbody>
							</table>
			</div>
		</div>
	</div>
</div>