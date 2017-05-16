package org.lss.erp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="STUDENT")
public class Student {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="STUDENT_ID")
	private int id;
	
	@Column(name="STUDENT_NAME", length=100)
	private String name;
	
	@Column(name="FATHER_NAME", length=100)
	private String fatherName;
	
	@Column(name="STUDENT_ROLLNUMBER", length=100, unique=true)
	private String rollNumber;
	
	@Column(name="STUDENT_CLASS", length=100)
	private String studentClass;
	
	@Column(name="SECTION", length=10)
	private String section;
	
	@Column(name="STUDENT_PHONE",length=50)
	private String phone;
	
	@Column(name="GENDER", length=50)
	private String gender;
	
	@Column(name="TRANSPORT_ROUTE", length=200)
	private String transportRoute;
	
	@Column(name="STUDENT_ADDRESS", length=1000)
	private String address;
	
	@Column(name="DOB")
	Date dob;
	
	@Column(name="IMAGE_NAME")
	private String imageName;
	
	@Column(name="STATUS" )
	private boolean status;
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTransportRoute() {
		return transportRoute;
	}

	public void setTransportRoute(String transportRoute) {
		this.transportRoute = transportRoute;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getRollNumber() {
		return rollNumber;
	}

	public void setRollNumber(String rollNumber) {
		this.rollNumber = rollNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

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

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getStudentClass() {
		return studentClass;
	}

	public void setStudentClass(String studentClass) {
		this.studentClass = studentClass;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
}
