package org.lss.erp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ROLES")
public class Roles {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int roleId;
	
	@Column(name = "ROLENAME")
	private String role_name;
	
	
//	@OneToMany(mappedBy="roles", cascade=CascadeType.ALL)
//	private Collection<UserRole> user_roles= new ArrayList<UserRole>();

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

//	public Collection<UserRole> getUser_roles() {
//		return user_roles;
//	}
//
//	public void setUser_roles(Collection<UserRole> user_roles) {
//		this.user_roles = user_roles;
//	}


	
}


