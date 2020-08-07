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
@Table(name = "customer_tbl")
public class CustomerBean implements Serializable{

	private int customer_id;
	private String username;
	private String password;
	private String fullname;
	private String company_name;
	private String contact_one;
	private String contact_two;
	private String email_one;
	private String email_two;
	private String adress;
	private String active;
	private Date creation_date;
	private Date deletion_date;
	private String machine_serial_no;
	private String products;
	private String empCode;
	
	private CustomerTypeBean customerTypeBean;
	private ProductBean productBean;
	
	public CustomerBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CustomerBean(String username, String password, String fullname, String company_name,
			String contact_one, String contact_two, String email_one, String email_two, String adress, String active,
			Date creation_date, Date deletion_date, String machine_serial_no, CustomerTypeBean customerTypeBean,
			ProductBean productBean) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.company_name = company_name;
		this.contact_one = contact_one;
		this.contact_two = contact_two;
		this.email_one = email_one;
		this.email_two = email_two;
		this.adress = adress;
		this.active = active;
		this.creation_date = creation_date;
		this.deletion_date = deletion_date;
		this.machine_serial_no = machine_serial_no;
		this.customerTypeBean = customerTypeBean;
		this.productBean = productBean;
	}

	public CustomerBean(String username, String password, String fullname, 
			String active,Date creation_date, Date deletion_date,  CustomerTypeBean customerTypeBean,
			String products ,String empCode ,String contact_one ,String email_one) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.active = active;
		this.creation_date = creation_date;
		this.deletion_date = deletion_date;
		this.customerTypeBean = customerTypeBean;
		this.products = products;
		this.empCode = empCode;
		this.contact_one = contact_one;
		this.email_one = email_one;
	}
	
public CustomerBean(String username2, String password2, String fullname2, String wIdArray, String empCode2 ,String contact_one ,String email_one) {
		// TODO Auto-generated constructor stub
	}



	/*

	public CustomerBean(String username, String password, String fullname, String company_name, String contact_one,
			String contact_two, String email_one, String email_two, String adress, String active, Date creation_date,
			Date deletion_date, String machine_serial_no) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.company_name = company_name;
		this.contact_one = contact_one;
		this.contact_two = contact_two;
		this.email_one = email_one;
		this.email_two = email_two;
		this.adress = adress;
		this.active = active;
		this.creation_date = creation_date;
		this.deletion_date = deletion_date;
		this.machine_serial_no = machine_serial_no;
	}*/
	@Id
	@GeneratedValue
	@Column(name = "customer_id")
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
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
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getContact_one() {
		return contact_one;
	}
	public void setContact_one(String contact_one) {
		this.contact_one = contact_one;
	}
	public String getContact_two() {
		return contact_two;
	}
	public void setContact_two(String contact_two) {
		this.contact_two = contact_two;
	}
	public String getEmail_one() {
		return email_one;
	}
	public void setEmail_one(String email_one) {
		this.email_one = email_one;
	}
	public String getEmail_two() {
		return email_two;
	}
	public void setEmail_two(String email_two) {
		this.email_two = email_two;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public Date getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}
	public Date getDeletion_date() {
		return deletion_date;
	}
	public void setDeletion_date(Date deletion_date) {
		this.deletion_date = deletion_date;
	}
	public String getMachine_serial_no() {
		return machine_serial_no;
	}
	public void setMachine_serial_no(String machine_serial_no) {
		this.machine_serial_no = machine_serial_no;
	}
	
	
	public String getProducts() {
		return products;
	}



	public void setProducts(String products) {
		this.products = products;
	}

	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}



	@ManyToOne
	@JoinColumn(name = "customer_type_id")
	public CustomerTypeBean getCustomerTypeBean() {
		return customerTypeBean;
	}
	public void setCustomerTypeBean(CustomerTypeBean customerTypeBean) {
		this.customerTypeBean = customerTypeBean;
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
