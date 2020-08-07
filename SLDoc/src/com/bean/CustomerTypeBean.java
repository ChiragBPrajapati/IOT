package com.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "customer_type_master")
public class CustomerTypeBean implements Serializable{

	
	private int customer_type_id;
	private String customer_type_name;
	

	public CustomerTypeBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerTypeBean(int customer_type_id, String customer_type_name) {
		super();
		this.customer_type_id = customer_type_id;
		this.customer_type_name = customer_type_name;
	}
	
	@Id
	@GeneratedValue
	@Column(name = "customer_type_id")
	public int getCustomer_type_id() {
		return customer_type_id;
	}
	public void setCustomer_type_id(int customer_type_id) {
		this.customer_type_id = customer_type_id;
	}
	public String getCustomer_type_name() {
		return customer_type_name;
	}
	public void setCustomer_type_name(String customer_type_name) {
		this.customer_type_name = customer_type_name;
	}
	
}
