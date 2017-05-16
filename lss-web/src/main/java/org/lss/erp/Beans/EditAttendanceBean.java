package org.lss.erp.Beans;

import java.util.Date;

public class EditAttendanceBean {
	
	private String date;
	private String employeeName;
	private String code;
	private String isPresent;
	private String isAbsent;
	private String timeIn;
	private String timeOut;
	
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getIsPresent() {
		return isPresent;
	}
	public void setIsPresent(String isPresent) {
		this.isPresent = isPresent;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getIsAbsent() {
		return isAbsent;
	}
	public void setIsAbsent(String isAbsent) {
		this.isAbsent = isAbsent;
	}
}
