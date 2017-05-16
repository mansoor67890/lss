<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.popup {
	zoom:0.5;
	position:relative;
	text-decoration:none;
}

.popup img {
	height: ;
	height: 100%;
	width: 100%;
}

.popup span {
	position:fixed;
	top:170px;
	left:500px;
	width:350px;
	padding:4px;
	border:2px solid #000;
	border-radius:4px;
	left:-999em;q
	z-index:990;
}
.popup:hover {visibility:visible}
.popup:hover span {left:350px;}
* html .popup span {position:absolute;}

</style>

<div class="container">
	<div class="col-md-12">
	
		<jsp:include page="msgDisplay.jsp"></jsp:include>
		
		<div class="panel panel-default panel-shadow" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title">
					<h4>Student List</h4>
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
								student kindly type student name or roll number below in search box to
								fetch student details and its status.</p>
							<b>Thanks!</b>
						</blockquote>
					</div>
				</div>
				<table class="table table-hover" id="allStudentsTable">
					<thead align="center">
						<tr>
							<th></th>
							<th align="center" style="width: 50px">Roll#</th>
							<th align="center" style="width: 350px">Name</th>
							<th align="center" style="width: 450px">Class</th>
							<th align="center" style="width: 450px">Section</th>
							<th align="center" style="width: 450px">Address</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody style="width: 100%;">
						<c:forEach var="obj" items="${students}">
							<tr>
								<td><a class="popup" href="#"><i class="glyphicon glyphicon-camera"></i><span><img src="${pageContext.request.contextPath}/image/?file=${obj.imageName}"></span></a>
								<td>${obj.rollNumber}</td>
								<td>${obj.name}</td>
								<td>${obj.studentClass}</td>
								<td>${obj.section}</td>
								<td>${obj.address}</td>
								<td><a href="#" id="${obj.id}"
									class="btn btn-sm btn-success editStudent">Edit</a></td>
								<td><a href="#" id="${obj.id}"
									class="btn btn-sm btn-danger deleteStudent">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div id="editStudentModalDiv"></div>

<div class="modal fade" id="errorModal" role="dialog">
   <div class="modal-dialog">
   
           <div class="modal-content" style="margin-top:100px;">
               
               <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true" data-toggle="tooltip" data-placement="bottom"
							title="Click to Close">×</button>
                   <h4 class="modal-title" style="text-align:center;">Are you sure to delete this information ?</h4>
               </div>
               
               
               <div class="modal-footer" style="margin:0px; border-top:0px; text-align:center;">
                   <a href="dashBoard.jsp" class="btn btn-danger" id="delete_link" data-toggle="tooltip" data-placement="bottom"
							title="Click to Delete Record">Delete</a>
                   <button type="button" class="btn btn-info" data-dismiss="modal" data-toggle="tooltip" data-placement="bottom"
							title="Click to Go Back">Cancel</button>
               </div>
           </div>
      </div>
 </div>
 
 
 <div class="modal fade" id="modaldelete" role="dialog">
    <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 48%;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" data-toggle="tooltip" data-placement="bottom"
								title="Click to Close">×</button>
                    <h4 class="modal-title" style="text-align:center;">Are you sure to delete this student?</h4>
                </div>
                <div class="modal-footer" style="margin:0px; border-top:0px; text-align:center;">
                    <a href="#" class="btn btn-danger" id="deleteModalBtn" data-toggle="tooltip" data-placement="bottom"
								data-dismiss="modal" title="Click to Delete Record">Delete</a>
                    <button type="button" class="btn btn-info" data-dismiss="modal" data-toggle="tooltip" data-placement="bottom"
								title="Click to Go Back">Cancel</button>
                </div>
            </div>
       </div>
  </div>
 
 
 <div class="modal fade" id="deleteResponseModal" role="dialog">
    <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 48%;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" data-toggle="tooltip" data-placement="bottom"
								title="Click to Close">×</button>
                    <h3 class="modal-title" id="delResponseBody" style="text-align:center;"></h3>
                </div>
                <div class="modal-footer" style="margin:0px; border-top:0px; text-align:center;">
                    <button id="response" type="button" class="btn btn-default" data-dismiss="modal" data-toggle="tooltip" data-placement="bottom"
								title="Click to Go Back">Ok</button>
                </div>
            </div>
       </div>
  </div>

<script type="text/javascript">
//$("#logoimg img:last-child").remove();

$("#allStudentsTable").dataTable();

$('#allStudentsTable tbody').on('click', '.editStudent', function () {
 var id=this.id;
 //alert(id);
 $.ajax({
      type: "GET",
      url: "${pageContext.request.contextPath}/editstudent/"+id,
      success: function(returnedData) {
    	 // alert(returnedData);
    	  $("#editStudentModalDiv").html(returnedData);
    	  $("#editStudentModal").modal("show");
      },
      error: function(returnedData) {
    	 alert("error");
      }
  });
});

//On click delete button
$('#allStudentsTable tbody').on('click', '.deleteStudent', function () {
	var id=this.id;
	$("#modaldelete").modal('show');
		$("#deleteModalBtn").click(function(e) {
			e.preventDefault();
			//alert("del this: "+ id);
			deleteStudent(id);
		});
	});
	
//delete student ajax call
 function deleteStudent(id){
	 $.ajax({
	      type: "GET",
	      url: "${pageContext.request.contextPath}/deletestudent/"+id,
	      success: function(returnedData) {
	    	 // alert(returnedData);
	    	  $("#delResponseBody").html(returnedData);
	    	  $("#deleteResponseModal").modal("show");
	      },
	      error: function(returnedData) {
	    	 alert("error");
	      }
	  });
	}
 
	$('#deleteResponseModal').on('hidden.bs.modal', function() {
		location.assign("${pageContext.request.contextPath}/allstudents");
		location.reload();
	});
	
</script>