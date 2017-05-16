<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-9">
			<div class="panel panel-primary" data-collapsed="0">
				<div class="panel-heading">
					<div class="panel-title">
						<i class="entypo-plus-circled"></i>
						<h4>Student Information / Details</h4>
					</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<blockquote class="blockquote-blue">
								<p>
									<strong>Student Information / Details</strong>
								</p>
								<p>For checking out the status or information about any
									student kindly type student roll number below in search box to
									fetch student details and its status. Roll number of student
									should be in integer (Numeric) format.</p>
								<b>Thanks!</b>
							</blockquote>
						</div>
					</div>
					<hr>
					<div id="errorMsg"></div>
					<div class="row">
						<br />
						<form id="togglingForm" method="post" class="form-horizontal">
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
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-9">
			<div class="panel panel-default panel-shadow" data-collapsed="0" id="studentInfoPanel" style="display: none;">
				<div class="panel-heading">
					<div class="panel-title">
						<h4>Students</h4>
					</div>
				</div>
				<div class="panel-body">

					<table class="table table-bordered" id="viewinvoicetable">
						<thead align="center">
							<tr>
								<th align="center" style="width: 50px">Roll#</th>
								<th align="center" style="width: 350px">Name</th>
								<th align="center" style="width: 450px">Class</th>
								<th align="center" style="width: 450px">Section</th>
								<th align="center" style="width: 450px">Address</th>
							</tr>
						</thead>
						<tbody style="width: 100%;"  id="studentTable">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	
  
  $("#searchStudentBtn").click(function (){
	  
	  var data= {
			  "searchField": $("#searchStudentField").val(),
			  "searchBy": $("input[name='searchBy']:checked").val()
	  };
	 // data = JSON.stringify(data, null, '\t');
	// alert(data);
	  
	  $.ajax({
	      type: "POST",
	      url: "${pageContext.request.contextPath}/getallstudentsby",
	      data: data,
	      success: function(returnedData) {
	    	  
	    	  if(returnedData.length>0){
	    		  $('#studentInfoPanel').show();
	  	         returnedData= JSON.stringify(returnedData, null, '\t')
	 	    	  var obj = jQuery.parseJSON(returnedData);
	 	    	  $.each(obj, function(key,value) {
	 	    		  $("#studentTable").html("<tr><td>"+value.rollNumber+"</td><td>"+value.name+"</td><td>"+value.studentClass+"</td><td>"+value.section+"</td><td>"+value.address+"</td>");
	 	    	  });
	    	  }else {
	    		  $("#errorMsg").html("<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Oops!&nbsp;</strong> No student found.</div>");
	    	  }
	      },
	      error: function(returnedData) {
	    	 // alert("error");
	      }
	  });
  });
  
  
  
  </script>

