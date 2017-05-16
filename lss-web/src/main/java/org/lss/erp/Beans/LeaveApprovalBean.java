package org.lss.erp.Beans;


public class LeaveApprovalBean {

	
		private String adminComment;
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

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

		private int id;
		String approve;
		String reject;

		public String getAdminComment() {
			return adminComment;
		}

		public void setAdminComment(String adminComment) {
			this.adminComment = adminComment;
		}
		
	

}
