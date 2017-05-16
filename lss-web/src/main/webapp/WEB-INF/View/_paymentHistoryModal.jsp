<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.modal-dialog {
	width: 50%;
	margin: 30px auto;
}
</style>
<div class="modal fade" id="paymentHistoryModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					data-toggle="tooltip" data-placement="bottom"
					title="Click to Close">&times;</button>
				<h4 class="modal-title">Student Payments History</h4>
			</div>
			<div class="col-md-12">
				<div class="panel panel-default panel-shadow" data-collapsed="0">
					<div class="panel-heading">
						<div class="panel-title">
							<h>Payment History</h>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-bordered" id="paymentHistoryTable">
							<thead align="center">
								<tr>
									<th>Roll#</th>
									<th>Name</th>
									<th>Class</th>
									<th>Section</th>
									<th>Total Amount</th>
									<th>Amount Paid</th>
									<th>Invoice/Payment Date</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${paymentsHistory}" var="obj">
									<tr>
										<td>${obj.student.rollNumber}</td>
										<td>${obj.student.name}</td>
										<td>${obj.student.studentClass}</td>
										<td>${obj.student.section}</td>
										<td>${obj.totalAmount}</td>
										<td>${obj.amountPaid}</td>
										<td><fmt:formatDate value="${obj.invoice.date}" type="date" dateStyle="long"/></td>
										<c:choose>
										<c:when test="${obj.status eq 'true'}">
											<td><a href="#" id="${obj.id}"
												class="btn btn-sm btn-success">Paid</a></td>
										</c:when>
										<c:otherwise>
											<td><a href="#" id="${obj.id}"
												class="btn btn-sm btn-danger">Unpaid</a></td>
										</c:otherwise>
									</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
				<!-- -------------------------------------------------------- -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					data-toggle="tooltip" data-placement="bottom"
					title="Click to Close">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
$("#paymentHistoryTable").dataTable();
</script>