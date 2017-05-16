<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Test Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<%--
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
 --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tether.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom-lss.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/toastr.min.js"></script>

<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admitformcss.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lssc.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tether.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/toastr.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/neon-core.css">

</head>
<body>
	<c:import url="/WEB-INF/View/tags/menu.jsp" />
	<div id="wrap">
		<c:import url="/WEB-INF/View/tags/navbar.jsp" />
		<decorator:body />
		<div class="ui one column center aligned page grid">
			<div class="ui active dimmer" style="z-index: 1001; display: none;">
				<div class="ui text loader">loading</div>
			</div>
		</div>
	</div>
	<br><br><br>
	<%-- <c:import url="/WEB-INF/View/tags/footer.jsp" /> --%>
</body>
</html>
