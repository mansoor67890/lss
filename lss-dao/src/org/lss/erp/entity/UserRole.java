package org.lss.erp.entity;

import javax.persistence.*;

	@Entity
	@Table(name = "USERROLES")
	public class UserRole {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_role_id")
	private Integer id;

	@ManyToOne
	@JoinColumn(name="User_id")
	private User user;

	 @ManyToOne
	 @JoinColumn(name="ROLEID")
	 private Roles roles;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Roles getRoles() {
		return roles;
	}

	public void setRoles(Roles roles) {
		this.roles = roles;
	}
	 
}