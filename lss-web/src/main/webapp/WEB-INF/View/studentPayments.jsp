<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="studentpaymentsform">
  <div class="container">
    <div class="col-md-2"></div>
    <div class="col-md-10">
      <div class="panel panel-primary" data-collapsed="0">
        <div class="panel-heading">
          <div class="panel-title">
            <i class="entypo-plus-circled"></i>
            <h>Student Payments</h>
          </div>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="col-md-12">
              <blockquote class="blockquote-blue">
                <p>
                  <strong>Student Payments Information</strong>
                </p>
                <p>To get student fee information first select class and then select section of following class.</p>
                <b>Thanks!</b>
              </blockquote>
            </div>
          </div>
          <div class="row">
	          <div id="paymentModalDiv"></div>
	          <div id="paymentHistoryModalDiv"></div>
          </div>
          <hr>
			<!-- Search students -->
			<div class="form-group">
		           <div class="row">
		             <div class="col-md-5">
		               <label for="field-2" class="col-sm-2 control-label">Class</label>
		               <div class="col-sm-10">
		                 <select name="classId" class="form-control" data-validate="required" id="findByClass" data-message-required="Value Required" data-toggle="tooltip" data-placement="bottom" title="Please Select Class">
		                   <option value="-1">All Classes</option>
		                   <option value="Play Group">Play Group</option>
		                   <option value="Nursery">Nursery</option>
		                   <option value="Prep">Prep</option>
		                   <option value="One">One</option>
		                   <option value="2">Two</option>
		                   <option value="Two">Three</option>
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
		              <div class="col-md-5">
		               <label for="field-2" class="col-sm-2 control-label">Section</label>
		               <div class="col-sm-10">
		                <select name="sectionId" class="form-control findBySection" id="findBySection" data-toggle="tooltip" data-placement="bottom" title="Please Select Class Section">
		                     <option value="-1">All Sections</option>
		                     <option value="A">A</option>
		                     <option value="B">B</option>
		                     <option value="C">C</option>
		                     <option value="D">D</option>
		                     <option value="E">E</option>
		                   </select>
		               </div>
		             </div>
		             <div class="col-md-2"></div>
		           </div>
		        </div>
            
            <div class="row">
              <div class="panel-body">
                <div class="col-md-12">
                <jsp:include page="msgDisplay.jsp"></jsp:include>
                  <ul class="nav nav-tabs bordered">
                    <li class="active">
                      <a href="#unpaid" data-toggle="tab">
                        <span class="hidden-xs">Student List</span>
                      </a>
                    </li>
                  </ul>


                  <div class="tab-content">
                    <br>
                    <div class="tab-pane active">
                    	<div id="studentPaymentTableDiv">
                        <table class="table table-hover dataTable" id="studentPaymentTable">
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
									<td><fmt:formatDate value="${obj.invoice.date}" type="date" dateStyle="long"/></td>
									<c:choose>
										<c:when test="${obj.status eq 'true'}">
											<td><a href="#"
												class="btn btn-sm btn-success toastrCheck">Paid</a></td>
										</c:when>
										<c:otherwise>
											<td><a href="#"
												class="btn btn-sm btn-danger">Unpaid</a></td>
										</c:otherwise>
									</c:choose>
								<td>
								
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-md dropdown-toggle"
										data-toggle="dropdown" id="actionbtn" data-toggle="tooltip"
										data-placement="bottom" title="Click to Open Action Menu">
										Action <span class="caret"></span>
									</button>
									<ul class="dropdown-menu dropdown-default pull-right" role="menu"
										id="actionbtnul">
										<c:choose>
											<c:when test="${obj.status eq 'false'}">
												<li><a href="#" data-toggle="modal" id="${obj.id}"
													class="takePayment"
													data-toggle="tooltip" data-placement="bottom"
													title="Click to Open Take Payment Form"> <i
														class="glyphicon glyphicon-bookmark"></i> Take Payment
												</a></li>
												<li class="divider"></li>
												<li><a href="#" data-toggle="tooltip" data-placement="bottom"
											title="Click to View Payment History" class="viewPaymentHistory" id="${obj.student.id}"> <i
												class="glyphicon glyphicon-list-alt"></i> View History
											</a></li>
												</c:when>
											<c:otherwise>
											<li><a href="#" data-toggle="tooltip" data-placement="bottom"
											title="Click to View Payment History" class="viewPaymentHistory" id="${obj.student.id}"> <i
												class="glyphicon glyphicon-list-alt"></i> View History
											</a></li>
											</c:otherwise>
											
										</c:choose>
										
									</ul>
								</div>
								</td>								
							</tr>
							</c:forEach>
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
  </div>
</div>

<script type="text/javascript">

$("#studentPaymentTable").dataTable();

$("#findByClass,#findBySection").change(function() {
	  var classId = $('#findByClass').find(":selected").val();
	  var section = $('#findBySection').find(":selected").val();
	  
	  if(classId=='-1'){
		  classId="all";
	  }
	  if(section=='-1'){
		  section="all";
	  }
	  
	  $.ajax({
	      type: "GET",
	      url: "${pageContext.request.contextPath}/getpaymentbyclass/"+classId +"/"+ section,
	      success: function(msg) {
	    	  $("#studentPaymentTableDiv").html(msg);
	    	  //alert(msg);
	      },
	      error: function(returnedData) {
	    	// alert("error");
	      }
	  });
	}); 
	
	$(".takePayment").click(function (){
		var paymentId=this.id;
		//alert(paymentId);
		 $.ajax({
		      type: "GET",
		      url: "${pageContext.request.contextPath}/takepayment/"+paymentId,
		      success: function(res) {
		    	 // alert(res);
		    	  $("#paymentModalDiv").html(res);
		    	  $("#takePaymentModal").modal("show");
		      },
		      error: function() {
		    	// alert("error");
		      }
		  });
	});
	
	$(".viewPaymentHistory").click(function (){
		var studentId=this.id;
		//alert(studentId);
		 $.ajax({
		      type: "GET",
		      url: "${pageContext.request.contextPath}/viewpaymentshistory/"+studentId,
		      success: function(res) {
		    	 // alert(res);
		    	  $("#paymentHistoryModalDiv").html(res);
		    	  $("#paymentHistoryModal").modal("show");
		      },
		      error: function() {
		    	// alert("error");
		      }
		  });
	});
</script>
