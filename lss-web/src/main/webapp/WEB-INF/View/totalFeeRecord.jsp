<div class="container">
	<div class="col-md-2"></div>
	<div class="col-md-9">
		<div class="panel panel-primary" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title">
					<i class="entypo-plus-circled"></i>
					<h>Total Fee Record</h>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<blockquote class="blockquote-blue">
							<p>
								<strong>Total Fee Record Details</strong>
							</p>
							<p>For fetching total record of paid and unpaid fee click on
								required button.</p>
							<b>Thanks!</b>
						</blockquote>
					</div>
				</div>
				<hr>

				<div class="tab-content">
					<br>
					<div class="tab-pane active">
						<!-- creation of single invoice -->
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-primary panel-shadow" data-collapsed="0">
									<div class="panel-heading">
										<div class="panel-title">
											<i class="entypo-plus-circled"></i>
											<h>Paid / Unpaid Fee Record</h>
										</div>
									</div>
									<div class="panel-body">

										<form action="getpaidfeerecord"
											class="form-horizontal form-groups-bordered validate"
											enctype="multipart/form-data" method="post"
											accept-charset="utf-8" novalidate="novalidate"
											id="studentpaymentform">

											<div class="row">
												<div class="form-group">
													<label for="field-2" class="col-sm-2 control-label">From</label>
													<div class="col-sm-4">
														<input type="date" class="form-control" id="fromDate"
															name="fromDate" readonly data-toggle="tooltip"
															data-placement="bottom" title="Select start Date">
													</div>

													<label for="field-2" class="col-sm-1 control-label">To</label>
													<div class="col-sm-4">
														<input type="date" class="form-control" id="toDate"
															name="toDate" readonly data-toggle="tooltip"
															data-placement="bottom" title="Select end Date">
													</div>
												</div>
											</div>
										</form>

										<div class="col-md-6">
											<button type="button" class="btn btn-success btn-lg"
												data-toggle="modal" data-target="#modalpaidrecord"
												data-toggle="tooltip" data-placement="bottom"
												title="Click to Check Total Paid Fee" id="totalPaidFeeBtn">Total
												Paid Fee</button>
										</div>

										<div class="col-md-6">
											<button type="button" class="btn btn-danger btn-lg"
												data-toggle="modal" data-target="#modalunpaidrecord"
												data-toggle="tooltip" data-placement="bottom"
												title="Click to Check Total Unpaid Fee"
												id="totalUnPaidFeeBtn">Total Unpaid Fee</button>
										</div>
										<!-- Modal Total Paid Record -->
											<div class="modal fade" id="modalpaidrecord" role="dialog">
												<div class="modal-dialog">
													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																data-toggle="tooltip" data-placement="bottom"
																title="Click to Close">&times;</button>
															<h4 class="modal-title">Total Fee Record</h4>
														</div>
														<div class="col-md-12">

															<div class="panel panel-default panel-shadow"
																data-collapsed="0">
																<div class="panel-heading">
																	<div class="panel-title">
																		<h>Paid Fee Record</h>
																	</div>
																</div>
																<div class="panel-body">
																	<div class="form-group">
																		<label class="col-sm-3 control-label">Total
																			Paid Fee</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="totalPaidFee" value="" disabled>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal" data-toggle="tooltip"
																data-placement="bottom" title="Click to Close">Close</button>
														</div>
													</div>
												</div>
											</div>

											<!-- Modal Total Unpaid Record -->
											<div class="modal fade" id="modalunpaidrecord" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																data-toggle="tooltip" data-placement="bottom"
																title="Click to Close">&times;</button>
															<h4 class="modal-title">Total Fee Record</h4>
														</div>
														<div class="col-md-12">
															<div class="panel panel-default panel-shadow"
																data-collapsed="0">
																<div class="panel-heading">
																	<div class="panel-title">
																		<h>Unpaid Fee Record</h>
																	</div>
																</div>
																<div class="panel-body">
																	<div class="form-group">
																		<label class="col-sm-3 control-label">Total
																			Unpaid Fee</label>
																		<div class="col-sm-9">
																			<input type="text" id="totalUnpaidFee"
																				class="form-control" value="" name="unpaidrevenue"
																				disabled>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal" data-toggle="tooltip"
																data-placement="bottom" title="Click to Close">Close</button>
														</div>
													</div>
												</div>
											</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

$('#fromDate, #toDate').datetimepicker({
	 format : 'YYYY/MM/DD',
   ignoreReadonly: true
 });
 
$('#totalUnPaidFeeBtn').click(function(){
	 var fromDate=$("#fromDate").val();
	 var toDate=$("#toDate").val();
	 
	 if(fromDate!="" && toDate!=""){
		 $.ajax({
		      type: "POST",
		      url: "${pageContext.request.contextPath}/gettotalunpaidfeerecord/",
		      data: {
		    	  fromDate: fromDate,
		    	  toDate: toDate
		      },
		      success: function(res) {
		    	 $("#totalUnpaidFee").val(res);
		      },
		      error: function() {
		    	  toastr.warning("No record found for these dates.", "Oops!", {
		              "timeOut": "3000",
		              "progressBar": true,           
		              "extendedTImeout": "0"
		          });
		      }
		  });
		}
	 else {
		 toastr.error("Please select both dates.", "Error!", {
             "timeOut": "3000",
             "progressBar": true,           
             "extendedTImeout": "0"
         });
	 }
});
 
$('#totalPaidFeeBtn').click(function(){
	 var fromDate=$("#fromDate").val();
	 var toDate=$("#toDate").val();
	 
	 if(fromDate!="" && toDate!=""){
		 $.ajax({
		      type: "POST",
		      url: "${pageContext.request.contextPath}/gettotalpaidfeerecord/",
		      data: {
		    	  fromDate: fromDate,
		    	  toDate: toDate
		      },
		      success: function(res) {
		    	 $("#totalPaidFee").val(res);
		      },
		      error: function() {
		    	  toastr.warning("No record found for these dates.", "Oops!", {
		              "timeOut": "3000",
		              "progressBar": true,           
		              "extendedTImeout": "0"
		          });
		      }
		  });
		}
	 else {
		 toastr.error("Please select both dates.", "Error!", {
            "timeOut": "3000",
            "progressBar": true,           
            "extendedTImeout": "0"
        });
	 }
});
 
</script>