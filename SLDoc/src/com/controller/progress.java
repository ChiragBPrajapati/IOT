package com.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.AttachmentBean;
import com.bean.CustomerBean;
import com.bean.CustomerProductBean;
import com.bean.ProductBean;
import com.bean.SectorBean;
import com.dao.AllInsertDAO;
import com.dao.AllListDAO;
import com.dao.AllUpdateDAO;

@SuppressWarnings("unused")
@Controller
public class progress {

	@RequestMapping("/save-product")
	public String saveFile2(HttpServletRequest servletRequest, HttpServletResponse response)
			throws ServletException, IOException {


		boolean isMultipart = ServletFileUpload.isMultipartContent(servletRequest);

			String filePath = servletRequest.getServletContext().getInitParameter("file-upload");

			File f = new File(filePath);
			if (!f.exists()) {
				System.out.println("path is not exist");
				servletRequest.setAttribute("FileCheckexist",
						"<font size=\"4px\">Could not upload the file because of This file path is not exist.......</font>");
				return "uploadAdmin";
			} else {

			

				// process only if it is multipart content
				if (isMultipart) {
					// Create a factory for disk-based file items
					FileItemFactory factory = new DiskFileItemFactory();

					// Create a new file upload handler
					ServletFileUpload upload = new ServletFileUpload(factory);
					String filePath1 = servletRequest.getServletContext().getInitParameter("file-upload-admin");
					try {
						// Parse the request
						List<FileItem> multiparts = upload.parseRequest(servletRequest);
						String fieldName = null;
						String fieldValue = null;
						String fileName = null;
						String location_path = null;
						File file = null;
						int attachment_status = 0;
						String date_of_submission = null;
						String DateTime_End = null;
						int customer_id = 0;
						int product_id = 0;
						int cust_prod_id = 0;
						String product_name = null;
						String machine_serial_no = null;
						AllListDAO allListDAO = new AllListDAO();
						String username = null;
						String spmType = null;
						CustomerBean customerBean = new CustomerBean();
						ProductBean productBean = new ProductBean();
						for (int i = 0; i < multiparts.size(); i++) {
							FileItem item = multiparts.get(i);

							if (item.isFormField()) {
								System.out.println("In If");
								fieldName = item.getFieldName();
								fieldValue = item.getString();
							
									if (fieldName.equalsIgnoreCase("customer_id")) {
										String value = fieldValue;
										customer_id = Integer.parseInt(value);
										System.out.println("customer_id:" + customer_id);
										
										customerBean.setCustomer_id(customer_id);
										CustomerBean customerBean2 = allListDAO.customerDetails(customer_id);
										username = customerBean2.getUsername().trim();
										//machine_serial_no = customerBean2.getMachine_serial_no();
										
									}
									else if(fieldName.equalsIgnoreCase("product_id")){
										String value = fieldValue;

										cust_prod_id = Integer.parseInt(value);
										
										CustomerProductBean customerProductBean = allListDAO.listOfCustomerProductFromCustProdId(cust_prod_id);
										
										
										
										product_id = customerProductBean.getProductBean().getProduct_id();
										System.out.println("product_id:" + product_id);
										
										productBean.setProduct_id(product_id);
										ProductBean productBean2 = allListDAO.getListOfProductfromId(product_id);
										product_name = productBean2.getProduct_name();
										System.out.println("product_name"+product_name);
										
										CustomerProductBean customerProductBean1 = allListDAO.listOfCustomerProductFromprodId(product_id ,customer_id);
										machine_serial_no = customerProductBean.getMachine_serial_no();
										
														
									}
									
									else if(fieldName.equalsIgnoreCase("spmType")){
									 spmType = fieldValue;
									System.out.println("spmType :"+spmType);
									
								
														
									}	
									
									} else if (!item.isFormField()) {
									fieldName = item.getFieldName();
									System.out.println("FieldName : " + fieldName);
									fileName = item.getName();
									System.out.println("File Name : " + fileName);
	
									fileName = fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.length());
									System.out.println("File Name 1 : " + fileName);
									
									
									if(spmType.equalsIgnoreCase("application")) {
										attachment_status = 1;
										System.out.println("attachment_status"+attachment_status);
										file = new File(filePath + File.separator + username + File.separator + product_name + "_" + machine_serial_no + File.separator + "application");
									}else {
									
										file = new File(filePath + File.separator + username + File.separator + product_name + "_" + machine_serial_no + File.separator + "docs");
									
									}
									
									System.out.println("filePath:" + file);
									String name = new File(item.getName()).getName();
									String result1 = name.replaceAll("[!@#$%^&*()+=|]", "_");
									System.out.println("result1 :" + result1);
									location_path = file.toString() + File.separator + result1;
									System.out.println("filePath1:" + location_path);
	
									item.write(new File(location_path));
									System.out.println("photo uploaded");
									
								     List<AttachmentBean> listoffCheck = null;
									listoffCheck = allListDAO.getListOfExistingFileCheck(customer_id, result1);
									
									if (listoffCheck.size() == 0) {
									
									DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									Date date = new Date();
									System.out.println(dateFormat.format(date));
									date_of_submission = dateFormat.format(date);
									DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									Date date1 = new Date();
									System.out.println("date2" + dateFormat1.format(date1));
									DateTime_End = dateFormat1.format(date1);
									System.out.println("date_end" + DateTime_End);
	
								try {
									AllInsertDAO allInsertDAO = new AllInsertDAO();
									//AttachmentBean attachmentBean = new AttachmentBean(result1, date_of_submission, location_path2,location_path_qc,location_path_adapter,attachment_status, employeeMasterBean);
									AttachmentBean attachmentBean = new AttachmentBean(result1, date_of_submission, location_path, attachment_status, machine_serial_no, customerBean, productBean);
									boolean result = allInsertDAO.attachmentInsert(attachmentBean);
								}catch (Exception e) {
									System.out.println(e.getMessage());
								}
									 servletRequest.setAttribute("FileSuccess",
									 "<font size=\"4px\">File is uploaded Successfully.......</font>");
									  System.out.println("file Uploaded...`");
									 
									response.getWriter().print("File(s) Uploaded Successfully.......");
									// servletRequest.setAttribute("error", "File(s) Uploaded Successfully.......");
									// return "adminQc";
								   	} else {
										/*	servletRequest.setAttribute("FileCheck",
													"<font size=\"4px\">This file already exists.......</font>");
											System.out.println("file Exist...`");*/
											
											response.getWriter().print("This file already exists.......");
										}
									
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			return null;
		

	}

	@RequestMapping("/save-product1")
	public String saveFile22(HttpServletRequest servletRequest, HttpServletResponse response)
			throws ServletException, IOException {


		boolean isMultipart = ServletFileUpload.isMultipartContent(servletRequest);

			String filePath = servletRequest.getServletContext().getInitParameter("file-upload");

			File f = new File(filePath);
			if (!f.exists()) {
				System.out.println("path is not exist");
				servletRequest.setAttribute("FileCheckexist",
						"<font size=\"4px\">Could not upload the file because of This file path is not exist.......</font>");
				return "uploadAdmin";
			} else {

			

				// process only if it is multipart content
				if (isMultipart) {
					// Create a factory for disk-based file items
					FileItemFactory factory = new DiskFileItemFactory();

					// Create a new file upload handler
					ServletFileUpload upload = new ServletFileUpload(factory);
					String filePath1 = servletRequest.getServletContext().getInitParameter("file-upload-admin");
					try {
						// Parse the request
						List<FileItem> multiparts = upload.parseRequest(servletRequest);
						String fieldName = null;
						String fieldValue = null;
						String fileName = null;
						String location_path = null;
						File file = null;
						int attachment_status = 0;
						String date_of_submission = null;
						String DateTime_End = null;
						int sector_id = 0;
						int custProdId = 0;
						String product_name = null;
						int product_id= 0;
						int customer_id = 0;
						String machine_serial_no = null;
						AllListDAO allListDAO = new AllListDAO();
						String username = null;
						String spmType = null;
						CustomerBean customerBean = new CustomerBean();
						ProductBean productBean = new ProductBean();
						
						CustomerProductBean customerProductBean = new CustomerProductBean();
						for (int i = 0; i < multiparts.size(); i++) {
							FileItem item = multiparts.get(i);

							if (item.isFormField()) {
								System.out.println("In If");
								fieldName = item.getFieldName();
								fieldValue = item.getString();
							
									if (fieldName.equalsIgnoreCase("sector_id")) {
										String value = fieldValue;
										sector_id = Integer.parseInt(value);
										System.out.println("sector_id:" + sector_id);
										
									}
									else if(fieldName.equalsIgnoreCase("custProdId")){
										String value = fieldValue;
										custProdId = Integer.parseInt(value);
										System.out.println("custProdId:" + custProdId);
										
										customerProductBean.setCust_prod_id(custProdId);
										CustomerProductBean customerProductBean2 = allListDAO.listOfCustomerProductFromCustProdId(custProdId);
										product_name = customerProductBean2.getProductBean().getProduct_name().trim();
										product_id = customerProductBean2.getProductBean().getProduct_id();
										customer_id = customerProductBean2.getCustomerBean().getCustomer_id();
										
										
										productBean.setProduct_id(product_id);
										customerBean.setCustomer_id(customer_id);
										
										username = customerProductBean2.getCustomerBean().getUsername();
										machine_serial_no = customerProductBean2.getMachine_serial_no();
														
									}
									
									else if(fieldName.equalsIgnoreCase("spmType")){
									 spmType = fieldValue;
									System.out.println("spmType :"+spmType);	
								
														
									}	
									
									} else if (!item.isFormField()) {
									fieldName = item.getFieldName();
									System.out.println("FieldName : " + fieldName);
									fileName = item.getName();
									System.out.println("File Name : " + fileName);
	
									fileName = fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.length());
									System.out.println("File Name 1 : " + fileName);
									
									
									if(spmType.equalsIgnoreCase("application")) {
										attachment_status = 1;
										System.out.println("attachment_status"+attachment_status);
										file = new File(filePath + File.separator + username + File.separator + product_name + "_" + machine_serial_no + File.separator + "application");
									}else {
									
										file = new File(filePath + File.separator + username + File.separator + product_name + "_" + machine_serial_no + File.separator + "docs");
									
									}
									
									System.out.println("filePath:" + file);
									String name = new File(item.getName()).getName();
									String result1 = name.replaceAll("[!@#$%^&*()+=|]", "_");
									System.out.println("result1 :" + result1);
									location_path = file.toString() + File.separator + result1;
									System.out.println("filePath1:" + location_path);
	
									item.write(new File(location_path));
									System.out.println("photo uploaded");
									
									   List<AttachmentBean> listoffCheck = null;
										listoffCheck = allListDAO.getListOfExistingFileCheck(customer_id, result1);
										
										if (listoffCheck.size() == 0) {
									
									DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									Date date = new Date();
									System.out.println(dateFormat.format(date));
									date_of_submission = dateFormat.format(date);
									DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									Date date1 = new Date();
									System.out.println("date2" + dateFormat1.format(date1));
									DateTime_End = dateFormat1.format(date1);
									System.out.println("date_end" + DateTime_End);
	
								try {
									AllInsertDAO allInsertDAO = new AllInsertDAO();
									//AttachmentBean attachmentBean = new AttachmentBean(result1, date_of_submission, location_path2,location_path_qc,location_path_adapter,attachment_status, employeeMasterBean);
									AttachmentBean attachmentBean = new AttachmentBean(result1, date_of_submission, location_path, attachment_status, machine_serial_no, customerBean, productBean);
									boolean result = allInsertDAO.attachmentInsert(attachmentBean);
								}catch (Exception e) {
									System.out.println(e.getMessage());
								}
									 servletRequest.setAttribute("FileSuccess",
									 "<font size=\"4px\">File is uploaded Successfully.......</font>");
									  System.out.println("file Uploaded...`");
									 
									response.getWriter().print("File(s) Uploaded Successfully.......");
									// servletRequest.setAttribute("error", "File(s) Uploaded Successfully.......");
									// return "adminQc";
										} else {
											/*	servletRequest.setAttribute("FileCheck",
														"<font size=\"4px\">This file already exists.......</font>");
												System.out.println("file Exist...`");*/
												
												response.getWriter().print("This file already exists.......");
											}
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			return null;
		

	}

	@RequestMapping("/save-product2")
	public String saveFile222(HttpServletRequest servletRequest, HttpServletResponse response)
			throws ServletException, IOException {


		boolean isMultipart = ServletFileUpload.isMultipartContent(servletRequest);

		
			String filePath = servletRequest.getServletContext().getInitParameter("file-upload");

			File f = new File(filePath);
			if (!f.exists()) {
				System.out.println("path is not exist");
				servletRequest.setAttribute("FileCheckexist",
						"<font size=\"4px\">Could not upload the file because of This file path is not exist.......</font>");
				return "uploadAdmin";
			} else {

			

				// process only if it is multipart content
				if (isMultipart) {
					// Create a factory for disk-based file items
					FileItemFactory factory = new DiskFileItemFactory();

					// Create a new file upload handler
					ServletFileUpload upload = new ServletFileUpload(factory);
					String filePath1 = servletRequest.getServletContext().getInitParameter("file-upload");
					try {
						// Parse the request
						List<FileItem> multiparts = upload.parseRequest(servletRequest);
						String fieldName = null;
						String fieldValue = null;
						String fileName = null;
						String location_path = null;
						File file = null;
						int attachment_status = 0;
						String date_of_submission = null;
						String DateTime_End = null;
						int sector_id = 0;
						int product_id = 0;
						int year = 0;
						String product_name = null;
						String sector_name = null;
						String machine_serial_no = null;
						AllListDAO allListDAO = new AllListDAO();
						String username = null;
						String spmType = null;
						CustomerBean customerBean = new CustomerBean();
						ProductBean productBean = new ProductBean();
						SectorBean sectorBean = new SectorBean();
						
						CustomerProductBean customerProductBean = new CustomerProductBean();
						for (int i = 0; i < multiparts.size(); i++) {
							FileItem item = multiparts.get(i);

							if (item.isFormField()) {
								System.out.println("In If");
								fieldName = item.getFieldName();
								fieldValue = item.getString();
							
									if (fieldName.equalsIgnoreCase("sectorId")) {
										String value = fieldValue;
										sector_id = Integer.parseInt(value);
										System.out.println("sector_id:" + sector_id);
										
										sectorBean.setSector_id(sector_id);
										SectorBean sectorBean2 = allListDAO.getListOfSectorfromId(sector_id);
										
										sector_name = sectorBean2.getSector_name();
										System.out.println("sector_name"+sector_name);
										
										
										
									}
									else if(fieldName.equalsIgnoreCase("product_id")){
										String value = fieldValue;
										product_id = Integer.parseInt(value);
										System.out.println("product_id:" + product_id);
										
										productBean.setProduct_id(product_id);
										ProductBean productBean2 = allListDAO.getListOfProductfromId(product_id);
										product_name = productBean2.getProduct_name();
										System.out.println("product_name"+product_name);
														
									}
									else if(fieldName.equalsIgnoreCase("year")){
										String value = fieldValue;
										year = Integer.parseInt(value);
										System.out.println("year:" + year);
								
														
									}
									} else if (!item.isFormField()) {
									fieldName = item.getFieldName();
									System.out.println("FieldName : " + fieldName);
									fileName = item.getName();
									System.out.println("File Name : " + fileName);
	
									fileName = fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.length());
									System.out.println("File Name 1 : " + fileName);
									
									
										
									file = new File(filePath + File.separator + "application" + File.separator + sector_name + File.separator + product_name + File.separator + year);
									System.out.println("filePath:" + file);

									if(file.exists()) {
									System.out.println("folder exists");
									String name = new File(item.getName()).getName();
									String result1 = name.replaceAll("[!@#$%^&*()+=|]", "_");
									System.out.println("result1 :" + result1);
									location_path = file.toString() + File.separator + result1;
									System.out.println("filePath1:" + location_path);
	
									item.write(new File(location_path));
									System.out.println("photo uploaded");
							
	/*
								try {
									AllInsertDAO allInsertDAO = new AllInsertDAO();
									//AttachmentBean attachmentBean = new AttachmentBean(result1, date_of_submission, location_path2,location_path_qc,location_path_adapter,attachment_status, employeeMasterBean);
									AttachmentBean attachmentBean = new AttachmentBean(result1, date_of_submission, location_path, attachment_status, machine_serial_no, customerBean, productBean);
									boolean result = allInsertDAO.attachmentInsert(attachmentBean);
								}catch (Exception e) {
									System.out.println(e.getMessage());
								}*/
									 servletRequest.setAttribute("FileSuccess",
									 "<font size=\"4px\">File is uploaded Successfully.......</font>");
									  System.out.println("file Uploaded...`");
									 
									response.getWriter().print("File(s) Uploaded Successfully.......");
									// servletRequest.setAttribute("error", "File(s) Uploaded Successfully.......");
									// return "adminQc";
									}else {
										
										System.out.println("folder not exists");
										
										
										file.mkdir();
									String name = new File(item.getName()).getName();
									String result1 = name.replaceAll("[!@#$%^&*()+=|]", "_");
									System.out.println("result1 :" + result1);
									location_path = file.toString() + File.separator + result1;
									System.out.println("filePath1:" + location_path);
	
									item.write(new File(location_path));
									System.out.println("photo uploaded");
							
	/*
								try {
									AllInsertDAO allInsertDAO = new AllInsertDAO();
									//AttachmentBean attachmentBean = new AttachmentBean(result1, date_of_submission, location_path2,location_path_qc,location_path_adapter,attachment_status, employeeMasterBean);
									AttachmentBean attachmentBean = new AttachmentBean(result1, date_of_submission, location_path, attachment_status, machine_serial_no, customerBean, productBean);
									boolean result = allInsertDAO.attachmentInsert(attachmentBean);
								}catch (Exception e) {
									System.out.println(e.getMessage());
								}*/
									 servletRequest.setAttribute("FileSuccess",
									 "<font size=\"4px\">File is uploaded Successfully.......</font>");
									  System.out.println("file Uploaded...`");
									 
									response.getWriter().print("File(s) Uploaded Successfully.......");
									// servletRequest.setAttribute("error", "File(s) Uploaded Successfully.......");
									// return "adminQc";
									} 
									}
						}
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("Error : "+e.getMessage());
					}
				}
			}
			return null;
		

	}

}