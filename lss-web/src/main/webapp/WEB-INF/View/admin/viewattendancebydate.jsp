<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<br>
<div class="container">
	<div class="row">
	<form class="form-horizontal" name="dateForm" action="getattendancepage"
			method="post">
		<div class="form-group">
				<label class="col-md-1 control-label">Select Date</label>
				<div class="col-md-5">
					<input type='text' name="date" class="form-control"
						id='datetimepicker4' />
				</div>
				<input class="btn btn-default" value="Edit Attendance" type="submit">
			</div>
			
	</form>
	</div>
	<div>
		<script type="text/javascript">
	
			$(function() {
				var dateToday = (new Date()).format('yyyy/mm/dd');
				
				$('#datetimepicker4').datetimepicker({
					 timepicker: false,
					 format:'Y/m/d',
					 value: dateToday
					});
			});
			

			$('.all').click(
					function(e) {
						e.stopPropagation();
						var $this = $(this);
						if ($this.is(":checked")) {
							$this.parents('.table-bordered').find(".present")
									.prop("checked", true);
						} else {
							$this.parents('.list-group').find(".absent").prop(
									"checked", false);
							$this.prop("checked", false);
						}
						$('[type=checkbox]').click(function(e) {
							e.stopPropagation();
						});
					});
			$('.allAbsent').click(
					function() {
						var $this = $(this);
						if ($this.is(":checked")) {
							$this.parents('.table-bordered').find(".absent")
									.prop("checked", true);
						}
					});
		</script>
	</div>
</div>