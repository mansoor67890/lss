<div class="modal fade" id="takePaymentModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
		<form action="takepayment" method="post"  class="validate">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					data-toggle="tooltip" data-placement="bottom"
					title="Click to Close">&times;</button>
				<h4 class="modal-title">Student Payments</h4>
			</div>
			<div class="col-md-12">
				<div class="panel panel-default panel-shadow" data-collapsed="0">
					<div class="panel-heading">
						<div class="panel-title">
							<h>Take Payment</h>
						</div>
					</div>
					<div class="panel-body">
						<input type="hidden" name="id" value="${payment.id}">
						<table class="table table-bordered" id="takepaymenttable">
							<tbody>
								<tr>
									<td>
										<div class="form-group">
											<label for="description" class="col-sm-3 control-label">Total</label>
										</div>
									</td>
									<td>
										<div class="col-sm-12">
											<input type="text" class="form-control" id="description" value="${payment.totalAmount}" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<label for="description" class="col-sm-3 control-label">Paid Amount</label>
										</div>
									</td>
									<td>
										<div class="col-sm-12">
											<input type="text" class="form-control" id="description" value="${payment.amountPaid}" readonly="readonly" disabled>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<label for="description" class="col-sm-3 control-label">Due</label>
										</div>
									</td>
									<td>
										<div class="col-sm-12">
											<input type="text" class="form-control" id="description" value="${payment.totalAmount-payment.amountPaid}" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<label for="amount" class="col-sm-3 control-label">Amount</label>
										</div>
									</td>
									<td>
										<div class="col-sm-12">
											<input type="number" class="form-control"
												name="amountPaid" data-toggle="tooltip" data-placement="bottom"
												title="Enter Paid Fee of Student" required="required">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<label for="date" class="col-sm-3 control-label">Date</label>
										</div>
									</td>
									<td>
										<div class="col-sm-12">
											<input type="text" class="form-control" id="invoiceDate" name="invoiceDate"
												data-toggle="tooltip" data-placement="bottom"
												title="Select Paying Date" required="required" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<label for="status" class="col-sm-3 control-label">Status</label>
										</div>
									</td>
									<td>
										<div class="col-sm-12">
											<select class="form-control" name="status"
												data-toggle="tooltip" data-placement="bottom"
												title="Select Paid / Unpaid Status" required>
												<option value="">Select Status</option>
												<option value="1">Paid</option>
												<option value="0">Unpaid</option>
											</select>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-success" data-toggle="tooltip" data-placement="bottom"
					title="Click to Close">Save</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					data-toggle="tooltip" data-placement="bottom"
					title="Click to Close">Close</button>
			</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$('#invoiceDate').datetimepicker({
	format : 'YYYY/MM/DD',
	ignoreReadonly : true
});
</script>