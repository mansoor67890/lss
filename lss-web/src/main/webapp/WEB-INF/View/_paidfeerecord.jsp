<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover dataTable" id="paidFeeRecTable">
	<thead align="center">
		<tr>
			<th>Roll#</th>
			<th>Name</th>
			<th>Class</th>
			<th>Section</th>
			<th>Total Amount</th>
			<th>Amount Paid</th>
			<th>Status</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="obj" items="${payments}">
			<tr>
				<td>${obj.student.rollNumber}</td>
				<td>${obj.student.name}</td>
				<td>${obj.student.studentClass}</td>
				<td>${obj.student.section}</td>
				<td>${obj.totalAmount}</td>
				<td>${obj.amountPaid}</td>
				<c:choose>
					<c:when test="${obj.status eq 'true'}">
						<td><a href="#" id="${obj.id}" class="btn btn-sm btn-success">Paid</a></td>
					</c:when>
					<c:otherwise>
						<td><a href="#" id="${obj.id}" class="btn btn-sm btn-danger">Unpaid</a></td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${obj.status eq 'false'}">
						<td><a href="#" class="btn btn-default takePayment"
							id="${obj.id}" data-toggle="tooltip" data-placement="bottom"
							title="Click to Open Take Payment Form">Take Payment</a></td>
					</c:when>
					<c:otherwise>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script>
$("#paidFeeRecTable").dataTable();
</script>