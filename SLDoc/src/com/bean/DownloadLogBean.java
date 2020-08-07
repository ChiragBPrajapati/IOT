package com.bean;

import java.net.InetAddress;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "download_log_tbl")
public class DownloadLogBean {

	private int download_id;
	private String attachment;
	private String attachment_path;
	private Date date;
	private String mac_adress;
	private String ip_adress;
	private int user_id;
	private CustomerBean customerBean; 	
	
	
	
	public DownloadLogBean(String attachment, String attachment_path, Date date, String mac_adress, String ip_adress,
			int user_id, CustomerBean customerBean) {
		super();
		this.attachment = attachment;
		this.attachment_path = attachment_path;
		this.date = date;
		this.mac_adress = mac_adress;
		this.ip_adress = ip_adress;
		this.user_id = user_id;
		this.customerBean = customerBean;
	}
	public DownloadLogBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Id
	@Column(name = "download_id")
	@GeneratedValue
	public int getDownload_id() {
		return download_id;
	}
	public void setDownload_id(int download_id) {
		this.download_id = download_id;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getAttachment_path() {
		return attachment_path;
	}
	public void setAttachment_path(String attachment_path) {
		this.attachment_path = attachment_path;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMac_adress() {
		return mac_adress;
	}
	public void setMac_adress(String mac_adress) {
		this.mac_adress = mac_adress;
	}


	public String getIp_adress() {
		return ip_adress;
	}
	public void setIp_adress(String ip_adress) {
		this.ip_adress = ip_adress;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	

	@ManyToOne
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}

	
	
}
