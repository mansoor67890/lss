package org.lss.erp.Beans;

import java.util.Date;

public class AttendanceReportBean {
	
	private int attendaceId;
	private String isPresent;
	private String isAbsent;
	private String timeIn;
	private String timeOut;
	private String reason;
	private String comment;
	String approve;
	String reject;
	
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public String getReject() {
		return reject;
	}
	public void setReject(String reject) {
		this.reject = reject;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getAttendaceId() {
		return attendaceId;
	}
	public void setAttendaceId(int attendaceId) {
		this.attendaceId = attendaceId;
	}
	public String getIsPresent() {
		return isPresent;
	}
	public void setIsPresent(String isPresent) {
		this.isPresent = isPresent;
	}
	public String getIsAbsent() {
		return isAbsent;
	}
	public void setIsAbsent(String isAbsent) {
		this.isAbsent = isAbsent;
	}
	public String getTimeIn() {
		return timeIn;
	}
	public void setTimeIn(String timeIn) {
		this.timeIn = timeIn;
	}
	public String getTimeOut() {
		return timeOut;
	}
	public void setTimeOut(String timeOut) {
		this.timeOut = timeOut;
	}
	
}