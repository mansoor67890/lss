package org.lss.erp.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@Table(name="PAYMENTS")
@JsonIgnoreProperties(value="paymentsPaymentsType")
public class Payments {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="PAYMENTS_ID")
	private int id;

	@Column(name="TOTAL_AMOUNT", length=100)
	private int totalAmount;
	
	@Column(name="AMOUNT_PAID", length=100)
	private int amountPaid;
	
	@Column(name="STATUS")
	private boolean status;
	
	@JoinColumn(name="STUDENT_ID")
	@ManyToOne
	private Student student;
	
	@OneToMany(mappedBy="payments", cascade=CascadeType.ALL)
	private List<PaymentsPaymentsType> paymentsPaymentsType= new ArrayList<PaymentsPaymentsType>();
	
	@OneToOne(mappedBy="payment")
	Invoice invoice;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	
	public int getAmountPaid() {
		return amountPaid;
	}

	public void setAmountPaid(int amountPaid) {
		this.amountPaid = amountPaid;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public List<PaymentsPaymentsType> getPaymentsPaymentsType() {
		return paymentsPaymentsType;
	}

	public void setPaymentsPaymentsType(
			List<PaymentsPaymentsType> paymentsPaymentsType) {
		this.paymentsPaymentsType = paymentsPaymentsType;
	}

	public Invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}
	
}
