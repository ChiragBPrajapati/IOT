<%@page import="javax.swing.text.Segment"%>
<%@page import="com.bean.SectorBean"%>
<%@page import="com.bean.CustomerProductBean"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="com.bean.CustomerTypeBean"%>
<%@page import="com.dao.AllListDAO"%>
<%@page import="com.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Master</title>

</head>
	<%
	String customerSession = new EncodeDecode().encodeString("customerSession");
	CustomerBean customerBean1 = (CustomerBean) session.getAttribute(customerSession);
	int temp_cust_id = 0;
	int temp_cust_type_id = 0;
	int userLoginCustId = 0;
	if(customerBean1 != null){
		userLoginCustId = customerBean1.getCustomer_id();
		temp_cust_type_id = customerBean1.getCustomerTypeBean().getCustomer_type_id();
	}
	if(temp_cust_type_id == 2 || temp_cust_type_id == 3){
	/* 	session.removeAttribute("customerBean1");
		session.invalidate(); */
		response.sendRedirect("redirect?p=bG9naW4=");
	}
	
	
	
	%>

<body>
<%@include file="header.jsp" %>

<%
	AllListDAO allListDAO = new AllListDAO();
	int parent_id = 0;
	int value = 0;
	List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
	List<ProductBean> listOfProduct =  allListDAO.listOfProduct();
	List<CustomerBean> listOfCustomer =  allListDAO.listOfOnlyCustomer();
	List<CustomerBean> listOfServiceEng =  allListDAO.listOfOnlyServiceEng();
	
	List<SectorBean> listOfSegment =  allListDAO.listOfSector();

	
	int cid = 0;
	int pid = 0;
	int sid = 0;
	int uuId = 0;
	 String[] namesArray = null;
	 String wIdArra = null;
	 boolean test1 = false;
	if(request.getParameter("uuId") != null){
		uuId =Integer.parseInt(request.getParameter("uuId"));
		
		CustomerBean customerBean = allListDAO.customerDetails(uuId);
		
		 wIdArra = customerBean.getProducts();
		
		if(wIdArra != null){
	      
	      //Split string with comma
	      namesArray = wIdArra.split(",");
		}
		
	}
	

	
	
/* 	String fullname1 = null;
	String username1 = null;
	String password1 = null;
	String empCode = null; */
	
