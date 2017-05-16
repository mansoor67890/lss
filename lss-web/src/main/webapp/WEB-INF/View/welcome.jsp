<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to LSS</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/welcomecss.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

</head>
<body background="${pageContext.request.contextPath}/resources/img/background4.jpg" style="background-size: cover">
<div class="container" action="#">
 <div class="row">
 <svg viewBox="0 0 900 300">
    <symbol id="s-text">
  <text text-anchor="middle" x="50%" y="80%">Welcome to</text>
 </symbol>
 <g class = "g-ants">
  <use xlink:href="#s-text" class="text-copy"></use>
  <use xlink:href="#s-text" class="text-copy"></use>
  <use xlink:href="#s-text" class="text-copy"></use>
  <use xlink:href="#s-text" class="text-copy"></use>
  <use xlink:href="#s-text" class="text-copy"></use>
 </g>
</svg>

 <svg viewBox="0 180 960 300">
    <symbol id="m-text">
  <text text-anchor="middle" x="50%" y="80%">Lahore School System</text>
  
 </symbol>
  
 <g class = "g-ants">
 
  <use xlink:href="#m-text" class="text-copy"></use>
  <use xlink:href="#m-text" class="text-copy"></use>
  <use xlink:href="#m-text" class="text-copy"></use>
  <use xlink:href="#m-text" class="text-copy"></use>
  <use xlink:href="#m-text" class="text-copy"></use>
 </g>
</svg>




 <!-- <svg viewBox="0 180 960 300">
    <symbol id="cs-text">
  <text text-anchor="middle" x="50%" y="80%"><a href="index.jsp">Chakwal Campus</a></text>
  
 </symbol>
 <g class = "g-ants">
  <use xlink:href="#cs-text" class="text-copy"></use>
  <use xlink:href="#cs-text" class="text-copy"></use>
  <use xlink:href="#cs-text" class="text-copy"></use>
  <use xlink:href="#cs-text" class="text-copy"></use>
  <use xlink:href="#cs-text" class="text-copy"></use>
 </g>
</svg> -->

 </div>
 
 <br><br><br>
 <a  href="${pageContext.request.contextPath}/dashboard" data-toggle="tooltip" data-placement="bottom" title="Click Here to Go to Login Page">Click  Here to Proceed...</a>
</div>


</body>

</html>