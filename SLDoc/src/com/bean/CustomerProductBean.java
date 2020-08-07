package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cust_prod_tbl")
public class CustomerProductBean {
	
	
	private int cust_prod_id;
	private String machine_serial_no;
	private String cust_prod_info;
	private ProductBean productBean;
	private CustomerBean customerBean;
	private SectorBean sectorBean;
	
	
	
	
	public CustomerProductBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public CustomerProductBean(String machine_serial_no, String cust_prod_info, ProductBean productBean,
			CustomerBean customerBean, SectorBean sectorBean) {
		super();
		this.machine_serial_no = machine_serial_no;
		this.cust_prod_info = cust_prod_info;
		this.productBean = productBean;
		this.customerBean = customerBean;
		this.sectorBean = sectorBean;
	}
	@Id
	@GeneratedValue
	@Column(name = "cust_prod_id")
	public int getCust_prod_id() {
		return cust_prod_id;
	}
	public void setCust_prod_id(int cust_prod_id) {
		this.cust_prod_id = cust_prod_id;
	}
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	public ProductBean getProductBean() {
		return productBean;
	}
	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}
	
	@ManyToOne
	@JoinColumn(name = "sector_id")
	public SectorBean getSectorBean() {
		return sectorBean;
	}
	public void setSectorBean(SectorBean sectorBean) {
		this.sectorBean = sectorBean;
	}
	
	public String getMachine_serial_no() {
		return machine_serial_no;
	}
	public void setMachine_serial_no(String machine_serial_no) {
		this.machine_serial_no = machine_serial_no;
	}
	public String getCust_prod_info() {
		return cust_prod_info;
	}
	public void setCust_prod_info(String cust_prod_info) {
		this.cust_prod_info = cust_prod_info;
	}
	
	
	

}
