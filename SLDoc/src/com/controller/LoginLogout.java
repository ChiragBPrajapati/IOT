package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.CustomerBean;
import com.bean.CustomerProductBean;
import com.bean.UserBean;
import com.dao.AllListDAO;
import com.dao.AllUpdateDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;




@Controller
public class LoginLogout extends HttpServlet {
	

	AllListDAO allListDAO = new AllListDAO();
	AllUpdateDAO allupdateDAO = new AllUpdateDAO();
	
	//This is use for convert data into json format
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
	
	 String responseData = "";
	 String jsonArray= "" ;
	 int statusCode = 0;
	 String msg = "";
	
		
	 
	@RequestMapping(value = "/login", method = RequestMethod.POST) // Mapping for Call the controller
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
	
		System.out.println("called1");
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
	        
       String encodeText = new AESEncrypt().encrypt(password);
      // String encodeText = new EncodeDecode().encodeString("password");
		UserBean userBean = allListDAO.checkLogin(userName, encodeText);
		
		CustomerBean customerBean = allListDAO.customerDetailsByUsername(userName);
		
		System.out.println("checkkkk :"+encodeText +"-----"+userName +"-----"+ password);
		String page = "";
		HttpSession session = request.getSession();
		
		if(userBean != null) {
			
			final String custId = String.valueOf(userBean.getCustomer_id());
			
			String userSession = new EncodeDecode().encodeString("userSession");
			session.setAttribute(userSession, userBean);
			
			String customerSession = new EncodeDecode().encodeString("customerSession");
			session.setAttribute(customerSession, customerBean);
			
			/*Syncing process for local to live & live to local*/
			
			//String url = request.getRequestURL().toString();
			
			
			if(userBean.getCustomerTypeBean().getCustomer_type_id() == 1 || userBean.getCustomerTypeBean().getCustomer_type_id() == 4) {
				page = "addCustomer";
			}else if(userBean.getCustomerTypeBean().getCustomer_type_id() == 3){
				page = "customerMDashboard";
			}else if(userBean.getCustomerTypeBean().getCustomer_type_id() == 2) {
				page = "serviceEngDashboard";
			}
			
		}else {
			System.out.println("checkkkk2222222222");
			request.setAttribute("loginError","Username & Password not match.");
			page = "login";
		}
		
		return page;
	}
	

	
	@RequestMapping(value = "/logout", method = RequestMethod.GET) // Mapping for Call the controller
	public String logout(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException 
	{
	
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "login";
	}
	
	
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for send data
	public String changePassword(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
	
		String password = request.getParameter("pass");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		
		UserBean userBean = allListDAO.detailsOfUserByUserId(user_id);
		
		String encodePass = new AESEncrypt().encrypt(password);
		
		boolean changePass = allupdateDAO.changePassword(user_id, encodePass);
		
		return null;
	}

	
}

