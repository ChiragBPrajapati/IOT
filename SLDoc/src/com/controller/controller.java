package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.result.Output;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.AttachmentBean;
import com.bean.CustomerBean;
import com.bean.CustomerProductBean;
import com.bean.CustomerTypeBean;
import com.bean.DownloadLogBean;
import com.bean.ProductBean;
import com.bean.SectorBean;
import com.bean.UserBean;
import com.dao.AllDeleteDAO;
import com.dao.AllInsertDAO;
import com.dao.AllListDAO;
import com.dao.AllUpdateDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class controller {

	AllInsertDAO allInsertDAO = new AllInsertDAO();
	AllUpdateDAO allUpdateDAO = new AllUpdateDAO();
	AllListDAO allListDAO = new AllListDAO();
	AllDeleteDAO allDeleteDAO = new AllDeleteDAO();


	
	
	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/redirect", method = RequestMethod.GET) // Mapping for Call the controller
	public String redirect(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String page = request.getParameter("p");

		String decodeText = new EncodeDecode().decodeString(page);
		return decodeText;
	}

	@RequestMapping(value = "/sectorInsert", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String productProcessInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sectorName = request.getParameter("sName");

		SectorBean sectorBean = new SectorBean(sectorName);

		System.out.println("sectorName :" + sectorName);

		SectorBean result1 = allListDAO.checksector(sectorName);
		
		if(result1 == null) {
		
		File file3 = new File("\\\\D:\\DATASTORAE\\SLDoc\\application\\"+sectorName+"");
	
		if (!file3.exists()) {
			System.out.println("file:"+file3);
            if (file3.mkdirs()) {
                System.out.println("Multiple directories are created!");
            } else {
                System.out.println("Failed to create multiple directories!");
            }
        }
		
		
		boolean result = allInsertDAO.sectorInsert(sectorBean);

		
		}else {
		
		String output = "Sector name is already exist";
	/*	response.getWriter().print(output);
		response.sendRedirect("redirect?p=YWRkU2VjdG9y&output="+output);
		*/
		
		request.setAttribute("sectorError", "Sector name is already exist");
		}
		try {
			request.getRequestDispatcher("redirect?p=YWRkU2VjdG9y").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	@RequestMapping(value = "/productInsert", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String productInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String productName = request.getParameter("prod_name");
		String sector_id= request.getParameter("sectorId");
		int secId = Integer.parseInt(sector_id);
		
		ProductBean result1 = allListDAO.checkproduct(productName);
		if(result1 == null) {
		
		SectorBean sectorBean = new SectorBean();
		sectorBean.setSector_id(secId);
		
		SectorBean sectorBean2 = allListDAO.getListOfSectorfromId(secId);
		String sectorName = sectorBean2.getSector_name();
		
		ProductBean productBean = new ProductBean(productName, sectorBean);

		boolean result = allInsertDAO.productInsert(productBean);
		
		File file3 = new File("\\\\D:\\DATASTORAE\\SLDoc\\application\\"+sectorName+"\\"+productName+"");
		
		if (!file3.exists()) {
			System.out.println("file:"+file3);
            if (file3.mkdirs()) {
                System.out.println("Multiple directories are created!");
            } else {
                System.out.println("Failed to create multiple directories!");
            }
        }
		}else {
		/*response.sendRedirect("redirect?p=YWRkUHJvZHVjdA==");

		return null;*/

			request.setAttribute("productError", "Product name is already exist");
		}
		try {
			
			request.getRequestDispatcher("redirect?p=YWRkUHJvZHVjdA==").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	@RequestMapping(value = "/customerInsert", method = RequestMethod.GET)
	@ResponseBody // for return specific value
	public String processCardentials(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String message = "Invalid User Name And Password !!!";

		String username = request.getParameter("username");

		
		
		
		String password = request.getParameter("password");
		// System.out.println("username"+userName + "password==> " +password);
		//String encryptedPassword = EncodeDecode.encodeString(password);
		
		UserBean userBean1 = allListDAO.checkUsername(username);
		
		if(userBean1 == null) {
		String encryptedPassword = new AESEncrypt().encrypt(password);
		System.out.println("pass" + encryptedPassword);
		String fullname = request.getParameter("fName");
		String company_name = request.getParameter("cName");
		String machine_serial_no = request.getParameter("machineSerialNo");
		String custType = request.getParameter("custType");
		int cId = Integer.parseInt(custType);
		String product = request.getParameter("prodId");
		System.out.println("product :"+product);
		int pId = Integer.parseInt(product);
		System.out.println("pId :"+pId);
		String contact_one = request.getParameter("cNoOne");
		String contact_two = request.getParameter("cNoTwo");
		String email_one = request.getParameter("emailOne");
		String email_two = request.getParameter("emailTwo");
		String adress = request.getParameter("address");
		String custProdInfo = request.getParameter("custProdInfo");
		
		
		String active = "1";
		int active1 = Integer.parseInt(active);
		int authority = 1;
		Date creation_date = new Date();
		Date deletion_date = new Date();

		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		customerTypeBean.setCustomer_type_id(cId);
		
		ProductBean productBean = new ProductBean();
		productBean.setProduct_id(pId);


		CustomerBean customerBean = new CustomerBean( username, encryptedPassword,
				fullname, company_name, contact_one, contact_two, email_one, email_two, adress, 
				active, creation_date, deletion_date, machine_serial_no, customerTypeBean, productBean);
		boolean result = allInsertDAO.customerInsert(customerBean);
		
		CustomerBean customerBean2 = allListDAO.customerDetailsByUsername(username);
		int customer_id = customerBean2.getCustomer_id();
		customerBean2.setCustomer_id(customer_id);
		
		UserBean userBean = new UserBean(fullname, username, encryptedPassword, creation_date, active1, machine_serial_no, authority, customer_id, customerTypeBean);
		boolean result1 = allInsertDAO.userInsert(userBean);
		
		ProductBean productBean2 = allListDAO.getListOfProductfromId(pId);
		int product_id = productBean2.getProduct_id();
		int sector_id = productBean2.getSectorBean().getSector_id();
		
		SectorBean sectorBean2 = new SectorBean();
		sectorBean2.setSector_id(sector_id);
		
		productBean2.setProduct_id(product_id);
		productBean2.setSectorBean(sectorBean2);
		
		CustomerProductBean customerProductBean = new CustomerProductBean(machine_serial_no,custProdInfo,productBean2, customerBean2, sectorBean2);
		boolean result2 = allInsertDAO.customerProductInsert(customerProductBean);

		//firstName = employeeMasterBean.getFirstname();
		String prod_name = productBean2.getProduct_name().trim();
		
		File file3 = new File("\\\\D:\\DATASTORAE\\SLDoc\\"+username+"\\"+prod_name+"_"+machine_serial_no+"\\application");
		File file4 = new File("\\\\D:\\DATASTORAE\\SLDoc\\"+username+"\\"+prod_name+"_"+machine_serial_no+"\\docs");
	
		if (!file3.exists()) {
			System.out.println("file:"+file3);
            if (file3.mkdirs()) {
                System.out.println("Multiple directories are created!");
            } else {
                System.out.println("Failed to create multiple directories!");
            }
        }
		if (!file4.exists()) {
			System.out.println("file:"+file4);
            if (file4.mkdirs()) {
                System.out.println("Multiple directories are created!");
            } else {
                System.out.println("Failed to create multiple directories!");
            }
        }
		
		response.sendRedirect("redirect?p=YWRkQ3VzdG9tZXI=");
		return null;
		
	
		}
		
	/*	String output = "Username is already exist";
		response.getWriter().print(output);
		response.sendRedirect("redirect?p=YWRkQ3VzdG9tZXI=");
		return null;
*/	try {
	request.setAttribute("loginError", "Username is already exist");
	
	request.getRequestDispatcher("redirect?p=YWRkQ3VzdG9tZXI=").forward(request, response);
} catch (ServletException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


return null;
		
		
	}
	@RequestMapping(value = "/addnewMachine", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String addnewMachine(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		
		String machine_serial_no = request.getParameter("machineSerialNo");
		System.out.println("machine_serial_no :"+machine_serial_no);
		String custProdInfo = request.getParameter("custProdInfo");
		
		String product = request.getParameter("prodId");
		System.out.println("product :"+product);
		int pId = Integer.parseInt(product);
		System.out.println("pId :"+pId);
		
		String customer_id = request.getParameter("customerIdd");
		System.out.println("customer_id :"+customer_id);
		int cust_id = Integer.parseInt(customer_id);
		System.out.println("cust_id :"+cust_id);
		
		CustomerBean customerBean2 = new CustomerBean();
		customerBean2.setCustomer_id(cust_id);
		
		CustomerBean c = allListDAO.customerDetails(cust_id);
		String username = c.getUsername();
		
		ProductBean productBean2 = allListDAO.getListOfProductfromId(pId);
		int product_id = productBean2.getProduct_id();
		int sector_id = productBean2.getSectorBean().getSector_id();
		
		SectorBean sectorBean2 = new SectorBean();
		sectorBean2.setSector_id(sector_id);
		
		productBean2.setProduct_id(product_id);
		productBean2.setSectorBean(sectorBean2);

		CustomerProductBean customerProductBean = new CustomerProductBean(machine_serial_no,custProdInfo,productBean2, customerBean2, sectorBean2);
		
		boolean result = allInsertDAO.customerProductInsert(customerProductBean);
		//firstName = employeeMasterBean.getFirstname();
		String prod_name = productBean2.getProduct_name().trim();
		
		File file3 = new File("\\\\D:\\DATASTORAE\\SLDoc\\"+username+"\\"+prod_name+"_"+machine_serial_no+"\\application");
		File file4 = new File("\\\\D:\\DATASTORAE\\SLDoc\\"+username+"\\"+prod_name+"_"+machine_serial_no+"\\docs");
	
		if (!file3.exists()) {
			System.out.println("file:"+file3);
            if (file3.mkdirs()) {
                System.out.println("Multiple directories are created!");
            } else {
                System.out.println("Failed to create multiple directories!");
            }
        }
		if (!file4.exists()) {
			System.out.println("file:"+file4);
            if (file4.mkdirs()) {
                System.out.println("Multiple directories are created!");
            } else {
                System.out.println("Failed to create multiple directories!");
            }
        }
		
		if (result == true) {
			response.sendRedirect("redirect?p=YWRkQ3VzdG9tZXI=");
		}
		return null;

	}
	
	@RequestMapping(value = "/deactiveProduct", method = RequestMethod.GET) // Mapping for Call the controller
	public String deactiveProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pId = Integer.parseInt(request.getParameter("cId"));

		int active = 0;

		boolean result = allDeleteDAO.deleteProduct(pId);

		if (result == true) {
			response.sendRedirect("redirect?p=YWRkUHJvZHVjdA==");
		}

		return null;

	}
	
	@RequestMapping(value = "/deactiveSector", method = RequestMethod.GET) // Mapping for Call the controller
	public String deactiveCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int sId = Integer.parseInt(request.getParameter("cId"));

		int active = 0;

		boolean result = allDeleteDAO.deleteSector(sId);

		if (result == true) {
			response.sendRedirect("redirect?p=YWRkU2VjdG9y");
		}

		return null;

	}



	@RequestMapping(value = "/deactiveCustomer", method = RequestMethod.GET) // Mapping for Call the controller
	public String deactiveCustomer1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));

		int active = 0;

		CustomerBean customerBean = allListDAO.customerDetails(cId);
		String username = customerBean.getUsername();
		int cust_type_id = customerBean.getCustomerTypeBean().getCustomer_type_id();
		
		boolean result = allDeleteDAO.deleteCustomer(cId);
		
		UserBean userBean = new UserBean();
		boolean resilt1 = allDeleteDAO.deleteUser(cId);
		
		File file3 = new File("\\\\D:\\DATASTORAE\\SLDoc\\"+username+"");
		if(file3.isDirectory()) {
			
		File[] listFiles = file3.listFiles();
		for(File file : listFiles){
			
			if(file.isDirectory()) {
				
				File[] listFiles1 = file.listFiles();
				for(File file1 : listFiles1){
					System.out.println("Deleting "+file.getName());
					file1.delete();
				}
			}
			System.out.println("Deleting "+file.getName());
			file.delete();
		}
		
		if (file3.exists()) {
			System.out.println("file:"+file3);
            if (file3.delete()) {
                System.out.println("Multiple directories are deleted!");
            } else {
                System.out.println("Failed to delet multiple directories!");
            }
        }
		}
		if (result == true) {
			if(cust_type_id == 3) {
			response.sendRedirect("redirect?p=YWRkQ3VzdG9tZXI=");
			}else if(cust_type_id == 4) {
				response.sendRedirect("redirect?p=YWRkQWRtaW4=");
			}
		}
		return null;

}
	@RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
	protected String fileDownload(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		FileInputStream fileInputStream = null;
		String mac_adress = null;
		String ip_adress = null;
		
		SimpleDateFormat ddmmyyyyhhmmss = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
		SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");
		AllListDAO aaaaa = new AllListDAO();

		String prodId = request.getParameter("prodId");
		int pId = Integer.parseInt(prodId);
		System.out.println("pId"+pId);
		
		int attachment_status = Integer.parseInt(request.getParameter("attachment_status"));
		System.out.println("attachment_status :"+attachment_status);
		
		
		String user_id = request.getParameter("user_id");
		System.out.println("user_id :"+user_id);
		
		int uId = Integer.parseInt(user_id);
		System.out.println("uId :"+uId);
		CustomerBean c = allListDAO.customerDetails(uId);
		String userName = c.getUsername();
		int customer_id = c.getCustomer_id();
		System.out.println("customer_id"+customer_id);
		
		c.setCustomer_id(customer_id);
		System.out.println("userName"+userName);
		
		CustomerProductBean customerProductBean = allListDAO.listOfCustomerProductFromprodId(pId ,customer_id);
		String machine_serial_no = request.getParameter("machine_serial_no");
		System.out.println("machine_serial_no"+machine_serial_no);
		String product_name = request.getParameter("product_name");
		System.out.println("product_name"+product_name);
		
		
		//	String filePath = request.getServletContext().getInitParameter("file-download-admin");
			String filePath = request.getServletContext().getInitParameter("file-upload");

			File f = new File(filePath);
			if (!f.exists()) {
				System.out.println("path is not exist");
		
			}
			
			AllListDAO allListDAO = new AllListDAO();
			response.setContentType("text/html");
			String proof = request.getParameter("attachment");
			System.out.println("proofffffffffffffffffff :"+proof);
			
		


			response.setHeader("Content-Disposition", "attachment; filename=\"" + proof + "\"");
			System.out.println("filePath"+filePath);
			
			if(attachment_status == 1) {
				 fileInputStream = new FileInputStream(filePath+ File.separator + userName + File.separator + product_name + "_" + machine_serial_no
						+ File.separator + "application" + File.separator + proof);
				
			}else {
				
				 fileInputStream = new FileInputStream(filePath+ File.separator + userName + File.separator + product_name + "_" + machine_serial_no
						+ File.separator + "docs" + File.separator + proof);
			}
			
			
			
		
			
			String ipAddress=null;
			InetAddress ip = null;
			try {

				ip = InetAddress.getLocalHost();
				System.out.println("Current IP address : " + ip.getHostAddress());
				
				
				String getWay = request.getHeader("VIA");   // Gateway
				ipAddress = request.getHeader("X-FORWARDED-FOR");   // proxy
				if(ipAddress==null)
				{
				   ipAddress = request.getRemoteAddr();
				    
				}
				
				macAdress m = new macAdress();
				
				m.getMacAddrHost(ipAddress);
				
	
				 byte[] bytes = ip.getAddress();
				//InetAddress address = InetAddress.getByName(ipAddress);
				InetAddress address = InetAddress.getByAddress(bytes);
				System.out.println("address : " + address);
				
				NetworkInterface network = NetworkInterface.getByInetAddress(address);

				byte[] mac = network.getHardwareAddress();

				System.out.print("Current MAC address : ");

				StringBuilder sb = new StringBuilder();
				for (int i = 0; i < mac.length; i++) {
					sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
				}
				System.out.println(sb.toString());

				mac_adress = sb.toString();
			} catch (SocketException e){

				e.printStackTrace();

			}
			 ip_adress =  ip.getHostAddress();
			Date date = new Date();
			DownloadLogBean downloadLogBean = new DownloadLogBean(proof, filePath, date, mac_adress, ipAddress, uId, c);
			boolean result = allInsertDAO.downloadLogInsert(downloadLogBean);
			
			
			//====Test Purpose//=========
			//FileInputStream fileInputStream = new FileInputStream("//analyzerserver/DATASTORAE/nebula_cloud/Ripal_129/upload/K154-64.rgh");
			
			//===========================
	/*		int i;
			
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();*/
			
			OutputStream out1 = response.getOutputStream();
			
			byte[] buffer = new byte[4096];
	         int length;
	         while ((length = fileInputStream.read(buffer)) > 0){
	        	 out1.write(buffer, 0, length);
	         }
	         fileInputStream.close();
	         out1.flush();

	         
	         
	         
				return null;
			
		

	}
	@RequestMapping(value = "/appDownload", method = RequestMethod.GET)
	protected String appDownload(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		SimpleDateFormat ddmmyyyyhhmmss = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
		SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");
		AllListDAO aaaaa = new AllListDAO();

		String product_name = request.getParameter("product_name");

		String sector_name = request.getParameter("sector_name");
		

		
		//	String filePath = request.getServletContext().getInitParameter("file-download-admin");
			String filePath = request.getServletContext().getInitParameter("file-upload-application");

			File f = new File(filePath);
			if (!f.exists()) {
				System.out.println("path is not exist");
		
			}
			
			AllListDAO allListDAO = new AllListDAO();


			response.setContentType("text/html");
			//PrintWriter out = response.getWriter();
			String proof = request.getParameter("attachment");
			System.out.println("proofffffffffffffffffff :"+proof);
	/*		proof = proof.replaceAll(" ","+");
			System.out.println("result1 :"+ proof);
		*/


			response.setHeader("Content-Disposition", "attachment; filename=\"" + proof + "\"");
			System.out.println("filePath"+filePath);
			
			FileInputStream fileInputStream = new FileInputStream(filePath+ File.separator + sector_name + File.separator + product_name + File.separator + proof);
			
			
			//====Test Purpose//=========
			//FileInputStream fileInputStream = new FileInputStream("//analyzerserver/DATASTORAE/nebula_cloud/Ripal_129/upload/K154-64.rgh");
			
			//===========================
	/*		int i;
			
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();*/
			
			OutputStream out1 = response.getOutputStream();
			
			byte[] buffer = new byte[4096];
	         int length;
	         while ((length = fileInputStream.read(buffer)) > 0){
	        	 out1.write(buffer, 0, length);
	         }
	         fileInputStream.close();
	         out1.flush();

				return null;
			
		

	}
	
	@RequestMapping(value = "/appYearDownload", method = RequestMethod.GET)
	protected String appYearDownload(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		SimpleDateFormat ddmmyyyyhhmmss = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
		SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");
		AllListDAO aaaaa = new AllListDAO();

		String product_name = request.getParameter("product_name");

		String sector_name = request.getParameter("sector_name");
		
		String year = request.getParameter("year");

		
		//	String filePath = request.getServletContext().getInitParameter("file-download-admin");
			String filePath = request.getServletContext().getInitParameter("file-upload-application");

			File f = new File(filePath);
			if (!f.exists()) {
				System.out.println("path is not exist");
		
			}
			
			AllListDAO allListDAO = new AllListDAO();


			response.setContentType("text/html");
			//PrintWriter out = response.getWriter();
			String proof = request.getParameter("attachment");
			System.out.println("proofffffffffffffffffff :"+proof);
	/*		proof = proof.replaceAll(" ","+");
			System.out.println("result1 :"+ proof);
		*/


			response.setHeader("Content-Disposition", "attachment; filename=\"" + proof + "\"");
			System.out.println("filePath"+filePath);
			
			FileInputStream fileInputStream = new FileInputStream(filePath+ File.separator + sector_name + File.separator + product_name + File.separator + year + File.separator + proof);
			
			
			//====Test Purpose//=========
			//FileInputStream fileInputStream = new FileInputStream("//analyzerserver/DATASTORAE/nebula_cloud/Ripal_129/upload/K154-64.rgh");
			
			//===========================
	/*		int i;
			
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();*/
			
			OutputStream out1 = response.getOutputStream();
			
			byte[] buffer = new byte[4096];
	         int length;
	         while ((length = fileInputStream.read(buffer)) > 0){
	        	 out1.write(buffer, 0, length);
	         }
	         fileInputStream.close();
	         out1.flush();

				return null;
			
		

	}
	
	@RequestMapping(value = "/adminInsert", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String adminInsert(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		String wIdArray = request.getParameter("SIDSS");
		System.out.println("wIdArray :"+wIdArray);
		String fullname = request.getParameter("fullname11");
		System.out.println("fullname :"+fullname);
		String username = request.getParameter("username11");
		System.out.println("username :"+username);
		String password = request.getParameter("password11");
		System.out.println("password :"+password);
	
		String emailId = request.getParameter("emaillIdd");
		System.out.println("emailId :"+emailId);
	
		
		String mobNo = request.getParameter("mobNoo");
		System.out.println("mobNo :"+mobNo);
	
		
		String encryptedPassword = new AESEncrypt().encrypt(password);
		System.out.println("pass" + encryptedPassword);
		String empCode = request.getParameter("empCodee");
	
		String error = "";

		String active = "1";
		int active1 = Integer.parseInt(active);
		int authority = 1;
		Date creation_date = new Date();
		Date deletion_date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");

		int cId = 4;
		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		customerTypeBean.setCustomer_type_id(cId);

		/*if (request.getParameter("SIDSS") != null) {*/
			String[] arr = wIdArray.split(",");
			System.out.println("=====" + arr.length);
			String output = null;
			if (arr.length != 0) {

				
				 StringBuffer sb = new StringBuffer();
			      for(int i = 0; i < arr.length; i++) {
			         sb.append(arr[i]);
			         
			      }
			      String str = sb.toString();
			      System.out.println(str);
				
			      int sum = 0;  
			      for (String s : arr) {
			    	  int num = Integer.parseInt(s); 
			    	    sum += num;
			    	System.out.println("The sum is " + sum);
			    	}
			      
			    		  String sum1 = Integer.toString(sum); 
			    		  
			 /*     	int intStr = Integer.parseInt(str);
			      	ProductBean productBean = new ProductBean();
					productBean.setProduct_name(str);*/
			      
				boolean flag = false;

				CustomerBean customerBean = new CustomerBean(username, encryptedPassword, fullname, active, creation_date, deletion_date, customerTypeBean, sum1 ,empCode ,mobNo ,emailId);
				boolean result = allInsertDAO.customerInsert(customerBean);
				
				CustomerBean customerBean2 = allListDAO.customerDetailsByUsername(username);
				int customer_id = customerBean2.getCustomer_id();
				customerBean2.setCustomer_id(customer_id);
				
				UserBean userBean = new UserBean(fullname, username, encryptedPassword, creation_date, active1, authority, customer_id, customerTypeBean);
				boolean result1 = allInsertDAO.userInsert(userBean);
				
				
				if(result1 = true) {
					 output = "success";
				}
			
			} else {
				error = "Please choose atleast one Product----- !!!";
				 output = error;
			}
		/*} else {
			error = "Please choose atleast one Product======= !!!";
		}
*/
			/*response.sendRedirect(output);*/
			response.getWriter().print(output);
		return null;
	}
	
	
	
	
	@RequestMapping(value = "/serviceEngInsert", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String serviceEngInsert(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		String wIdArray = request.getParameter("SIDSS");
		System.out.println("wIdArray :"+wIdArray);
		String fullname = request.getParameter("fullname11");
		System.out.println("fullname :"+fullname);
		String username = request.getParameter("username11");
		System.out.println("username :"+username);
		String password = request.getParameter("password11");
		System.out.println("password :"+password);
	
		String emailId = request.getParameter("emaillIdd");
		System.out.println("emailId :"+emailId);
	
		
		String mobNo = request.getParameter("mobNoo");
		System.out.println("mobNo :"+mobNo);
	
		
		String encryptedPassword = new AESEncrypt().encrypt(password);
		System.out.println("pass" + encryptedPassword);
		String empCode = request.getParameter("empCodee");
	
		String error = "";

		String active = "1";
		int active1 = Integer.parseInt(active);
		int authority = 1;
		Date creation_date = new Date();
		Date deletion_date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");

		int cId = 2;
		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		customerTypeBean.setCustomer_type_id(cId);

		/*if (request.getParameter("SIDSS") != null) {*/
			String[] arr = wIdArray.split(",");
			System.out.println("=====" + arr.length);
			String output = null;
			if (arr.length != 0) {

				
				 StringBuffer sb = new StringBuffer();
			      for(int i = 0; i < arr.length; i++) {
			         sb.append(arr[i]);
			      }
			      String str = sb.toString();
			      System.out.println(str);
				
			 /*     	int intStr = Integer.parseInt(str);
			      	ProductBean productBean = new ProductBean();
					productBean.setProduct_name(str);*/
			      
				boolean flag = false;

				CustomerBean customerBean = new CustomerBean(username, encryptedPassword, fullname, active, creation_date, deletion_date, customerTypeBean, wIdArray ,empCode ,mobNo ,emailId);
				boolean result = allInsertDAO.customerInsert(customerBean);
				
				CustomerBean customerBean2 = allListDAO.customerDetailsByUsername(username);
				int customer_id = customerBean2.getCustomer_id();
				customerBean2.setCustomer_id(customer_id);
				
				UserBean userBean = new UserBean(fullname, username, encryptedPassword, creation_date, active1, authority, customer_id, customerTypeBean);
				boolean result1 = allInsertDAO.userInsert(userBean);
				
				
				if(result1 = true) {
					 output = "success";
				}
			
			} else {
				error = "Please choose atleast one Product----- !!!";
				 output = error;
			}
		/*} else {
			error = "Please choose atleast one Product======= !!!";
		}
*/
			/*response.sendRedirect(output);*/
			response.getWriter().print(output);
		return null;
	}
	
	
	
	@RequestMapping(value = "/updateServiceEng", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String updateServiceEng(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		String cust_id = request.getParameter("cId");
		int customer_id = Integer.parseInt(cust_id);
		
		String wIdArray = request.getParameter("PIDS");
		System.out.println("wIdArray :"+wIdArray);
		String fullname = request.getParameter("fName");
		System.out.println("fullname :"+fullname);
		String username = request.getParameter("uName");
		System.out.println("username :"+username);
		String password = request.getParameter("sPassword");
		System.out.println("password :"+password);
		String encryptedPassword = new AESEncrypt().encrypt(password);
	
		String empCode = request.getParameter("cCode");
	
		String mobNo = request.getParameter("mobNo");
		System.out.println("mobNo :"+mobNo);
		
		String emailId = request.getParameter("emailId");
		System.out.println("emailId :"+emailId);

		/*if (request.getParameter("SIDSS") != null) {*/
			String[] arr = wIdArray.split(",");
			System.out.println("=====" + arr.length);
			String output = null;
			if (arr.length != 0) {

				
				 StringBuffer sb = new StringBuffer();
			      for(int i = 0; i < arr.length; i++) {
			         sb.append(arr[i]);
			      }
			      String str = sb.toString();
			      System.out.println(str);
				
			 /*     	int intStr = Integer.parseInt(str);
			      	ProductBean productBean = new ProductBean();
					productBean.setProduct_name(str);*/
			      
				boolean flag = false;

				CustomerBean customerBean = new CustomerBean(username, encryptedPassword, fullname, wIdArray ,empCode , mobNo , emailId);
				boolean result = allUpdateDAO.customerUpdate(username, encryptedPassword, fullname, wIdArray, empCode,mobNo , emailId, customer_id);
				
				CustomerBean customerBean2 = allListDAO.customerDetailsByUsername(username);
		
				
				UserBean userBean = new UserBean(fullname, username, encryptedPassword, customer_id);
				boolean result1 = allUpdateDAO.userUpdate(username, encryptedPassword, fullname,customer_id);
				
				
				if(result1 = true) {
					 output = "success";
				}
			
			} else {
				String error = "Please choose atleast one Product----- !!!";
				 output = error;
			}
		/*} else {
			error = "Please choose atleast one Product======= !!!";
		}
*/
			/*response.sendRedirect(output);*/
			/*response.getWriter().print(output);*/
			

			if (output == "success") {
				response.sendRedirect("redirect?p=YWRkQ3VzdG9tZXI=");
			}

			return null;
	}
	
	@RequestMapping(value = "/updateAdmin", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String updateAdmin(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		String cust_id = request.getParameter("cId");
		int customer_id = Integer.parseInt(cust_id);
		
		String wIdArray = request.getParameter("SIDSS");
		System.out.println("wIdArray :"+wIdArray);
		String fullname = request.getParameter("fName");
		System.out.println("fullname :"+fullname);
		String username = request.getParameter("uName");
		System.out.println("username :"+username);
		String password = request.getParameter("sPassword");
		System.out.println("password :"+password);
		String encryptedPassword = new AESEncrypt().encrypt(password);
	
		String empCode = request.getParameter("cCode");
	
		String mobNo = request.getParameter("mobNo");
		System.out.println("mobNo :"+mobNo);
		
		String emailId = request.getParameter("emailId");
		System.out.println("emailId :"+emailId);

		/*if (request.getParameter("SIDSS") != null) {*/
			String[] arr = wIdArray.split(",");
			System.out.println("=====" + arr.length);
			String output = null;
			if (arr.length != 0) {

				
				 StringBuffer sb = new StringBuffer();
			      for(int i = 0; i < arr.length; i++) {
			         sb.append(arr[i]);
			      }
			      String str = sb.toString();
			      System.out.println(str);
				
			 /*     	int intStr = Integer.parseInt(str);
			      	ProductBean productBean = new ProductBean();
					productBean.setProduct_name(str);*/
			    
			      int sum = 0;  
			      for (String s : arr) {
			    	  int num = Integer.parseInt(s); 
			    	    sum += num;
			    	System.out.println("The sum is " + sum);
			    	}
			      
			    		  String sum1 = Integer.toString(sum); 
			      
				boolean flag = false;

				CustomerBean customerBean = new CustomerBean(username, encryptedPassword, fullname, sum1 ,empCode , mobNo , emailId);
				boolean result = allUpdateDAO.customerUpdate(username, encryptedPassword, fullname, sum1, empCode,mobNo , emailId, customer_id);
				
				CustomerBean customerBean2 = allListDAO.customerDetailsByUsername(username);
		
				
				UserBean userBean = new UserBean(fullname, username, encryptedPassword, customer_id);
				boolean result1 = allUpdateDAO.userUpdate(username, encryptedPassword, fullname,customer_id);
				
				
				if(result1 = true) {
					 output = "success";
				}
			
			} else {
				String error = "Please choose atleast one Product----- !!!";
				 output = error;
			}
		/*} else {
			error = "Please choose atleast one Product======= !!!";
		}
*/
			/*response.sendRedirect(output);*/
			/*response.getWriter().print(output);*/
			

			if (output == "success") {
				response.sendRedirect("redirect?p=YWRkQWRtaW4=");
			}

			return null;
	}
	
	
	@RequestMapping(value = "/detailsOfServiceEng", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String detailsOfCustomerMaster(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		int active = 0;

		// Call the method for get details of Specification Of Field Detail
		CustomerBean customerBean = allListDAO.customerDetails(cId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(customerBean);

		return jsonArray;
	}

	
	
	@RequestMapping(value = "/custProductInfo", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String custProductInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
		int custProdId = Integer.parseInt(request.getParameter("cust_prod_id"));
		CustomerProductBean customerProductBean = allListDAO.listOfCustomerProductFromCustProdId(custProdId);

		int custId = customerProductBean.getCustomerBean().getCustomer_id() ;
		int prodId = customerProductBean.getProductBean().getProduct_id();
		String machine_serial_no = customerProductBean.getMachine_serial_no();
		
		List<AttachmentBean> listofAttachment = allListDAO.listOfAttachmentUsingSegment(custId, prodId, machine_serial_no);
		
		System.out.println("list ni size :"+listofAttachment.size());
		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(listofAttachment);

		System.out.println("jsonArray:"+jsonArray);
		return jsonArray;
	}
	
	
	@RequestMapping(value = "/deleteAttachment", method = RequestMethod.GET) // Mapping for Call the controller
	public String deleteAttachment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int attachmentId = Integer.parseInt(request.getParameter("attachmentId"));

		int active = 0;

		
		boolean result = allDeleteDAO.deleteAttachment(attachmentId);

		if (result == true) {
			response.sendRedirect("redirect?p=YWRkQ3VzdG9tZXI=");
		}

		return null;

	}
}