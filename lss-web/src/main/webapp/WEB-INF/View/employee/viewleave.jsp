
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="container">
	<div class="row">
		<div class="col-md-12">

			<c:choose>
				<c:when test="${leave.isGranted==0}">
					<div class="panel panel-info">
						<div class="panel-heading">
							
								<h1>Pending</h1>
								<div class="list-group-item-text">
					
						<div class="text-justify">${leave.comment}</div>
					
								<div class="pull-right">Applied on:
									${leave.applicationDate}</div>

							
						</div>
					</div>
				</c:when>

						<c:when test="${leave.isGranted==1}">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">
								<h1>Accepted</h1>
										<div class="text-justify">${leave.comment}</div>
								<div class="pull-right">Applied on:
									${leave.applicationDate}</div>

							</h3>
						</div>
					</div>
				</c:when>

						<c:when test="${leave.isGranted==2}">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">
								<h1>Rejected</h1>
										<div class="text-justify">${leave.comment}</div>
								<div class="pull-right">Applied on:
									${leave.applicationDate}</div>

							</h3>
						</div>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
		


			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="list-group">

						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								From ${leave.fromDate} To ${leave.toDate} <a href="#"
									data-toggle="tooltip" data-placement="bottom"
									title="Access website and use site API"> <i
									class="fa fa-question-circle"></i>
								</a>
							</h4>
							<div class="list-group-item-text">
								<h4>
									Leave Type: <span class="btn btn-info btn-sm">${leave.leaveType.name}</span>
								</h4>
							</div>

							<div class="list-group-item-text">
								<h3>Reason:</h3>
								<p class="text-justify">${leave.reason}</p>
							</div>

						</div>
					</div>
				</div>
				<br>
			</div>
		</div>
	</div>
</div>


