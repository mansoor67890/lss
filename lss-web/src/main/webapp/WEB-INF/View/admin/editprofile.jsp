<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.Absolute-Center {
	margin: auto;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
}
.Absolute-Center.is-Responsive {
	width: 50%;
	height: 50%;
	min-width: 200px;
	max-width: 400px;
	padding: 40px;
}
</style>
<div class="container">
	<div class="col-md-5">
		<div class="Absolute-Center">
			<div class="form-area">
				<form role="form" method="post" action="${pageContext.request.contextPath}/admin/editprofile/${employee.code}">
					<br style="clear: both">
					<h3 style="margin-bottom: 25px; text-align: center">Edit
						Profile</h3>
					<div class="form-group">
						<label>Name</label> <input type="text" class="form-control"
							name="name" placeholder="${employee.name}"
							value="${employee.name}" required>
					</div>

					<div class="form-group">
						<label>Father's Name</label> <input type="text"
							class="form-control" name="fathersName"
							placeholder="${employee.employeeDetails.fathersName}"
							value="${employee.employeeDetails.fathersName}" required>
					</div>

					<div class="form-group">
						<label>NIC No.</label> <input type="text" class="form-control"
							name="nicNo" placeholder="${employee.employeeDetails.nic}"
							value="${employee.employeeDetails.nic}" required>
					</div>

					<div class="form-group">
						<label>Email</label> <input type="email" class="form-control"
							name="email" placeholder="${employee.email}"
							value="${employee.email}" required>
					</div>
					<label>Department Name</label>
					<div class="form-group">
						<input type="text" class="form-control" name="department"
							placeholder="${employee.department.name}"
							value="${employee.department.name}" required>
					</div>

					<div class="form-group">
						<label>Gender</label>
						<c:choose>
							<c:when test="${employee.employeeDetails.gender eq 'male'}">
								<select name="gender">
									<option>${employee.employeeDetails.gender}</option>
									<option>female</option>
								</select>
							</c:when>
							<c:when test="${empty employee.employeeDetails.gender}">
								<select name="gender">
									<option>male</option>
									<option>female</option>
								</select>
							</c:when>
							<c:otherwise>
								<label>Gender</label>
								<select name="gender">
									<option>${employee.employeeDetails.gender}</option>
									<option>male</option>
								</select>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<label>Employee Status</label>
							<select class="form-control" name="employmentStatus"
							style="width: 243px;" autocomplete="off"><option
								value="${employee.employeeDetails.employmentStatus}">Select Status</option>
							<option>Active</option>
							<option>In-Active</option> </select>
					</div>

					<div class="form-group">
						<label>Mobile No.</label> <input type="text" class="form-control"
							name="mobileNo"
							placeholder="${employee.employeeDetails.mobileNo}"
							value="${employee.employeeDetails.mobileNo}" required>
					</div>
					<div class="form-group">
						<label>Phone No.</label> <input type="text" class="form-control"
							name="phoneNo" placeholder="${employee.employeeDetails.phoneNo}"
							value="${employee.employeeDetails.phoneNo}" required>
					</div>
					<div class="form-group">
						<label>Blood Group</label> <input type="text" class="form-control"
							name="bloodGroup"
							placeholder="${employee.employeeDetails.bloodGroup}"
							value="${employee.employeeDetails.bloodGroup}" required>
					</div>
					<div class="form-group">

						<label>City</label>
						<select class="form-control" name="city"
							style="width: 243px;" autocomplete="off">
							<option	value="${employee.employeeDetails.city}" disabled>Select City</option>
							<option>Islamabad</option>
							<option>Karachi</option>
							<option>Lahore</option>
							<option>Rawalpindi</option>
							<option disabled>------------------------------------------------------</option>
							<option>Abbottabad</option>
							<option>Arifwala</option>
							<option>Astore</option>
							<option>Attock</option>
							<option>Awaran</option>
							<option>Badin</option>
							<option>Bagh</option>
							<option>Bahawalnagar</option>
							<option>Bahawalpur</option>
							<option>Bannu</option>
							<option>Bhakkar</option>
							<option>Bhimber</option>
							<option>Burewala</option>
							<option>Chaghi</option>
							<option>Chakwal</option>
							<option>Chichawatni</option>
							<option>Chiniot</option>
							<option>Chitral</option>
							<option>Chunian</option>
							<option>Dadu</option>
							<option>Daska</option>
							<option>Depalpur</option>
							<option>Dera Ghazi Khan</option>
							<option>Dera Ismail Khan</option>
							<option>Duniya Pur</option>
							<option>FATA</option>
							<option>Faisalabad</option>
							<option>Fateh Jang</option>
							<option>Galyat</option>
							<option>Ghotki</option>
							<option>Gilgit</option>
							<option>Gujar Khan</option>
							<option>Gujranwala</option>
							<option>Gujrat</option>
							<option>Gwadar</option>
							<option>Hafizabad</option>
							<option>Haripur</option>
							<option>Haroonabad</option>
							<option>Hasan Abdal</option>
							<option>Hub (Hub Chowki)</option>
							<option>Hunza</option>
							<option>Hyderabad</option>
							<option>Islamabad</option>
							<option>Jacobabad</option>
							<option>Jauharabad</option>
							<option>Jhang</option>
							<option>Jhelum</option>
							<option>Kaghan</option>
							<option>Kalat</option>
							<option>Karachi</option>
							<option>Karak</option>
							<option>Kasur</option>
							<option>Khairpur</option>
						<option>Khanewal</option>
							<option>Kharian</option>
							<option>Khushab</option>
							<option>Khuzdar</option>
							<option>Kohat</option>
							<option>Kot Addu</option>
							<option>Kotli</option>
							<option>Lahore</option>
							<option>Lalamusa</option>
							<option>Larkana</option>
							<option>Lasbela</option>
							<option>Layyah</option>
							<option>Lodhran</option>
							<option>Loralai</option>
							<option>Mailsi</option>
							<option>Makran</option>
							<option>Malakand</option>
							<option>Mandi Bahauddin</option>
							<option>Mansehra</option>
							<option>Mardan</option>
							<option>Matiari</option>
							<option>Mian Channu</option>
							<option>Mianwali</option>
							<option>Mingora</option>
							<option>Mirpur</option>
							<option>Mirpur Khas</option>
							<option>Multan</option>
							<option>Murree</option>
							<option>Muzaffarabad</option>
							<option>Muzaffargarh</option>
							<option>Nankana Sahib</option>
							<option>Naran</option>
							<option>Narowal</option>
							<option>Nasirabad</option>
							<option>Naushahro Feroze</option>
							<option>Nawabshah</option>
							<option>Neelum</option>
							<option>Nowshera</option>
							<option>Okara</option>
							<option>Others</option>
							<option>Others Azad Kashmir</option>
							<option>Others Balochistan</option>
							<option>Others Gilgit Baltistan</option>
							<option>Others Khyber Pakhtunkhwa</option>
							<option>Others Punjab</option>
							<option>Others Sindh</option>
							<option>Pakpattan</option>
							<option>Peshawar</option>
							<option>Pir Mahal</option>
							<option>Quetta</option>
							<option>Rahim Yar Khan</option>
							<option>Rajanpur</option>
							<option>Ratwal</option>
							<option>Rawalakot</option>
							<option>Rawalpindi</option>
							<option>Rohri</option>
							<option>Sadiqabad</option>
							<option>Sahiwal</option>
							<option>Sanghar</option>
							<option>Sargodha</option>
							<option>Sehwan</option>
							<option>Shahdadpur</option>
							<option>Sheikhupura</option>
							<option>Shikarpur</option>
							<option>Sialkot</option>
							<option>Sibi</option>
							<option>Skardu</option>
							<option>Sudhnoti</option>
							<option>Sukkur</option>
							<option>Swabi</option>
							<option>Swat</option>
							<option>Tando Adam</option>
							<option>Taxila</option>
							<option>Thatta</option>
							<option>Toba Tek Singh</option>
							<option>Vehari</option>
							<option>Wah</option>
							<option>Wazirabad</option>
							<option>Waziristan</option>
							<option>Zhob</option></select>
					</div>
					<div class="form-group">
						<label>Address</label>
						<textarea class="form-control" id="message" name="address"
							placeholder="${employee.employeeDetails.address}" maxlength="240"
							rows="7">${employee.employeeDetails.address}</textarea>
						<span class="help-block"><p id="characterLeft"
								class="help-block ">You have reached the limit</p></span>
					</div>
					<input type="hidden" name="code" placeholder="${employee.code}">
					<button type="submit" id="btnSubmit" name="submit"
						class="btn btn-primary pull-right">Update user</button>
				</form>
			</div>
		</div>
	</div>
</div>

<div>
<script type="text/javascript">


$(document).ready(function(){ 
    $('#characterLeft').text('240 characters left');
    $('#message').keydown(function () {
        var max = 240;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft').text('You have reached the limit');
            $('#characterLeft').addClass('red');
            $('#btnSubmit').addClass('disabled');            
        } 
        else {
            var ch = max - len;
            $('#characterLeft').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft').removeClass('red');            
        }
    });    
});
</script>
</div>