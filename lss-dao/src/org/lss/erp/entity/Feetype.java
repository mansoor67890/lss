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
@Table(name="FEETYPE")

public class Feetype {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="FEETYPE_ID")
	private int id;

	@JoinColumn(name="FEE_ID")
	@ManyToOne
	private Fee fee;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Fee getFee() {
		return fee;
	}

	public void setFee(Fee fee) {
		this.fee = fee;
	}
	
}