/* 	
	if(request.getParameter("fullname1") != null){
		fullname1 = request.getParameter("fullname1");
	}
	if(request.getParameter("username1") != null){
		username1 = request.getParameter("username1");
	}
	if(request.getParameter("password1") != null){
		password1 = request.getParameter("password1");
	}
	if(request.getParameter("empCode") != null){
		empCode = request.getParameter("empCode");
	}
	
	 */
	
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-user-tie"></i> Customer Master</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">SLDoc Portal</a></li>
		                  <li class="breadcrumb-item active">Customer Master</li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="javascript:$('#insertDiv').show();$('#tableDiv').hide();$('#updateDiv').hide();" data-toggle="tooltip"
						data-original-title="Add New Customer">
						<i class="icon-plus"></i>
					</button>
					
						<button type="button" class="btn-icon btn btn-secondary btn-round" 
			title="Add Service Engineer"
						data-original-title="Add Service Engineer" style="cursor: pointer;"  data-toggle="modal" data-target="#inlineForm1" >
						<i class="icon-android-person-add"></i>
					</button>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>

			<br>
	<%if(request.getAttribute("loginError") !=null ) {%>
	<div class="body">
		<div class="alert alert-dismissable alert bg-grey"
			data-type="autoclose-timer">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<b>${loginError}</b>
		</div>
	</div>
	<%}%>			
			<!-- <ul class="nav nav-tabs nav-linetriangle no-hover-bg">
 					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=Y2hhbGxhbk1hc3Rlcg==" aria-expanded="true">Challan Entry</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" id="base-tab" href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=" aria-expanded="true">Customer Master</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="base-tab"  href="redirect?p=cHJvZHVjdE1hc3Rlcg==" aria-expanded="true">Product Master</a>
					</li>
			</ul> -->
			
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-3">
									<h4 class="card-title" id="striped-label-layout-icons">Customer Master</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
								<ul class="nav nav-tabs">
											<li class="nav-item">
												<a class="nav-link active" id="base-tab1" data-toggle="tab" aria-controls="tab1" href="#tab1" aria-expanded="true">Customer Master</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" id="base-tab2" data-toggle="tab" aria-controls="tab2" href="#tab2" aria-expanded="false">Service Master</a>
											</li>
										</ul>
						
						
							<div class="card-body collapse in">
								<div class="card-block">
								<form class="form" id="formSave" action="customerInsert" method="GET">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="insertDiv">
											<input type="hidden" name="parent_id" value="">
											<input type="hidden" name="uId" value="">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Username</label> 
																<input type="text"  class="form-control border-primary"
																	placeholder="UserName" name="username" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Full Name</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="Full Name" name="fName" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Company Name</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="Company Name" name="cName" required>
															</div>
														</div>
													</div>
													
													<div class="row">	
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Password</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="Password" name="password" required>
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Machine Serial No.</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="Machine Serial No." name="machineSerialNo" required>
															</div>
														</div>
															<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Contact No.1</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Contact No.1" name="cNoOne" required>
															</div>
														</div>
														
													</div>
													
												
													
													<div class="row">	
													<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Contact No.2</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Contact No.2" name="cNoTwo">
															</div>
														</div>
													
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Email-Id.1</label> <input type="email"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Email-Id.1" name="emailOne" required>
															</div>
														</div>
															<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Email-Id.2</label> <input type="email"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Email-Id.2" name="emailTwo">
															</div>
														</div>	
													</div>
													
													<div class="row">
												
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Address</label> 
																<textarea rows="" cols="" name="address" class="form-control border-primary" placeholder="Max 500 words"></textarea>
															</div>
														</div>
																<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4">
															<div class="form-group">
																<label for="userinput1">Customer Type</label> <select
																	class="select2 form-control border-primary"
																	name="custType" id="custId" required
																	onchange="setValue(this.value);checkStoneName(this.value);">
																	<option value="" selected="selected">---SELECT
																		CUSTOMER TYPE---</option>
																	<%
																		for (CustomerTypeBean c : listOfCustomerType) {
																			if (cid == c.getCustomer_type_id()) {
																	%>
																	<option value="<%=c.getCustomer_type_id()%>"
																		selected="selected"><%=c.getCustomer_type_name()%> 
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=c.getCustomer_type_id()%>"><%=c.getCustomer_type_name()%>
																
																	</option>
																	<%
																		}
																	%>
																	<%
																		}
																	%>
																</select>

															</div>
														</div>
														
										<%-- 							<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4">
															<div class="form-group">
																<label for="userinput1">Customer Type</label> <select
																	class="select2 form-control border-primary"
																	name="sectorId" id="sectorId" required
																	onchange="setValue(this.value);">
																	<option value="" selected="selected">---SELECT
																		SEGMENT TYPE---</option>
																	<%
																		for (SectorBean s : listOfSegment) {
																			if (sid == s.getSector_id()) {
																	%>
																	<option value="<%=s.getSector_id()%>"
																		selected="selected"><%=s.getSector_name()%> 
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=s.getSector_id()%>"><%=s.getSector_name()%>
																
																	</option>
																	<%
																		}
																	%>
																	<%
																		}
																	%>
																</select>

															</div>
														</div> --%>
														
														<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4">
															<div class="form-group">
																<label for="userinput1">Product</label> <select
																	class="select2 form-control border-primary"
																	name="prodId" id="prodId" required
																	onchange="setValue(this.value);">
																	<option value="" selected="selected">---SELECT
																		PRODUCT ---</option>
																	<%
																		for (ProductBean p : listOfProduct) {
																			if (pid == p.getProduct_id()) {
																	%>
																	<option value="<%=p.getProduct_id()%>"
																		selected="selected"><%=p.getSectorBean().getSector_name()%>_<%=p.getProduct_name()%> 
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=p.getProduct_id()%>"><%=p.getSectorBean().getSector_name()%>_<%=p.getProduct_name()%>
																
																	</option>
																	<%
																		}
																	%>
																	<%
																		}
																	%>
																</select>

															</div>
														</div>
														
													</div>
													
													<div class="row">
													
													<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Product Information</label> 
																<textarea rows="" cols="" name="custProdInfo" class="form-control border-primary" placeholder="Max 5000 words"></textarea>
															</div>
														</div>
													
													</div>
													
										
													</div>
													
													<div class="form-actions right">
													<button type="submit" class="btn btn-primary" id="saveBtn" >
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary" id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#updateDiv').hide();$('#insertDiv').hide();$('#tableDiv').show();">
														<i class="icon-cross2"></i> Go To List
													</button>
												</div>
													
												</div>
												</form>
							
				
							
										
				
							<div class="tab-content px-1 pt-1">
							<div role="tabpanel" class="tab-pane active" id="tab1" aria-expanded="true" aria-labelledby="base-tab1">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Username</th>
						                                    <th style="padding: 5px;">Fullname</th>
						                                    <th style="padding: 5px;">Company</th>
						                                    <th style="padding: 5px;">Machine Serial No.</th>
						                                    <th style="padding: 5px;">Customer Type</th>
						                                     <th style="padding: 5px;">Segment</th>
						                                    <th style="padding: 5px;">Product</th>
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(CustomerBean c : listOfCustomer){
					                            		int cust_id = c.getCustomer_id();
					                            		
					                            	%>
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count%></td>
						                            		<td style="padding: 5px;white-space: nowrap;"><%=c.getUsername()%></td>
						                            		<td style="padding: 5px;"><%=c.getFullname()%></td>
						                            		<td style="padding: 5px;"><%=c.getCompany_name( )%></td>
						                            		<td style="padding: 5px;"><%=c.getMachine_serial_no()%></td>
						                            		<td style="padding: 5px;"><%=c.getCustomerTypeBean().getCustomer_type_name()%></td>
						                            		<td style="padding: 5px;"><%=c.getProductBean().getSectorBean().getSector_name()%></td>
						                            		<td style="padding: 5px;"><%=c.getProductBean().getProduct_name()%></td>
						                            		<td style="padding: 5px;">
						                            			<i class="icon-plus" title="Add New Machine" style="cursor: pointer;"  data-toggle="modal" data-target="#inlineForm" onclick="setValue12(<%=c.getCustomer_id()%>)" ></i>
						                            			<a href="redirect?p=YWxsUHJvZHVjdA==&custId=<%=c.getCustomer_id()%>"><i class="icon-eye" title="View All Machines"  href="" style="cursor: pointer;"  onclick="setValue123(<%=c.getCustomer_id()%>)" ></i></a>
						                            			<a href="redirect?p=YWxsUHJvZHVjdA==&custId=<%=c.getCustomer_id()%>"><i class="icon-upload" title="Upload Documents" onclick="setValue12(<%=c.getCustomer_id()%>);" style="cursor: pointer;color: green"></i></a>
						                            			<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteCustomer(<%=c.getCustomer_id()%>)"></i>
						                            			
						                            		</td>
						                            	</tr>
						                            <%} %>	
						                            </tbody>
					                        </table>
					                       </div> 
										</div> 
									
								</div>
								
								
								
											<div role="tabpanel" class="tab-pane" id="tab2" aria-expanded="true" aria-labelledby="base-tab1">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Username</th>
						                                    <th style="padding: 5px;">Fullname</th>
						                                    <th style="padding: 5px;">Customer Type</th>
						                                    <th style="padding: 5px;">Mob No.</th>
						                                         <th style="padding: 5px;">Email Id</th>
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count1 = 0;
					                            	/* for Extract Data */ 
					                            	for(CustomerBean c : listOfServiceEng){
					                            		int cust_id = c.getCustomer_id();
					                            		
					                            	%>
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count1%></td>
						                            		<td style="padding: 5px;white-space: nowrap;"><%=c.getUsername()%></td>
						                            		<td style="padding: 5px;"><%=c.getFullname()%></td>
						                            		<td style="padding: 5px;"><%=c.getCustomerTypeBean().getCustomer_type_name()%></td>
						                            			<td style="padding: 5px;"><%=c.getContact_one()%></td>
						                            				<td style="padding: 5px;"><%=c.getEmail_one()%></td>
						                            	
						                            		<td style="padding: 5px;">
						                            		<a href="redirect?p=YWRkU2VydmljZUVuZw==&uuId=<%=c.getCustomer_id()%>">
						                            		<i class="icon-pencil2" title="Edit" style="cursor: pointer;" ></i></a>
						                            			<%-- <i class="icon-pencil2" title="Edit" style="cursor: pointer;"  data-toggle="modal" data-target="#updateForm" onclick="updateSet(<%=c.getCustomer_id()%>)" ></i> --%>
						                            			<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteCustomer(<%=c.getCustomer_id()%>)"></i>
						                            			
						                            		</td>
						                            	</tr>
						                            <%} %>	
						                            </tbody>
					                        </table>
					                       </div> 
										</div> 
									
								</div>
								
							</div>
							
							
							
							
							
							</div></div>
							
							
							
							
							
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	

	
 		<!-- Modal -->
									<div class="modal fade text-xs-left" id="inlineForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
										<div class="modal-dialog" role="document">
										
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													  <span aria-hidden="true">&times;</span>
													</button>
													<label class="modal-title text-text-bold-600" id="myModalLabel33">Add New Machine of client</label>
												</div>
												<form 	class="form" id="formSave" action="addnewMachine" method="post">
											  <input type="hidden" value="" id="customerIdd" name="customerIdd">	 
											  	  <div class="modal-body">
													<label>Machine Serial No.  </label>
													<div class="form-group">
														<input type="text" placeholder="Machine Serial No." name="machineSerialNo" class="form-control">
													</div>

															<div class="form-group">
																<label for="userinput2">Product Information</label> 
																<textarea rows="" cols="" name="custProdInfo" class="form-control border-primary" placeholder="Max 5000 words"></textarea>
															</div>
															
																<label for="userinput1">Product</label> 
																<div class="form-group"><select
																	class="select2 form-group border-primary"
																	name="prodId" id="prodId" required
																	onchange="setValue(this.value);"  style="width: 40em;">
																	<option value="" selected="selected">---SELECT
																		PRODUCT ---</option>
																	<%
																		for (ProductBean p : listOfProduct) {
																			if (pid == p.getProduct_id()) {
																	%>
																	<option value="<%=p.getProduct_id()%>"
																		selected="selected"><%=p.getProduct_name()%> 
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%>
																
																	</option>
																	<%
																		}
																	%>
																	<%
																		}
																	%>
																</select>

															</div>
														</div>
												  
												  <div class="modal-footer">
													<input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" value="close">
													<input type="submit" class="btn btn-outline-primary btn-lg" value="Save">
												  </div>
												</form>
											</div>
										</div>
									</div> 
	

			<!-- Modal -->
									<div class="modal fade text-xs-left" id="inlineForm1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
										<div class="modal-dialog" role="document">
									
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													  <span aria-hidden="true">&times;</span>
													</button>
													<label class="modal-title text-text-bold-600" id="myModalLabel33">Add Service Engineer</label>
												</div>
											<form action="javascript:;" id="formSavee">
											
											
										<input type="hidden" id ="fullname11" name="fullname11" value="">
										<input type="hidden" id ="username11" name="username11" value="">
										<input type="hidden" id ="password11" name="password11" value="">
										<input type="hidden" id ="empCodee" name="empCodee" value="">
										<input type="hidden" id ="emaillIdd" name="emaillIdd" value="">
										<input type="hidden" id ="mobNoo" name="mobNoo" value="">
										
										
										
										  	<input type="hidden" id="SIDSS" name="SIDSS" value="">
											  	  <div class="modal-body">
													<label>Fullname</label>
													<div class="form-group">
														<input type="text" name="fullname1" id="fullname1" placeholder="Enter Fullname" class="form-control">
													</div>

													<label>Username</label>
													<div class="form-group">
														<input type="text" name="username1" id="username1" placeholder="Enter Username" class="form-control">
													</div>
												  <label>Password</label>
													<div class="form-group">
														<input type="password" name="password1" id="password1" placeholder="Enter Password" class="form-control">
													</div>
													<label>Employee code</label>
													<div class="form-group">
														<input type="text" name="empCode" id="empCode" placeholder="Enter Employee code" class="form-control">
													</div>
																<label>Mob No. </label>
													<div class="form-group">
														<input type="text" name="mobno" id="mobno" placeholder="Enter Mob No." class="form-control">
													</div>
													<label>Emailid</label>
													<div class="form-group">
														<input type="text" name="emailId" id="emailId" placeholder="Enter Emailid" class="form-control">
													</div>
													
													
													<label>Products</label>
																			<div class="form-group">
																			
																
																
																		<select
																	class="selectize-multiple"
																	placeholder="----Select Product----" name="prodIdd"
																	id="prodIdd" multiple="multiple" onchange="setCount();" required>
																	<%	for (ProductBean p : listOfProduct) { %>
																		<option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%></option>
																	<%} %>
																</select>

															</div>
												  
												  </div>
												
												  <div class="modal-footer">
													
															<button type="button" class="btn btn-primary btn-lg" id="saveBtn"
														onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
													<input type="reset" class="btn btn-secondary btn-lg" data-dismiss="modal" value="close">
												  </div>
												</form>
												  <div class="modal-footer">
													
												  </div>
											</div>
										</div>
									</div>

 	<div class="modal fade text-xs-left" id="updateForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
										<div class="modal-dialog" role="document">
									
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													  <span aria-hidden="true">&times;</span>
													</button>
													<label class="modal-title text-text-bold-600" id="myModalLabel33">Add Service Engineer</label>
												</div>
											<form class="form" id="formUpdate" action="updateServiceEng" method="post">
											<input type="text" name="uuId"  id="uuId" value="<%=uuId%>">
											<input type="hidden" id="cId" name="cId" value="">
											<div class="modal-body">
													<label>Fullname</label>
													<div class="form-group">
														<input type="text" name="fName" id="fName" placeholder="Enter Fullname" class="form-control">
													</div>

													<label>Username</label>
													<div class="form-group">
														<input type="text" name="uName" id="uName" placeholder="Enter Username" class="form-control">
													</div>
												
													<label>Employee code</label>
													<div class="form-group">
														<input type="text" name="cCode" id="cCode" placeholder="Enter Employee code" class="form-control">
													</div>
													
													<label>Password</label>
													<div class="form-group">
														<input type="text" name="sPassword" id="sPassword" placeholder="Enter Password" class="form-control" readonly="readonly">
													</div>
													
										
													<input type="hidden" id="PIDS" name="PIDS" value="">
													<label>Products</label>
																			<div class="form-group">
																			
																<select class="selectize-multiple"  placeholder="----Select process----" name="updateProdIdd" id="updateProdIdd" multiple="multiple" required>
																	<%
															
																	boolean test = false;
																	
																	List<ProductBean> listOfProduct1 = allListDAO.listOfProduct();
																	for(ProductBean p : listOfProduct1){
																	int pIdddd = p.getProduct_id();	
																		
																		boolean flag = false;
																		
																		if(namesArray != null){
																		for(String s : namesArray){
																		
																			if(s.equals(pIdddd)){
																				flag = true;
																			}
																		}
																	}
																		
																	%>
																		<input type="text" id="" name="" value="<%=flag%>">
																	
																		<%if(flag == true){%>
																			<option value="<%=pIdddd%>" selected="selected"><%=p.getProduct_name()%></option>
																		<%}else{ %>
																			<option value="<%=pIdddd%>"><%=p.getProduct_name()%></option>
																		<%} %>
																		
																	<%} %>
																</select>		
															<%-- 	
																		<select
																	class="selectize-multiple"
																	placeholder="----Select Product----" name="updateProdIdd"
																	id="updateProdIdd" multiple="multiple" onchange="setCount();" required >
																	<option value="">---SELECT PRODUCT ---</option>
																	<%
																		for (ProductBean p : listOfProduct) {
																			if (p != null) {
																	%>
																	<option value="<%=p.getProduct_id()%>"
																		selected="selected"><%=p.getProduct_name()%> 
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%>
																
																	</option>
																	<%
																		}
																	%>
																	<%
																		}
																	%>
																</select> --%>
															</div>
												  
												  </div>
												
												  <div class="modal-footer">
													
															<button type="button" class="btn btn-primary btn-lg" id="updateBtn" onclick="updateForm();">
														<i class="icon-check2"></i> Save
													</button>
													<input type="reset" class="btn btn-secondary btn-lg" data-dismiss="modal" value="close">
												  </div>
												</form>
												  <div class="modal-footer">
													
												  </div>
											</div>
										</div>
									</div> 
	    <!-- BEGIN VENDOR JS-->
    <!-- build:js app-assets/js/vendors.min.js-->
    <script src="app-assets/js/core/libraries/jquery.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/ui/tether.min.js" type="text/javascript"></script>
    <script src="app-assets/js/core/libraries/bootstrap.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/ui/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/ui/unison.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/ui/blockUI.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/ui/jquery.matchHeight-min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/ui/jquery-sliding-menu.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/sliders/slick/slick.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/ui/screenfull.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/extensions/pace.min.js" type="text/javascript"></script>
	
	
	<!-- BEGIN PAGE VENDOR JS-->
    <script type="text/javascript" src="app-assets/vendors/js/ui/jquery.sticky.js"></script>
		
	<script src="app-assets/js/core/app-menu.min.js" type="text/javascript"></script>
	<script src="app-assets/js/core/app.min.js" type="text/javascript"></script>
	<script src="app-assets/js/scripts/ui/fullscreenSearch.min.js" type="text/javascript"></script>
	
	
	
	<script src="app-assets/js/scripts/extensions/sweet-alerts.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/extensions/sweetalert.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/js/scripts/gallery/photo-swipe/photoswipe-script.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/vendors/js/gallery/photo-swipe/photoswipe.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/vendors/js/gallery/photo-swipe/photoswipe-ui-default.min.js"
		type="text/javascript"></script>
	<!-- BEGIN PAGE VENDOR JS-->
	<script
		src="app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/vendors/js/tables/datatable/dataTables.buttons.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/js/scripts/tables/datatables/datatable-basic.min.js"
		type="text/javascript"></script>
		 <script src="app-assets/vendors/js/tables/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/datatable/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/buttons.flash.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/jszip.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/pdfmake.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/vfs_fonts.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/buttons.html5.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/buttons.print.min.js" type="text/javascript"></script>
    <script src="app-assets/js/scripts/forms/validation/form-validation.min.js" type="text/javascript"></script>
    

    <!-- BEGIN PAGE VENDOR JS-->
    <script src="app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/validation/jqBootstrapValidation.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/icheck/icheck.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/toggle/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/toggle/switchery.min.js" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS-->

    <!-- /build-->
    <!-- END ROBUST JS-->
    <!-- BEGIN PAGE LEVEL JS-->
  	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','../../../../../../www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-96096445-1', 'auto');
	  ga('send', 'pageview');

	</script>
    
		<script src="app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
		<script src="app-assets/js/scripts/forms/select/form-select2.min.js" type="text/javascript"></script>	
		
		
     <script src="app-assets/vendors/js/forms/select/selectize.min.js" type="text/javascript"></script>
      <script src="app-assets/js/scripts/forms/select/form-selectize.min.js" type="text/javascript"></script>
		
	<script type="text/javascript">
	
	$("#updateDiv").hide();
	$("#insertDiv").hide();
	$("#saveLoader").hide();
	$("#updateLoader").hide();
	
	$(document).ready(function(){
		
		//For Datatable initilization
		$(".file-export").DataTable({
			// for table structure
	         dom: "Bfrtip",
	         
	         //for disable ordering
	         "ordering": false,
			
	         //For page length in data tables
	         "pageLength": 10,
	         
	     	// for button show in data tables
	        buttons: [
            {
                extend: 'excel',
                filename: 'Product Master'
            }
        ]
	        
	    }),
	    
	  	//For Design of that button
	    $(".buttons-excel").addClass("btn btn-primary mr-1")
				
	});
	
	
	
	function deleteCustomer(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			location.href = "deactiveCustomer?cId="+value;
		}
		
	}
	
	
	function submitForm(){
		$("#saveBtn").hide();
		$("#saveLoader").show();
		$("#formSave").submit();
	}
