<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<br>
<div class="container">
	<div class="row">
	
	<div class="form-group">
			<div class="col-md-5">
				<h4>Attendance details for ${username}</h4>
				</div>
			</div>
	<br>
        <div class="panel panel-default">
    		<div class="panel-body">
            					<table class="table table-hover table-condensed">
            						<thead>
            							<tr>
            								<th>Date</th>
            								<th>Present</th>
            								<th>Time in</th>
            								<th>Time out</th>
            							</tr>
            						</thead>
									<tbody>
										<c:forEach var="attend" items="${userAttendance}">
											<tr>
												<td><label><fmt:formatDate value="${attend.date}" pattern="MM-dd-yyyy" /></label></td>
													<c:choose>
												<c:when test="${attend.attendance=='true'}">
													<td>present</td>
												</c:when>
												<c:otherwise>
													<td>absent</td>
												</c:otherwise>
											</c:choose>
												<td>${attend.timeIn}</td>
												<td>${attend.timeOut}</td>
												<td><a class="btn btn-info" href="reportAttendance/${attend.id}">Report an issue</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
            </div>
        </div>
	</div>
</div>