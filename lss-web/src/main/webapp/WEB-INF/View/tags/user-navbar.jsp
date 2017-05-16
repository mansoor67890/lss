<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-default" role="navigation">
 <!-- Brand and toggle get grouped for better mobile display -->
 <div class="navbar-header">
  <button type="button" class="navbar-toggle" data-toggle="collapse"
   data-target="#bs-example-navbar-collapse-1">
   <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
    class="icon-bar"></span><span class="icon-bar"></span>
  </button>
 </div>
 
 <!-- Collect the nav links, forms, and other content for toggling -->
 
 <div class="navbar navbar-default navbar-inverse" id="bs-example-navbar-collapse-1">
  <ul class="nav navbar-nav">
   <li><a href="/cpc-web/user/Welcome"><span class="glyphicon glyphicon-home"></span>
     Home</a></li>
   <li>
   <li class="dropdown"><a href="#" class="dropdown-toggle"
    data-toggle="dropdown">Attendance<b class="caret"></b></a>
    <ul class="dropdown-menu">
     <li><a href=/cpc-web/user/viewAttendance>View Attendance</a></li>
    </ul></li>
    
    <li class="dropdown"><a href="#" class="dropdown-toggle"
    data-toggle="dropdown">Leave<b class="caret"></b></a>
    <ul class="dropdown-menu">
     <li><a href="/cpc-web/user/viewleaves">My Leaves</a></li>
     <li class="divider"></li>
     <li><a href="/cpc-web/user/applyleave">Apply for Leave</a></li>
    </ul>
    </li>
  </ul>
  
  <ul class="nav navbar-nav navbar-right">
   <li><form action="/cpc-web/j_spring_security_logout" method="post" class="navbar-form">
    <button class="btn btn-danger btn-sm" type="submit" value="Logout">Logout &nbsp;<i class="glyphicon glyphicon-off" style="color:white"></i></button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   </form></li>
  </ul>
 </div>
</nav>