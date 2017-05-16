<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${not empty errorMsg}">
		<div class='alert alert-danger alert-dismissible' role='alert'>
			<button type='button' class='close' data-dismiss='alert'
				aria-label='Close'>
				<span aria-hidden='true'>&times;</span>
			</button>
			<strong>Oops!&nbsp;</strong>${errorMsg}
		</div>
	</c:when>
	<c:when test="${not empty successMsg}">
		<div class='alert alert-success alert-dismissible' role='alert'>
			<button type='button' class='close' data-dismiss='alert'
				aria-label='Close'>
				<span aria-hidden='true'>&times;</span>
			</button>
			<strong>Yay!&nbsp;</strong>${successMsg}
		</div>
	</c:when>
</c:choose>