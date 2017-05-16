
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>Leave Application</h1>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						${leaves.employee.name}
						<div class="pull-right">Applied on:
							${leaves.applicationDate}</div>

					</h3>
				</div>
			</div>


			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="list-group">

						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								From ${leaves.fromDate} To ${leaves.toDate} <a href="#"
									data-toggle="tooltip" data-placement="bottom"
									title="Access website and use site API"> <i
									class="fa fa-question-circle"></i>
								</a>
							</h4>
							<div class="list-group-item-text">
								<h4>
									Leave Type: <span class="btn btn-info btn-sm">${leaves.leaveType.name}</span>
								</h4>
							</div>

							<div class="list-group-item-text">
								<h3>Reason:</h3>
								<p class="text-justify">${leaves.reason}</p>
							</div>
						</div>
					</div>
					<form role="form" method="post" action="${pageContext.request.contextPath}/admin/approveleave">
						<div class="list-group-item-text">
					
						<input type = "hidden" name="id" value=${leaves.id}>
							<h3>Comment:</h3>
							<textarea name="adminComment" class="form-control" value="${leaves.comment}"> </textarea>
						</div>
						<br>
						<c:choose>
							<c:when test="${leaves.isGranted==0}">
								<div class="feed-item">
									<div class="form-group pull-right">
							<input value="Approve" name="approve" type="submit"  id="approve" 
								class="btn btn-success"> 
								
								<input value="Reject" name="reject" type="submit" id="reject" 
								class="btn btn-danger">
							</div>
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


