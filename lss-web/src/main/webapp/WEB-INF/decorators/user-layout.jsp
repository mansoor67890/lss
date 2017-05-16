<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Spring MVC</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<%-- <link href="<c:url value="/resources/semantic.min.css" />" rel="stylesheet"  type="text/css" />
<script type="text/javascript" src="/cpc-web/resources/semantic.min.js"></script> --%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="/cpc-web/resources/moment.js"></script>
<script type="text/javascript" src="/cpc-web/resources/date.js"></script>
<script type="text/javascript" src="/cpc-web/resources/bootstrap.min.js"></script>
<script src="/cpc-web/resources/jquery.datetimepicker.js"></script>
 
<link href="/cpc-web/resources/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />  
<link href="/cpc-web/resources/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="/cpc-web/resources/bootstrap-material-datetimepicker.css" rel="stylesheet" type="text/css" /> -->

</head>
<body>
 
	<div id="wrap">
		<c:import url="/WEB-INF/View/tags/user-navbar.jsp" />
		<decorator:body />
		<hr class="soften">
	</div>
	<c:import url="/WEB-INF/View/tags/footer.jsp" />
</body>
</html>
