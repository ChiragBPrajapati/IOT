package com.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.servlet.ServletContext;

@Entity
@Table(name = "attachment_tbl")
public class AttachmentBean implements Serializable {

	private int attachment_id;
	private String attachment_name;
	private String date_of_submission;
	private String location_path;
	private int attachment_status;
	private String machine_serial_no;
	private CustomerBean customerBean;
	private ProductBean productBean;



	public AttachmentBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
public AttachmentBean(String attachment_name, String date_of_submission, String location_path,
			int attachment_status, String machine_serial_no, CustomerBean customerBean, ProductBean productBean) {
		super();
		this.attachment_name = attachment_name;
		this.date_of_submission = date_of_submission;
		this.location_path = location_path;
		this.attachment_status = attachment_status;
		this.machine_serial_no = machine_serial_no;
		this.customerBean = customerBean;
		this.productBean = productBean;
	}


	@Id
	@Column(name = "attachment_id")
	@GeneratedValue
	public int getAttachment_id() {
		return attachment_id;
	}

	public void setAttachment_id(int attachment_id) {
		this.attachment_id = attachment_id;
	}

	
	@Column(name = "date_of_submission")
	public String getDate_of_submission() {
		return date_of_submission;
	}

	public void setDate_of_submission(String date_of_submission) {
		this.date_of_submission = date_of_submission;
	}

	
	@Column(name = "location_path")
	public String getLocation_path() {
		return location_path;
	}

	public void setLocation_path(String location_path) {
		this.location_path = location_path;
	}

	@Column(name = "attachment_status")
	public int getAttachment_status() {
		return attachment_status;
	}

	public void setAttachment_status(int attachment_status) {
		this.attachment_status = attachment_status;
	}


	@Column(name = "machine_serial_no")
	public String getMachine_serial_no() {
		return machine_serial_no;
	}

	public void setMachine_serial_no(String machine_serial_no) {
		this.machine_serial_no = machine_serial_no;
	}
	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}

	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}

	@Column(name = "attachment_name")
	public String getAttachment_name() {
		return attachment_name;
	}

	public void setAttachment_name(String attachment_name) {
		this.attachment_name = attachment_name;
	}

	@ManyToOne
	@JoinColumn(name = "product_id")
	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}



}
