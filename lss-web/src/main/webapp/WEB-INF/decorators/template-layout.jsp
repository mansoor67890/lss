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


</head>
<body>
	<div id="wrap">
		<decorator:body />
		<div class="ui one column center aligned page grid">
			<div class="ui active dimmer" style="z-index: 1001; display: none;">
				<div class="ui text loader">loading</div>
			</div>
		</div>
	</div>
</body>
</html>
