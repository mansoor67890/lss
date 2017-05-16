<style>

.container{
    margin-top:20px;
}
.image-preview-input {
    position: relative;
	overflow: hidden;
	margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.image-preview-input-title {
    margin-left:2px;
}

</style>
<div class="container">
	<div class="col-md-2"></div>
	<div class="col-md-9">
		<jsp:include page="msgDisplay.jsp"></jsp:include>
		<div class="panel panel-primary" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title">
					<i class="entypo-plus-circled"></i>
					<h>Addmission Form</h>
				</div>
			</div>
			<div class="panel-body">
			
				<form action="addstudent" enctype="multipart/form-data" class="form-horizontal form-groups-bordered validate" method="post">
					<div class="form-group">
						<label for="field-1" class="col-sm-3 control-label">Student
							Name</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="name" id="sname"
								required data-message-required="Value Required"
								value="" placeholder="Student Name" data-toggle="tooltip"
								data-placement="bottom" title="Enter Student Name">
						</div>
					</div>
					<div class="form-group">
						<label for="field-1" class="col-sm-3 control-label">Father
							Name</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="fatherName"
								id="fname" required
								data-message-required="Value Required" value=""
								placeholder="Father Name" data-toggle="tooltip"
								data-placement="bottom" title="Enter Student Father Name">
						</div>
					</div>
					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label">Class</label>
						<div class="col-sm-8">
							<select class="form-control" required
								id="classId" data-message-required="Value Required"
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

					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label">Section</label>
						<div class="col-sm-8">
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

					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label">Roll
							Number</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="roll"
								placeholder="Roll Number" name="rollNumber"
								data-toggle="tooltip" data-placement="bottom" required title="Enter Student Roll Number">
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-3 control-label">Date of
							Birth</label>
						<div class="col-sm-8">
							<input type="date" class="form-control" id="dob" name="dob" required readonly
								data-toggle="tooltip" data-placement="bottom" title="Enter Date of Birth">
						</div>
					</div>
					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label">Gender</label>
						<div class="col-sm-8">
							<select name="gender" id="gender" required
								class="form-control selectboxit visible" style="display:"
								name="gender" data-toggle="tooltip" data-placement="bottom"
								title="Please Select Gender">
								<option value="">Select</option>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label">Phone</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="phone" required
								id="phone" placeholder="Student Phone Number"
								data-toggle="tooltip" data-placement="bottom"
								title="Enter Student Phone Number">
						</div>
					</div>
					<div class="form-group">
						<label for="transport_id" class="col-sm-3 control-label">Transport
							Route</label>
						<div class="col-sm-8">
							<select name="transportRoute" id="transport_id" required
								class="form-control selectboxit visible" data-placement="bottom"
								title="Please Select Transport Route">
								<option value="">Select</option>
								<option value="Local Conveyance">Local Conveyance</option>
								<option value="Pick and Drop">Pick and Drop</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label">Select
							Image</label>
						<div class="col-sm-8">
							<div class="input-group image-preview">
                <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                <span class="input-group-btn">
                    <!-- image-preview-clear button -->
                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                        <span class="glyphicon glyphicon-remove"></span> Clear
                    </button>
                    <!-- image-preview-input -->
                    <div class="btn btn-default image-preview-input">
                        <span class="glyphicon glyphicon-folder-open"></span>
                        <span class="image-preview-input-title">Browse</span>
                        <input type="file" accept="image/png, image/jpeg, image/gif, image/jpg" name="imageToUpload"/> <!-- rename it -->
                    </div>
                </span>
            </div>
						</div>
					</div>

					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label">Address</label>
						<div class="col-sm-8">
							<textarea class="form-control" name="address" name="address" placeholder="Enter Address..."
								required data-placement="bottom"
								title="Enter Student Address"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-8">
							<button type="submit" class="btn btn-info"
								title="Click to Add Student" id="addStudentBtn">Add
								Student</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	 $('#dob').datetimepicker({
		 format : 'YYYY/MM/DD',
	    ignoreReadonly: true
	  });
	 
	$(document).on('click', '#close-preview', function(){ 
	    $('.image-preview').popover('hide');
	    // Hover befor close the preview
	    $('.image-preview').hover(
	        function () {
	           $('.image-preview').popover('show');
	        }, 
	         function () {
	           $('.image-preview').popover('hide');
	        }
	    );    
	});

	$(function() {
	    // Create the close button
	    var closebtn = $('<button/>', {
	        type:"button",
	        text: 'x',
	        id: 'close-preview',
	        style: 'font-size: initial;',
	    });
	    closebtn.attr("class","close pull-right");
	    // Set the popover default content
	    $('.image-preview').popover({
	        trigger:'manual',
	        html:true,
	        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
	        content: "There's no image",
	        placement:'bottom'
	    });
	    // Clear event
	    $('.image-preview-clear').click(function(){
	        $('.image-preview').attr("data-content","").popover('hide');
	        $('.image-preview-filename').val("");
	        $('.image-preview-clear').hide();
	        $('.image-preview-input input:file').val("");
	        $(".image-preview-input-title").text("Browse"); 
	    }); 
	    // Create the preview image
	    $(".image-preview-input input:file").change(function (){     
	        var img = $('<img/>', {
	            id: 'dynamic',
	            width:250,
	            height:200
	        });      
	        var file = this.files[0];
	        var reader = new FileReader();
	        // Set preview image into the popover data-content
	        reader.onload = function (e) {
	            $(".image-preview-input-title").text("Change");
	            $(".image-preview-clear").show();
	            $(".image-preview-filename").val(file.name);            
	            img.attr('src', e.target.result);
	            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
	        }        
	        reader.readAsDataURL(file);
	    });  
	});
</script>
