<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<c:choose>
	<c:when test="${empty msg}">
		<div id="embed2">
			<script type="text/javascript">
					$("#embed2").html("<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Oops!</strong> Something went wrong!</div>");
					</script>
		</div>
	</c:when>
	<c:otherwise>
		<div id="embed">
			<script type="text/javascript">
					$("#embed").html("<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Error!</strong> ${msg}</div>");
					</script>
		</div>
	</c:otherwise>
</c:choose>
