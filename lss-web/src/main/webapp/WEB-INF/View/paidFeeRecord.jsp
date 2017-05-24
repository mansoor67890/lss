<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="paidfeerecordform">

	<div class="container">
		<div class="col-md-2"></div>
		<div class="col-md-9">
			<div class="panel panel-primary" data-collapsed="0">
				<div class="panel-heading">
					<div class="panel-title">
						<i class="entypo-plus-circled"></i>
						<h>Paid Fee Record</h>
					</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<blockquote class="blockquote-blue">
								<p>
									<strong>Paid Fee Information</strong>
								</p>
								<p>To get all paid fee record between two dates, select from
									and to Date and click search button.</p>
								<b>Thanks!</b>
							</blockquote>
						</div>
					</div>
					<hr>

					<form action="getpaidfeerecord"
						class="form-horizontal form-groups-bordered validate"
						enctype="multipart/form-data" method="post" accept-charset="utf-8"
						novalidate="novalidate" id="studentpaymentform">

						<div class="row">

							<div class="form-group">
								<label for="field-2" class="col-sm-2 control-label">From</label>

								<div class="col-sm-3">
									<input type="date" class="form-control" id="fromDate"
										name="fromDate" readonly data-toggle="tooltip"
										data-placement="bottom" title="Select start Date">
								</div>

								<label for="field-2" class="col-sm-1 control-label">To</label>
								<div class="col-sm-3">
									<input type="date" class="form-control" id="toDate"
										name="toDate" readonly data-toggle="tooltip"
										data-placement="bottom" title="Select end Date">
								</div>
								
								<div class="col-sm-3">
									<input type="button" id="feeRecordBtn" class="btn btn-success" data-toggle="tooltip"
										data-placement="bottom" title="Select end Date" value="Search">
								</div>
							</div>
						</div>
					</form>
					<div class="row">
						<div class="panel-body">
							<div class="col-md-12">
								<ul class="nav nav-tabs bordered">
									<li class="active"><a href="#unpaid" data-toggle="tab">
											<span class="hidden-xs">Student List</span>
									</a></li>

								</ul>
								<div class="tab-content" id="paidFeeRecDiv">
									<br>
									<table class="table table-hover" id="paidFeeRecTable">
										<thead align="center">
											<tr>
												<th align="center" style="width: 50px">Roll#</th>
												<th align="center" style="width: 350px">Name</th>
												<th align="center" style="width: 450px">Status</th>
												<th align="center" style="width: 450px">Options</th>
											</tr>
										</thead>
										<tbody style="width: 100%;">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	 $('#fromDate, #toDate').datetimepicker({
		 format : 'YYYY/MM/DD',
	    ignoreReadonly: true
	  });
	 
	 $('#feeRecordBtn').click(function(){
		 var fromDate=$("#fromDate").val();
		 var toDate=$("#toDate").val();
		 
		 if(fromDate!="" && toDate!=""){
			 $.ajax({
			      type: "POST",
			      url: "${pageContext.request.contextPath}/template/getpaidfeerecord/",
			      data: {
			    	  fromDate: fromDate,
			    	  toDate: toDate
			      },
			      success: function(res) {
			    	 $("#paidFeeRecDiv").html(res);
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

