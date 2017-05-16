package org.lss.erp.Beans;

import java.util.ArrayList;

public class EditAttendanceForm {
	
	private ArrayList<EditAttendanceBean> attendanceList;
	
	public EditAttendanceForm(){
		
	}
	public ArrayList<EditAttendanceBean> getAttendanceList() {
		return attendanceList;
	}

	public void setAttendanceList(ArrayList<EditAttendanceBean> attendanceList) {
		this.attendanceList = attendanceList;
	}
}
