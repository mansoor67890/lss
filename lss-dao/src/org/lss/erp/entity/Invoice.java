package org.lss.erp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="INVOICE")
public class Invoice {
	
	public Invoice() {
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="INVOICE_ID")
	private int id;
	
	@Column(name="RECEIPT_NO", unique=true)
	private String receiptNo;
	
	@JoinColumn(name="PAYMENTS_ID")
	@OneToOne
	private Payments payment;

	@Column(name="INVOICE_DATE")
	Date date;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Payments getPayment() {
		return payment;
	}

	public void setPayment(Payments payment) {
		this.payment = payment;
	}

	public String getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
