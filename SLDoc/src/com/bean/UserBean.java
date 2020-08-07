package com.bean;



import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_tbl")
public class UserBean implements Serializable {

	private int user_id;
	private String name;
	private String username;
	private String password;
	private Date creation_date;
	private int active;
	private String machine_serial_no;
	private int authority;
	private int customer_id;
	private CustomerTypeBean customerTypeBean;
	
	
	public UserBean() {
		// TODO Auto-generated constructor stub
	}

	public UserBean(String name, String username, String password, Date creation_date, int active, String machine_serial_no,
			int authority,int customer_id) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.creation_date = creation_date;
		this.active = active;
		this.machine_serial_no = machine_serial_no;
		this.authority = authority;
		this.customer_id = customer_id;
	}


	public UserBean(String name, String username, String password, Date creation_date, int active,
			int authority, int customer_id, CustomerTypeBean customerTypeBean) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.creation_date = creation_date;
		this.active = active;
		this.authority = authority;
		this.customer_id = customer_id;
		this.customerTypeBean = customerTypeBean;
	}



	public UserBean(String name, String username, String password, Date creation_date, int active, String machine_serial_no,
			int authority, int customer_id, CustomerTypeBean customerTypeBean) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.creation_date = creation_date;
		this.active = active;
		this.machine_serial_no = machine_serial_no;
		this.authority = authority;
		this.customer_id = customer_id;
		this.customerTypeBean = customerTypeBean;
	}

	public UserBean(String fullname, String username2, String password2, int customer_id2) {
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue
	@Column(name = "user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	
	public String getMachine_serial_no() {
		return machine_serial_no;
	}

	public void setMachine_serial_no(String machine_serial_no) {
		this.machine_serial_no = machine_serial_no;
	}

	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	
	@ManyToOne
	@JoinColumn(name = "customer_type_id")
	public CustomerTypeBean getCustomerTypeBean() {
		return customerTypeBean;
	}

	public void setCustomerTypeBean(CustomerTypeBean customerTypeBean) {
		this.customerTypeBean = customerTypeBean;
	}
	
	
}
