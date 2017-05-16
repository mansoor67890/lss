<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<br>
<br>
<br>
<br>
<div class="ui container">
		<c:choose>
			<c:when test="${empty msg}">
				<div class="alert alert-danger" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span> <span class="sr-only">Success</span>${msg}
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			</c:when>
			<c:otherwise>

			<div class="alert alert-success" role="alert">
				<span class="glyphicon glyphicon glyphicon-ok"
					aria-hidden="true"></span> <span class="sr-only">Success</span>${msg}
			</div>

			</c:otherwise>
		</c:choose>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br>
	</div>
