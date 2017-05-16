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
								required button. By clicking 'Save Record' record will be saved
								and exit.</p>
							<b>Thanks!</b>
						</blockquote>
					</div>
				</div>
				<hr>

				<div class="tab-content">
					<br>
					<div class="tab-pane active">

						<!-- creation of single invoice -->
						<form action="#"
							class="form-horizontal form-groups-bordered validate"
							target="_top" method="post" accept-charset="utf-8"
							novalidate="novalidate">

							<div class="row">
								<div class="col-md-6" id="totalfee">
									<div class="panel panel-primary panel-shadow"
										data-collapsed="0">
										<div class="panel-heading">
											<div class="panel-title">
												<i class="entypo-plus-circled"></i>
												<h>Paid / Unpaid Fee Record</h>
											</div>
										</div>
										<div class="panel-body" id="btnmodal">
											<div class="container">

												<!-- Trigger the modal with a button -->

												<button type="button" class="btn btn-success btn-md"
													data-toggle="modal" data-target="#modalpaidrecord"
													data-toggle="tooltip" data-placement="bottom"
													title="Click to Check Total Paid Fee">Total Paid
													Fee</button>
												<button type="button" class="btn btn-danger btn-md"
													data-toggle="modal" data-target="#modalunpaidrecord"
													data-toggle="tooltip" data-placement="bottom"
													title="Click to Check Total Unpaid Fee">Total
													Unpaid Fee</button>

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
																					name="paidrevenue" value="700" readonly="" disabled>
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
																				<input type="text" class="form-control" value="700"
																					name="unpaidrevenue" readonly="" disabled>
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
									<!-- <div class="form-group">
									<div class="col-sm-5">
										<button type="submit" class="btn btn-info" id="saverecordbtn" action="dashBoard.jsp"  data-toggle="tooltip" data-placement="bottom"
								title="Click to Save Record">Save Record</button>
									</div>
								</div> -->
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
