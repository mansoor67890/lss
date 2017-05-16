<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="col-md-2"></div>
	<div class="col-md-9">
		<div class="panel panel-primary" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title">
					<i class="entypo-plus-circled"></i>
					<h4>Create Student Payment</h4>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<blockquote class="blockquote-blue">
							<p>
								<strong>Student Payment Procedure</strong>
							</p>
							<p>For adding student payment or fee kindly first type
								student roll number in search box and fetch the details of
								student then select the necessary fields and choose the payment
								gateway. By clicking 'Add Invoice' payment will be added to
								student's portal.</p>
							<b>Thanks!</b>
						</blockquote>
					</div>
				</div>
				<hr>
				<div id="errorMsg"></div>
				<jsp:include page="msgDisplay.jsp"></jsp:include>
				
				<div class="row">
						<div class="form-group">
							<div class="col-xs-9">
									<input type="text" id="searchStudentField" class="form-control"
										name="company" style="margin-left: 6%; width: 95%" autofocus
										data-toggle="tooltip" data-placement="bottom"
										title="Please Enter Student Roll # or Name" /> <br /> <label
										class="radio-inline" style="margin-left: 3%">Search
										Student by </label> <label class="radio-inline"> <input
										type="radio" name="searchBy" value="rollNumber"
										checked='checked' autofocus data-toggle="tooltip"
										data-placement="bottom"
										title="Please Select to Search by Student Roll #" /> Roll #
									</label> <label class="radio-inline"> <input type="radio"
										name="searchBy" value="name" autofocus data-toggle="tooltip"
										data-placement="bottom"
										title="Please Select to Search by Student Name" /> Name
									</label>

								</div>
								<div class="col-xs-2">
									<button type="button" class="btn btn-success btn-lg"
										id="searchStudentBtn"
										title="Please Click for Student Information">Search</button>
								</div>
						</div>
				</div>
				<hr>
				<div class="tab-content">
					<br>
					<div class="tab-pane active" id="unpaid">

						<form action="createstudentpayment" method="post" class="form-horizontal form-groups-bordered validate" id="studentPaymentForm">
							<div class="row">
								<div class="col-md-6">
									<div class="panel panel-primary panel-shadow"
										data-collapsed="0">
										<div class="panel-heading">
											<div class="panel-title">
												<i class="entypo-plus-circled"></i>
												<h>Invoice Information</h>
											</div>
										</div>
										<div class="panel-body studentInfo">
										
										<input type="hidden" id="studentId" name="studentId" value=0>
										
											<div class="form-group">
												<label class="col-sm-3 control-label">Student Name</label>
												<div class="col-sm-9">
													<input type="text" disabled class="form-control"
														placeholder="Student Name" id="studentName" value="">
												</div>
											</div>
											<div class="form-group">
												<label for="field-2" class="col-sm-3 control-label">Class</label>
												<div class="col-sm-9">
													<input type="text" disabled id="studentClass"
														class="form-control" placeholder="Student Class" required/>
												</div>
											</div>

											<div class="form-group">
												<label for="field-2" class="col-sm-3 control-label">Section</label>
												<div class="col-sm-9">
													<input type="text" disabled id="studentSection"
														class="form-control" placeholder="Student Section" value=""/>
												</div>
											</div>

											<div class="form-group">
												<label for="date" class="col-sm-3 control-label">Date</label>
												<div class="col-sm-9">
													<input type="date" class="form-control" id="invoiceDate" required
														name="date" data-toggle="tooltip" data-placement="bottom"
														title="Select Paying Date" placeholder="Paying Date" readonly="readonly">
												</div>
											</div>

											<div class="form-group">
												<label for="amount" class="col-sm-3 control-label">Receipt
													#</label>
												<div class="col-sm-9">
													<input type="number" class="form-control" id="receiptNo"
														name="receiptNo" placeholder="Enter Receipt Number"
														data-toggle="tooltip" data-placement="bottom" required
														title="Please Enter Receipt Number">
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="panel panel-primary panel-shadow"
										data-collapsed="0">
										<div class="panel-heading">
											<div class="panel-title">
												<i class="entypo-plus-circled"></i>
												<h>Payment Information</h>
											</div>
										</div>
										<div class="panel-body">
											
											<div class="form-group">
												<label class="col-sm-3 control-label">Fee Behaviour</label>
												
												<label class="checkbox-inline" data-toggle="tooltip"
													data-placement="bottom" title="Select to Add Monthly Fee">
													<input type="checkbox" name="monthlyFee" value="Monthly" checked>Monthly Fee
												</label>
												
												<label class="checkbox-inline" data-toggle="tooltip"
													data-placement="bottom" title="Select to Add Annual Fee">
													<input type="checkbox" name="annualFee" value="Annual">Annual Fee
												</label>
												
												<label class="checkbox-inline" data-toggle="tooltip"
													data-placement="bottom" title="Select to Add Exam Fee">
													<input type="checkbox" name="examFee" value="Exam">Exam Fee
												</label>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">Total Amount</label>
												<div class="col-sm-9">
													<input type="number" class="form-control" name="payment.totalAmount"
														placeholder="Enter Total Amount" required
														data-toggle="tooltip" data-placement="bottom"
														title="Enter Total Fee of Student">
												</div>
											</div>
											
											<div class="form-group">
												<label for="amount" class="col-sm-3 control-label">Payment</label>
												<div class="col-sm-9">
													<input type="number" class="form-control" id="amount" placeholder="Enter Payment Amount"
														data-toggle="tooltip" data-placement="bottom" name="payment.amountPaid" required
														title="Enter Paid Fee of Student">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">Status</label>
												<div class="col-sm-9">
													<select required class="form-control selectboxit visible" name="payment.status"
														data-toggle="tooltip" data-placement="bottom"
														title="Select Paid / Unpaid Status">
														<option disabled value="">Select Status</option>
														<option value="1">Paid</option>
														<option value="0">Unpaid</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5"></div>
								<div class="col-md-5">
									<button type="submit" onsubmit="return addInvoice()" class="btn btn-info" id="addInvoiceBtn"
										data-toggle="tooltip" data-placement="bottom"
										title="Click to Save Record">Add Invoice</button>

								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Cross button of Form -->
