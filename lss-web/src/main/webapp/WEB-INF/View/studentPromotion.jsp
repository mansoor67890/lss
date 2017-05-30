<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<div class="col-md-2"></div>
	<div class="col-md-9">
		<div class="panel panel-primary" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title">
					<i class="entypo-plus-circled"></i>
					<h>Student Promotion</h>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<blockquote class="blockquote-blue">
							<p>
								<strong>Student Promotion Notes</strong>
							</p>
							<p>Promoting student from the present class to the next class
								will create an enrollment of that student to the next session.
								Make sure to select correct class options from the select menu
								before promoting.If you don't want to promote a student to the
								next class, please move to back option. That will not promote
								the student to the next class. He will be remain in the same
								class.</p>
							<b>Thanks!</b>
						</blockquote>
					</div>
				</div>
				<hr>
				<div class="row">
					<form action="#">
						<div class="col-md-6">
							<div class="form-group form-group-sm">
								<label for="firstname" class="control-label">Select Class</label>
								<div class="">
									<select class="form-control" required
									id="className" data-message-required="Value Required"
									name="studentClass" data-placement="bottom"
									title="Please Select Class">
									<option value="" selected="selected">Select Class</option>
									<option value="Play Group">Play Group</option>
										<option value="Nursery">Nursery</option>
									<option value="Prep">Prep</option>
									<option value="One">One</option>
									<option value="Two">Two</option>
									<option value="Three">Three</option>
									<option value="Four">Four</option>
									<option value="Five">Five</option>
									<option value="Six">Six</option>
									<option value="Seven">Seven</option>
									<option value="Eight">Eight</option>
									<option value="Nine">Nine</option>
									<option value="Ten">Ten</option>
								</select>
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group form-group-sm">
								<label for="firstname" class="control-label">Select Section</label>
								<div class="">
									<select name="section" class="form-control" required
										id="sectionName" data-toggle="tooltip"
										data-placement="bottom" title="Please Select Class Section">
										<option value="">Select Class Section</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="E">E</option>
									</select>
								</div>
							</div>
						</div>
					</form>
				</div>
				<hr>
				<div class="row">
					<center>
						<button class="btn btn-info" type="button" id="PromoteStudentsBtn"
							data-toggle="tooltip" data-placement="bottom"
							title="Please click to Manage Promotion">Manage Promotion</button>
					</center>
				</div>
			</div>
		</div>
	</div>
	
	<div id="promoteStudentsDiv">
	</div>

</div>


<script type="text/javascript">

$("#PromoteStudentsBtn").click(function(){
	
	var className=$("#className").val();
	var sectionName=$("#sectionName").val();
	
	if(className=="" || sectionName==""){
		
		toastr.error("Please select both class and section.", "Error!", {
            "timeOut": "3000",
            "progressBar": true,           
            "extendedTImeout": "0"
        });
		
		return false;
	} else
	getStudents(className, sectionName);
});

function getStudents(className, sectionName){
	 $.ajax({
	      type: "GET",
	      url: "${pageContext.request.contextPath}/template/getstudentstopromote/"+className+"/"+sectionName,
	      success: function(returnedData) {
	    	 // alert(returnedData);
	    	 $("#promoteStudentsDiv").html(returnedData);
	      },
	      error: function(returnedData) {
	    	  toastr.error("Something went wrong. Please try again.", "Oops!", {
	              "timeOut": "3000",
	              "progressBar": true,           
	              "extendedTImeout": "0"
	          });
	      }
	  });
	}
</script>