<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.activity-feed {
	padding: 15px;
}

.activity-feed .feed-item {
	position: relative;
	padding-bottom: 20px;
	padding-left: 30px;
	border-left: 2px solid #e4e8eb;
}

.activity-feed .feed-item:last-child {
	border-color: transparent;
}

.activity-feed .feed-item:after {
	content: "";
	display: block;
	position: absolute;
	top: 0;
	left: -6px;
	width: 10px;
	height: 10px;
	border-radius: 6px;
	background: #fff;
	border: 1px solid #f37167;
}

.activity-feed .feed-item .date {
	position: relative;
	top: -5px;
	color: #8c96a3;
	text-transform: uppercase;
	font-size: 13px;
}

.activity-feed .feed-item .text {
	position: relative;
	top: -3px;
}
</style>
<div class="container">
	<div class="row">
		<br> <br> <br> <br> <br>

		<div class="col-md-7 col-md-offset-7">
			<div class="activity-feed">
			<h2>Notifications</h2>
				<c:forEach var="attNotif" items="${attNotification}">
					<c:choose>
						<c:when test="${attNotif.pending.status==0}">
							<div class="feed-item">
								<div class="warning">
								</div>
								<div class="date">${attNotif.applicationDate}</div>
								<div class="text">
									User <a href="${attNotif.attendance.employee.code}/profile">${attNotif.attendance.employee.name}</a>
									 has an issue in the attendance. 
								</div>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				
			
				<c:forEach var="notif" items="${leaveNotifications}">
					<c:choose>
						<c:when test="${notif.leave.isGranted==0}">
							<div class="feed-item">
								<div class="warning">
								</div>
								<div class="date">${notif.applicationDate}</div>
								<div class="text">
									User <a href="${notif.leave.employee.code}/profile">${notif.leave.employee.name}</a>
									applied for <a href="admin/employeeleaves/${notif.leave.id}">leave</a>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				
				
				<!-- 	Employee attendance notification  -->
				</c:forEach>
				<c:forEach var="attNotif" items="${attendance}">
					<c:choose>
						<c:when test="${attNotif.status==1}">
							<div class="feed-item">
								<div class="success">
								</div>
								<div class="date">${attNotif.attNotification.applicationDate}</div>
								<div class="text">
									Your attendance issue has been RESOLVED 
								</div>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				
				
				
			</div>
		</div>
	</div>
</div>
