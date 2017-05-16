<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<br>

<div class="container">
	<div class="row">
<c:choose>
	<c:when test="${empty username}">
		<div class="feed-item">
			<div id="embed2">
					<script type="text/javascript">
					$("#embed2").html("<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong></strong>${msg}</div>");
					</script>
				</div>
		</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			</c:when>
	<c:otherwise>
	
	<div class="form-group">
			<div class="col-md-5">
				<h4>Attendance details For user: ${username}</h4>
					
				</div>
			</div>
        <div class="span12">
    		<div class="menu">
                <div class="accordion">
            		<div class="accordion-group">
            				<div class="accordion-inner">
            					<table class="table table-striped table-condensed">
            						<thead>
            							<tr>
            								<th>Date</th>
            								<th>Present</th>
            								<th>Time in</th>
            								<th>Time out</th>
            							</tr>
            						</thead>
									<tbody>
										<c:forEach var="attend" items="${attendanceList}">
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
											</tr>
											<!-- <tr><strong>Day</strong></tr> -->
										</c:forEach>
									</tbody>
								</table>
            				</div>
            		</div>
            	</div>
            </div>
        </div>
	</c:otherwise>
</c:choose>

<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
	</div>
</div>

