<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<br>

<br>
<br>

<div class="ui container">
	<c:choose>
			<c:when test="${not empty error}">
				<c:choose>
				<c:when test="${error}!=failed">
					<div class="ui negative message transition visible">
						<i class="close icon"></i>
						<div class="header">We're sorry... Please try again!</div>
						<p>${msg}</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="ui positive message transition visible">
						<i class="close icon"></i>
						<div class="header">Yay...</div>
						<p>${msg} &nbsp; <a class="ui button positive" href="${pageContext.request.contextPath}/suppliertypes" >See All</a></p>
					</div>
				</c:otherwise>
			</c:choose>
			</c:when>
	</c:choose>

	<div class="row">
		<div class="ui segment">
			<h2>Add Supplier Type</h2>
			<p>You can add new Supplier Type here.</p>
			<div class="ui dividing header"></div>
			<form class="ui form" method="post" action="addsuppliertype" id="addsuppliertype">
				<div class="field">
					<input required placeholder="Name" class="form-control" type="text"
						name="name">
				</div>
				<div class="field">
					<input type="submit" class="ui button" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$('.message .close')
.on('click', function() {
  $(this)
    .closest('.message')
    .transition('fade');
});

$(document).ready(function() {
    $("body").prepend('<div class="ui active dimmer" style="z-index: 1001; display: none;"><div class="ui text loader">loading</div></div>');
});

$('#addsuppliertype').submit(function() {
    var pass = true;
    //some validations

    if(pass == false){
        return false;
    }
    $(".dimmer").show();
	
    return true;
});


</script>