<script type="text/javascript">
$('#invoiceDate').datetimepicker({
	 format : 'YYYY/MM/DD',
   ignoreReadonly: true
 });
	
function addInvoice() {
	var empty = false;
    $('.studentInfo input').each(function() {
        if ($(this).val().length == 0) {
            empty = true;
        }
    });
    if (empty) {
        alert("false");
        return false;
    } else {
    	alert("true");
        return true;
    }
}
	
 $("#searchStudentBtn").click(function (){
	 
	  var data= {
			  "searchField": $("#searchStudentField").val(),
			  "searchBy": $("input[name='searchBy']:checked").val()
	  };
	 // data = JSON.stringify(data, null, '\t');
	  
	  $.ajax({
	      type: "POST",
	      url: "${pageContext.request.contextPath}/getallstudentsby",
	      data: data,
	      success: function(returnedData) {
	    	  if(returnedData.length>0){
	  	         returnedData= JSON.stringify(returnedData, null, '\t')
	 	    	  var obj = jQuery.parseJSON(returnedData);
	 	    	  $.each(obj, function(key,value) {
	 	    		 $("#studentId").val(value.id);
	 	    		 $("#studentName").val(value.name);
	 	    		 $("#studentClass").val(value.studentClass);
	 	    		 $("#studentSection").val(value.section);
	 	    	  });
	    	  }else {
	    		  	$("#studentId").val("0");
 	    		 	$("#studentName").val("");
 	    			$("#studentClass").val("");
 	    		 	$("#studentSection").val("");
	    		  $("#errorMsg").html("<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Oops!&nbsp;</strong> No student found.</div>");
	    	  }
	      },
	      error: function(returnedData) {
	    	 // alert("error");
	      }
	  });
  });
	
</script>
