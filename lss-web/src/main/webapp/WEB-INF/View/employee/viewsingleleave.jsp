<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<br>
<br>
<div class="container">
	<div class="row">
		<div class="form-group">
			<div class="col-md-5"></div>
		</div>
		<div class="span12">
			<div class="menu">
				<div class="accordion">
					<div class="accordion-group">
						<div class="accordion-inner">
							<table class="table table-striped table-condensed">
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
									<tr>
										<td></td>
										<td></td>
										<td><label><fmt:formatDate
													value="${singleLeave.toDate}" pattern="MM-dd-yyyy" /></label></td>
										<td><label> ${singleLeave.reason} </label></td>

										<c:choose>
											<c:when test="${singleLeave.isGranted eq 0}">
												<td><label><span class="label label-warning">Pending</span></label></td>
											</c:when>
											<c:when test="${singleLeave.isGranted eq 1}">
												<td><label><span class="label label-success">Approved</span></label></td>
											</c:when>
											<c:when test="${singleLeave.isGranted=='2'}">
												<td><label><span class="label label-danger">Denied</span></label></td>
											</c:when>
											<c:otherwise>
												<td></td>
											</c:otherwise>
										</c:choose>
										<td><label> ${singleLeave.comment} </label></td>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="container">
	<div class="panel-group">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h1>View Attendance</h1>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<label>Application Date: &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <fmt:formatDate
							value="${singleLeave.applicationDate}" pattern="MM-dd-yyyy" />
					</label>
				</div>


				<div class="form-group">
					<label>From Date: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <fmt:formatDate
							value="${singleLeave.fromDate}" pattern="MM-dd-yyyy" />
					</label>
				</div>


				<div class="form-group">
					<label></label>
					<div class="col-xs-5">
						<div class="ui-select">
							<label><fmt:formatDate value=""
									pattern="MM-dd-yyyy" /></label>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label>To Date</label>
					<div class="col-xs-5">
						<div class="ui-select">
							<label><fmt:formatDate value=""
									pattern="MM-dd-yyyy" /></label>
						</div>
					</div>
				</div>


				<div class="form-group">
					<div class="col-xs-5 col-xs-offset-3">
						<button type="submit" id="showData" class="btn btn-default">Show</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.Absolute-Center {
	margin: auto;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
}

.Absolute-Center.is-Responsive {
	width: 50%;
	height: 50%;
	min-width: 200px;
	max-width: 400px;
	padding: 40px;
}
</style>
<div class="container">
	<div class="row">
		<div
			class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">${employee.name}</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-3 col-lg-3 " align="center">
							<img alt="User Pic" src="" class="img-circle img-responsive">
						</div>
						<div class=" col-md-9 col-lg-9 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>From Date:</td>
										<td>${singleLeave.fromDate}</td>
									</tr>
									<tr>
										<td>To Date:</td>
										<td>${singleLeave.toDate}</td>
									</tr>
									<tr>
										<td>Date of Birth</td>
										<td>${employee.employeeDetails.dateOfBirth}</td>
									</tr>
									<tr>
									<tr>
										<td>Gender</td>
										<td>${employee.employeeDetails.gender}</td>
									</tr>

									<tr>
										<td>Status</td>
										<td>${employee.employeeDetails.employmentStatus}</td>
									</tr>
									<tr>
										<td>Address</td>
										<td>${employee.employeeDetails.address}</td>
									</tr>
									<tr>
										<td>Email</td>
										<td><a href="${employee.email}">${employee.email}</a></td>
									</tr>
									<tr>
										<td>Phone Number</td>
										<td>${employee.employeeDetails.phoneNo}(Landline)<br>
											<br>${employee.employeeDetails.mobileNo} (Mobile)
										</td>
									</tr>
									<tr>
										<td>Martial Status</td>
										<td>${employee.employeeDetails.maritalStatus}</td>
									</tr>
									<tr>
										<td>Blood Group</td>
										<td>${employee.employeeDetails.bloodGroup}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<a href="/cpc-web/viewemployees" class="btn btn-default">Back</a> <a
						href="/cpc-web/admin/editprofile/${employee.code}"
						alt="Edit this user" data-toggle="tooltip" type="button"
						class="btn btn-sm btn-warning pull-right"> <i
						class="glyphicon glyphicon-edit"></i></a>
					<!-- <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger">
    <i class="glyphicon glyphicon-remove"></i></a> -->
				</div>
			</div>
		</div>
	</div>
</div>

