
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>Attendance Issue Application</h1>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						${att.employee.name}
						<div class="pull-right">Applied on:
							${att.notification.applicationDate}</div>

					</h3>

				</div>


				<div class="list-group">

					<div class="list-group-item">
						<h4 class="list-group-item-heading">
							Issue on ${att.date} <a href="#" data-toggle="tooltip"
								data-placement="bottom" title="Access website and use site API">
								<i class="fa fa-question-circle"></i>
							</a>
						</h4>
						<div class="list-group-item-text">
							<h4>
								Issue: <span class="btn btn-info btn-sm">${att.notification.empComment}</span>
							</h4>
						</div>

						<form role="form" method="post"	action="approveattendanceissue">
										<table class="table table-striped" 
											id="attTable">
											<thead>
												<tr>

													<th>Present</th>
													<th>Absent</th>
													<th>Time In</th>
													<th>Time Out</th>


												</tr>
											</thead>
											<tbody>
												<tr class="item" col-span=3>
													<th>Current attendance</th>
												</tr>
												<tr class="item disabled">
													<c:choose>
														<c:when test="${att.attendance==true}">
															<td><input type="radio" class="present"
																checked="checked" value=present disabled /></td>
															<td><input type="radio" class="absent"
																value="absent" /></td>
														</c:when>
														<c:otherwise>
															<td><input type="radio" disabled/ name="1st"></td>
															<td><input type="radio" checked="checked" value="absent" disabled  name="1st" /></td>
														</c:otherwise>
													</c:choose>
													<td>
														<div class="from-control">
															<input disabled id="timeIn" value="${att.timeIn}"
																type="text" class="form-control">
														</div>
													</td>
													<td><input id="timeOut" disabled
														value="${att.timeOut}" type="text" class="form-control">
													</td>

												</tr>
												<tr class="item" col-span=3>
													<th>New attendance</th>
												</tr>

												<tr class="item">
													<c:choose>
														<c:when
															test="${att.notification.pending.attendance==true }">
															<td><input type="radio" name="isPresent"
																class="present" checked="checked" value=present /></td>
															<td><input type="radio" name="isPresent"
																class="absent" value="absent" /></td>
														</c:when>
														<c:otherwise>
															<td><input type="radio"
																onclick="document.getElementById('timeIn').disabled = false; document.getElementById('timeOut').disabled = false;"
																name="isPresent" class="present" value="present" /></td>
															<td><input type="radio" name="isPresent"
																class="absent" checked="checked" value="absent" /></td>
														</c:otherwise>
													</c:choose>
													<td>
														<div class="from-control">
															<input id="timeIn" name="timeIn"
																value="${att.notification.pending.timeIn}" type="text"
																class="timein form-control">
														</div>
													</td>
													<td><input id="timeOut" name="timeOut"
														value="${att.notification.pending.timeOut}" type="text"
														class="timeout form-control"></td>

												</tr>
											</tbody>
										</table>




										<div class="list-group-item-text">

											<input type="hidden" name="attendaceId" value=${att.id}>
											<h3>Comment:</h3>
											<textarea name="comment" class="form-control"
												value="${att.notification.adminComment}"> </textarea>
										</div>
										<br>
										<c:choose>
											<c:when test="${att.notification.pending.status==0}">
											<br><br>
												<div class="feed-item">
													<div class="form-group pull-right">
														<input value="Approve" name="approve" type="submit"
															id="approve" class="btn btn-success"> <input
															value="Reject" name="reject" type="submit" id="reject"
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
</div>
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