/* 	
	function updateForm(){
		$("#updateBtn").hide();
		$("#updateLoader").show();
		$("#formUpdate").submit();
	} */
	
	function setValue12(id){
		
		var custId = id;
		$('#customerIdd').val(custId);
		
	}
	
	
	function setValue123(value){
		
		$('#customerIddd').val(value);
		
	}
    
	   function setCount(){
		   var stoneId = $("#prodIdd").val();
			$("#SIDSS").val(stoneId);
			
			var stone = $("#SIDS").val();
			var temp = new Array();
			temp = stone.split(",");
			
			$(".count").html(temp.length);
			 sizeNew = $("#size1").val()- temp.length;
		
			   $(".count1").html(sizeNew);   
			   
				
	    }
	   
	/*    
	    function setStone(){
	    	var username = $("#username1").val();
			var password = $("#password1").val();
			var fullname = $("#fullname1").val();
			var empCode = $("#empCode").val();
	    	
	    	
	    	window.location.href = "redirect?p=Y2hhbGxhbkNyZWF0b3I=&username="+username+"&password="+password+"&fullname="+fullname+"&empCode="+empCode;
	    	$('#inlineForm1').modal();
	    }
	     */
	    function submitForm() {

				var stoneId = $("#prodIdd").val();

				$("#SIDSS").val(stoneId);
				var username = $("#username1").val();
				$("#username11").val(username);
				var password = $("#password1").val();
				$("#password11").val(password);
				var fullname = $("#fullname1").val();
				$("#fullname11").val(fullname);
				var empCode = $("#empCode").val();
				$("#empCodee").val(empCode);
				
				var mobNo = $("#mobno").val();
				$("#mobNoo").val(mobNo);
				var emailIdd = $("#emailId").val();
				$("#emaillIdd").val(emailIdd);
				
			
		    	if(username == null){
		    		alert("Username can not be null...!");
		    	}else if(password == null){
		    		alert("Password can not be null...!");
		    	}
		    	else if(fullname == null){
		    		alert("Fullname can not be null...!");
		    	}
		    	else if(empCode == null){
		    		alert("Employee Code can not be null...!");
		    	}
		   
		    	
		    	else{
		    		
		   
						
						$.ajax({
							//for specify Method
							method : "POST",
							//for call action
							url : "serviceEngInsert",
							//form send data
							data : $("#formSavee").serialize(),
							// action perform when successfully call action with specific method type
							success : function(data) {
							
				
								if(data == "error"){
									alert("There is some error please refresh the page & try again !!!");
									$("#saveBtn").show();
									$("#saveLoader").hide();
								}else{
									location.href = "redirect?p=YWRkQ3VzdG9tZXI=";
								}
								
							}
						});
						
						
		    		}
		    		
		    		
		    	}
				
	     function updateSet(value){
	    	 $('#uuId').val(value);
	    	 editData(value);
	     }
	     
	 	function editData(value){
			
			//Ajax for get data using Specification Field  id
			$.ajax({
				//for specify Method
			    method: "POST",
			    //for call action
			    url: 'detailsOfServiceEng',
			    //form send data
			    data:{cId : value},
			    // action perform when successfully call action with specific method type
			    success: function (data) {
			    	//parse data into json format
			    	 var json = JSON.parse(data);
			    	
			    	$("#cId").val(json.customer_id);
					$("#fName").val(json.fullname);
					$("#uName").val(json.username);
					$("#cCode").val(json.empCode);
					$("#sPassword").val(json.password);
					$("#updateProdIdd").val(json.products);
					
					$("#insertDiv").hide();
					$("#tableDiv").hide();
					$("#updateDiv").show();
			    	
			    }
			});
			
		} 
	 	
/* 	 	
		   $(document).ready(function() {
				//alert("hello");
		     	  $('#divx').hide();
		   });
		   function EditdetailModal(id) {
			   w
			   $("#EditdetailModal").modal();
			   $("#editMachineid").val(id);
		   }
		    */
		   
		function updateForm(){
			$("#PIDS").val($("#updateProdIdd").val());
			
			$("#updateBtn").hide();
			$("#updateLoader").show();
			$("#formUpdate").submit();
		}
	</script>
		<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','../../../../../../www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-96096445-1', 'auto');
	  ga('send', 'pageview');

	</script>
</body>
</html>