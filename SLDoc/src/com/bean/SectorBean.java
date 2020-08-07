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
@Table(name = "sector_tbl")
public class SectorBean implements Serializable {

	
	private int sector_id;
	private String sector_name;
	private int rights;
	
	public SectorBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public SectorBean(String sector_name) {
		super();
		
		this.sector_name = sector_name;
	}


	@Id
	@GeneratedValue
	@Column(name = "sector_id")
	public int getSector_id() {
		return sector_id;
	}
	public void setSector_id(int sector_id) {
		this.sector_id = sector_id;
	}
	
	@Column(name = "sector_name")
	public String getSector_name() {
		return sector_name;
	}
	public void setSector_name(String sector_name) {
		this.sector_name = sector_name;
	}

	@Column(name = "rights")
	public int getRights() {
		return rights;
	}
	public void setRights(int rights) {
		this.rights = rights;
	}
	
	
	
}
