<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="panel-body">
	<div class="row">
		<form class="form-horizontal" action="promotestudents" method="post"
			id="myForm">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<div class="panel panel-primary" data-collapsed="0">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="entypo-plus-circled"></i>
							<h>Students List</h>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-hover" id="tablebg" style="width: 100%;">
							<thead align="center">
								<tr>
									<th align="center"><input id="promoteAll" type="checkbox"/><label for="promoteAll"> Select All</label></th>
									<th align="center">Roll#</th>
									<th align="center">Name</th>
									<th align="center">Class</th>
									<th align="center">Section</th>
									<th align="center">Options</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach varStatus="emp" var="student" items="${studentPromotionForm.studentList}">
									<tr class="item">
										<td align="center"><input type="checkbox"
												onclick="document.getElementById('studentList[${emp.index}].id').disabled = false;"
												name="studentList[${emp.index}].id"
												class="promoteStudent" value="${student.id}" /></td>
										<td><input type="hidden" name="studentList[${emp.index}].rollNumber" value="${student.rollNumber}">${student.rollNumber}</td>
										<td><input type="hidden" name="studentList[${emp.index}].name" value="${student.name}">${student.name}</td>
										<td><input type="hidden" value="${student.studentClass}">${student.studentClass}</td>
										<td><input type="hidden" name="studentList[${emp.index}].section" value="${student.section}">${student.section}</td>
										<td><div class="col-md-12">
												<div class="">
													<select name="studentList[${emp.index}].studentClass"
														class="form-control selectboxit visible" style="display:"
														autofocus data-toggle="tooltip" data-placement="bottom"
														title="Please Select Class to Promote">
														<option value="">Select Promotion Class</option>
														<option value="Play Group">Enroll To Play Group</option>
														<option value="Nursery">Enroll To Nursery</option>
														<option value="Prep">Enroll To Prep</option>
														<option value="One">Enroll To One</option>
														<option value="Two">Enroll To Two</option>
														<option value="Three">Enroll To Three</option>
														<option value="Four">Enroll To Four</option>
														<option value="Five">Enroll To Five</option>
														<option value="Six">Enroll To Six</option>
														<option value="Seven">Enroll To Seven</option>
														<option value="Eight">Enroll To Eight</option>
														<option value="Nine">Enroll To Nine</option>
														<option value="Ten">Enroll To Ten</option>
													</select>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<hr>
					<center>
						<button type="submit" class="btn btn-success"
							style="margin-top: 0; margin-bottom: 15px;" autofocus
							data-toggle="tooltip" data-placement="bottom"
							title="Please Click to Promote">
							<i class="glyphicon glyphicon-ok"></i> Promote Selected Students
						</button>
					</center>
				</div>
			</div>
		</form>
	</div>
</div>


<script type="text/javascript">
$("#promoteAll").change(function(e) {
//	e.stopPropagation();
	var $this = $(this);
	if ($this.is(":checked")) {
		$this.parents('.table-hover').find(".promoteStudent").prop("checked", true);
	} else {
		$this.parents('.table-hover').find(".promoteStudent").prop("checked", false);
	}
	$('[type=checkbox]').click(function(e) {
		e.stopPropagation();
	});
});
</script>