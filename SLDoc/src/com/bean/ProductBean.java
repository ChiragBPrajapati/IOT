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
@Table(name = "product_tbl")
public class ProductBean implements Serializable {


	
	private int product_id;
	private String product_name;
	private SectorBean sectorBean;
	
	
	
	public ProductBean(String product_name, SectorBean sectorBean) {
		super();
		this.product_name = product_name;
		this.sectorBean = sectorBean;
	}

	public ProductBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue
	@Column(name = "product_id")
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	
	@ManyToOne
	@JoinColumn(name = "sector_id")
	public SectorBean getSectorBean() {
		return sectorBean;
	}

	public void setSectorBean(SectorBean sectorBean) {
		this.sectorBean = sectorBean;
	}
	
	
	
	
}
