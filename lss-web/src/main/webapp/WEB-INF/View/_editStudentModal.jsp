<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="editStudentModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					data-toggle="tooltip" data-placement="bottom"
					title="Click to Close">&times;</button>
				<h4 class="modal-title">Edit</h4>
			</div>
			<div class="col-md-12">
				<div class="panel panel-default panel-shadow" data-collapsed="0">
					<div class="panel-heading">
						<div class="panel-title">
							<h>Edit Student Information</h>
						</div>
					</div>
					<div class="panel-body">

						<form action="editstudent" enctype="multipart/form-data"
							class="form-horizontal form-groups-bordered validate"
							method="post">
							
							<input type="hidden" value="${student.id}" name="id"/>
							
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">Student
									Name</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="name" id="sname"
										required data-message-required="Value Required" value="${student.name}"
										placeholder="Student Name" data-toggle="tooltip"
										data-placement="bottom" title="Enter Student Name">
								</div>
							</div>
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">Father
									Name</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="fatherName"
										id="fname" required data-message-required="Value Required"
										value="${student.fatherName}" placeholder="Father Name" data-toggle="tooltip"
										data-placement="bottom" title="Enter Student Father Name">
								</div>
							</div>
							<div class="form-group">
								<label for="field-2" class="col-sm-3 control-label">Class</label>
								<div class="col-sm-8">
									<select class="form-control" required id="classId"
										data-message-required="Value Required" name="studentClass"
										data-placement="bottom" title="Please Select Class">
										<option disabled value="-1">Select Class</option>
										<option ${student.studentClass == 'Play Group' ? 'selected' : ''} value="Play Group">Play Group</option>
										<option ${student.studentClass == 'Nursery' ? 'selected' : ''} value="Nursery">Nursery</option>
										<option ${student.studentClass == 'Prep' ? 'selected' : ''} value="Prep">Prep</option>
										<option ${student.studentClass == 'One' ? 'selected' : ''} value="One">One</option>
										<option ${student.studentClass == 'Two' ? 'selected' : ''} value="Two">Two</option>
										<option ${student.studentClass == 'Three' ? 'selected' : ''} value="Three">Three</option>
										<option ${student.studentClass == 'Four' ? 'selected' : ''} value="Four">Four</option>
										<option ${student.studentClass == 'Five' ? 'selected' : ''} value="Five">Five</option>
										<option ${student.studentClass == 'Six' ? 'selected' : ''} value="Six">Six</option>
										<option ${student.studentClass == 'Seven' ? 'selected' : ''} value="Seven">Seven</option>
										<option ${student.studentClass == 'Eight' ? 'selected' : ''} value="Eight">Eight</option>
										<option ${student.studentClass == 'Nine' ? 'selected' : ''} value="Nine">Nine</option>
										<option ${student.studentClass == 'Ten' ? 'selected' : ''} value="Ten">Ten</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="field-2" class="col-sm-3 control-label">Section</label>
								<div class="col-sm-8">
									<select name="section" class="form-control" required
										id="section_selector_holder" data-toggle="tooltip"
										data-placement="bottom" title="Please Select Class Section">
										<option value="">Select Class Section</option>
										<option ${student.section == 'A' ? 'selected' : ''} value="A">A</option>
										<option ${student.section == 'B' ? 'selected' : ''} value="B">B</option>
										<option ${student.section == 'C' ? 'selected' : ''} value="C">C</option>
										<option ${student.section == 'D' ? 'selected' : ''} value="D">D</option>
										<option ${student.section == 'E' ? 'selected' : ''} value="E">E</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="field-2" class="col-sm-3 control-label">Roll
									Number</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="Roll Number" name="rollNumber"
										data-toggle="tooltip" data-placement="bottom" required value="${student.rollNumber}"
										title="Enter Student Roll Number">
								</div>
							</div>
							<div class="form-group">
								<label for="date" class="col-sm-3 control-label">Date of
									Birth</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="dob" name="dob" value="${student.dob}"
										required data-toggle="tooltip" data-placement="bottom"
										title="Enter Date of Birth" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label for="field-2" class="col-sm-3 control-label">Gender</label>
								<div class="col-sm-8">
									<select name="gender" id="gender" required
										class="form-control selectboxit visible"
										name="gender" data-toggle="tooltip" data-placement="bottom"
										title="Please Select Gender">
										<option value="">Select</option>
										<option ${student.gender == 'male' ? 'selected' : ''} value="male">Male</option>
										<option ${student.gender == 'female' ? 'selected' : ''} value="female">Female</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="field-2" class="col-sm-3 control-label">Phone</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="phone" required
										id="phone" placeholder="Student Phone Number" value="${student.phone}"
										data-toggle="tooltip" data-placement="bottom"
										title="Enter Student Phone Number">
								</div>
							</div>
							<div class="form-group">
								<label for="transport_id" class="col-sm-3 control-label">Transport
									Route</label>
								<div class="col-sm-8">
									<select name="transportRoute" id="transport_id" required
										class="form-control selectboxit visible"
										data-placement="bottom" title="Please Select Transport Route">
										<option value="">Select</option>
										<option ${student.transportRoute == 'Local Conveyance' ? 'selected' : ''} value="Local Conveyance">Local Conveyance</option>
										<option ${student.transportRoute == 'Pick and Drop' ? 'selected' : ''} value="Pick and Drop">Pick and Drop</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="field-2" class="col-sm-3 control-label">Select
									Image</label>
								<div class="col-sm-8">
									<div class="input-group image-preview">
										<input type="text" class="form-control image-preview-filename"
											disabled="disabled" placeholder="Select Student Photo"
											data-toggle="tooltip" data-placement="bottom"
											title="Please Upload Student Photo">
										<!-- don't give a name === doesn't send on POST/GET -->
										<span class="input-group-btn"> <!-- image-preview-clear button -->
											<button type="button"
												class="btn btn-default image-preview-clear"
												style="display: none;" data-toggle="tooltip"
												data-placement="bottom" title="Click to Remove/Change Photo">
												<span class="glyphicon glyphicon-remove"></span> Clear
											</button> <!-- image-preview-input --> <span
											class="btn btn-default image-preview-input"> <span
												class="glyphicon glyphicon-folder-open"></span> <span
												class="image-preview-input-title">Browse</span> <input
												type="file" accept="image/png, image/jpeg, image/gif, image/jpg"
												name="imageToUpload" /> <!-- rename it -->
										</span>
										</span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="field-2" class="col-sm-3 control-label">Address</label>
								<div class="col-sm-8">
									<textarea class="form-control" name="address" name="address"
										placeholder="Enter Address..." required data-placement="bottom" title="Enter Student Address">${student.address}</textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-8">
									<button type="submit" class="btn btn-info"
										title="Click to Update Student Information" id="addStudentBtn">Update</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					data-toggle="tooltip" data-placement="bottom"
					title="Click to Close">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$('#dob').datetimepicker({
	format : 'YYYY/MM/DD',
	ignoreReadonly : true
});
</script>


