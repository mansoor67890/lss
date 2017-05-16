package org.lss.erp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "PAYMENTS_PAYMENTS_TYPE")
public class PaymentsPaymentsType {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PPT_ID")
	private Integer id;

	@ManyToOne
	@JoinColumn(name="PAYMENTS_ID")
	private Payments payments;

	@ManyToOne
	@JoinColumn(name="PAYMENTS_TYPE_ID")
	private PaymentsType paymentsType;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Payments getPayments() {
		return payments;
	}

	public void setPayments(Payments payments) {
		this.payments = payments;
	}

	public PaymentsType getPaymentsType() {
		return paymentsType;
	}

	public void setPaymentsType(PaymentsType paymentsType) {
		this.paymentsType = paymentsType;
	}

	public PaymentsPaymentsType() {
	}

	public PaymentsPaymentsType(Payments payments, PaymentsType paymentsType) {
		super();
		this.payments = payments;
		this.paymentsType = paymentsType;
	}


}