package org.lss.erp.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "APP_USER")
public class User implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	@Id 
	@Basic(optional = false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id", nullable = false, precision = 19, scale = 0)
	private int id; 
	
	@Column(name = "NAME")
	private String name;

	@Column(name = "EMAIL")
	private String email;


	@Column(name="PASSWORD")
	private String password;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
