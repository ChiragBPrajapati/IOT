<%@page import="com.bean.ProductBean"%>
<%@page import="com.bean.SectorBean"%>
<%@page import="com.bean.CustomerTypeBean"%>
<%@page import="com.dao.AllListDAO"%>
<%@page import="com.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Admin</title>
<script src="plugins/jquery/jquery.min.js"></script>
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
		/* session.removeAttribute("customerBean1");
		session.invalidate(); */
		response.sendRedirect("redirect?p=bG9naW4=");
	}
	%>
<%@include file="header.jsp" %>
</head>
	<script type="text/javascript">
	 function submit() {

			var sectorName = $("#sName").val();

		alert(sectorName);
	    	if(sectorName == null){
	    		alert("SectorName can not be null...!");
	    	}
	    	}
	
	</script>

	
	
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
	int parent_id = 0;
	int value = 0;
	List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
	List<ProductBean> listOfProduct =  allListDAO.listOfProduct();
	List<CustomerBean> listOfCustomer =  allListDAO.listOfOnlyCustomer();
	List<CustomerBean> listOfAdmin =  allListDAO.listOfOnlyAdmin();
	List<SectorBean> listOfSector =  allListDAO.listOfSector();

	
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
					<h2 class="content-header-title mb-0"><i class="icon-office"></i>   Add Admin</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="redirect?p=YWRkQ3VzdG9tZXI=">SLDoc Portal</a></li>
		                  <li class="breadcrumb-item"><a href="#">Add Admin</a></li>
		                  <li class="breadcrumb-item active"></li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="javascript:$('#insertDiv').show();$('#tableDiv').hide();$('#updateDiv').hide();" data-toggle="tooltip"
						data-original-title="Add New Admin">
						<i class="icon-plus"></i>
					</button>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div> 
			</div>
		<br>
<%if(request.getAttribute("sectorError") !=null ) {%>
	<div class="body">
		<div class="alert alert-dismissable alert bg-grey"
			data-type="autoclose-timer">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<b>${sectorError}</b>
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
									<h4 class="card-title" id="striped-label-layout-icons">Add Admin</h4>
								</div>
							
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
												<form action="javascript:;" id="formSavee">
												
										<input type="hidden" id ="fullname11" name="fullname11" value="">
										<input type="hidden" id ="username11" name="username11" value="">
										<input type="hidden" id ="password11" name="password11" value="">
										<input type="hidden" id ="empCodee" name="empCodee" value="">
										<input type="hidden" id ="emaillIdd" name="emaillIdd" value="">
										<input type="hidden" id ="mobNoo" name="mobNoo" value="">
										<input type="hidden" id="SIDSS" name="SIDSS" value="">	
												
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="insertDiv">
										
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Username</label> 
																<input type="text"  class="form-control border-primary"
																	placeholder="UserName"  id="username" name="username" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Full Name</label> <input type="text"
																	id="fName" class="form-control border-primary"
																	placeholder="Full Name" name="fName" required>
															</div>
														</div>
													<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Password</label> <input type="text"
																	id="password" class="form-control border-primary"
																	placeholder="Password" name="password" required>
															</div>
													</div>
													</div>
													<div class="row">	
														
													
															<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Contact No.1</label> <input type="text"
																	id="cNoOne" class="form-control border-primary"
																	placeholder="Contact No.1" name="cNoOne" required>
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Email-Id.1</label> <input type="email"
																	id="emailOne" class="form-control border-primary"
																	placeholder="Email-Id.1" name="emailOne" required>
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Emp Code</label> 
																<input type="text" id="empCode" class="form-control border-primary"
																	placeholder="Employee Code" name="empCode" required>
															</div>
														
														</div>
														</div>
													<div class="row">		
		 						
														
														<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Product</label> 
																<select
																	class="selectize-multiple"
																	placeholder="----Select Product----" name="secId"
																	id="secId" multiple="multiple" onchange="setCount();" required style="height: 500px;">
																	<%	for (SectorBean s : listOfSector) { %>
																		<option value="<%=s.getRights()%>"><%=s.getSector_name()%></option>
																	<%} %>
																</select>

															</div>
														</div>
													</div>
													
												
													
											
													
														
									
													
													<div class="form-actions right">
													<button type="submit" class="btn btn-primary" id="saveBtn" onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
												<!-- 	<button type="button" class="btn btn-primary" id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button> -->
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#updateDiv').hide();$('#insertDiv').hide();$('#tableDiv').show();">
														<i class="icon-cross2"></i> Go To List
													</button>
												</div>
													
												</div>
												</form>
												</div>

												
										</div>
										
								

												
										</div>
										
							<div class="card-body collapse in">
								<div class="card-block">
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
					                            	for(CustomerBean c : listOfAdmin){
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
						                            		<a href="redirect?p=dXBkYXRlQWRtaW4=&uuId=<%=c.getCustomer_id()%>">
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
	
	   function setCount(){
		   
		   var stoneId = $("#secId").val();
			$("#SIDSS").val(stoneId);
			
			var stone = $("#SIDS").val();
			var temp = new Array();
			temp = stone.split(",");
			
			$(".count").html(temp.length);
			 sizeNew = $("#size1").val()- temp.length;
		
			   $(".count1").html(sizeNew);   
			   
				
	    }
	
	    function submitForm() {
			alert("called");
			var stoneId = $("#secId").val();

			$("#SIDSS").val(stoneId);
			var username = $("#username").val();
			$("#username11").val(username);
			
			var password = $("#password").val();
			$("#password11").val(password);
			
			var fullname = $("#fName").val();
			$("#fullname11").val(fullname);
		
			var mobNo = $("#cNoOne").val();
			$("#mobNoo").val(mobNo);
			
			var emailIdd = $("#emailOne").val();
			$("#emaillIdd").val(emailIdd);
			
			var empCodee = $("#empCode").val();
			$("#empCodee").val(empCodee);
	
	    	if(username == null){
	    		alert("Username can not be null...!");
	    	}else if(password == null){
	    		alert("Password can not be null...!");
	    	}
	    	else if(fullname == null){
	    		alert("Fullname can not be null...!");
	    	}
	    	else if(emailIdd == null){
	    		alert("Email id can not be null...!");
	    	}
	    	else if(mobNo == null){
	    		alert("Mobile No can not be null...!");
	    	}
	    	else if(empCodee == null){
	    		alert("Employee Code can not be null...!");
	    	}
	    	
	    	else{
	    		
	   alert("chirag");
					
					$.ajax({
						//for specify Method
						method : "POST",
						//for call action
						url : "adminInsert",
						//form send data
						data : $("#formSavee").serialize(),
						// action perform when successfully call action with specific method type
						success : function(data) {
						
			
							if(data == "error"){
								alert("There is some error please refresh the page & try again !!!");
								$("#saveBtn").show();
								$("#saveLoader").hide();
							}else{
								location.href = "redirect?p=YWRkQWRtaW4=";
							}
							
						}
					});
					
					
	    		}
	    		
	    		
	    	}

	function deleteCustomer(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			location.href = "deactiveCustomer?cId="+value;
		}
		
	}
	

	function updateForm(){
		$("#updateBtn").hide();
		$("#updateLoader").show();
		$("#formUpdate").submit();
	}
	

	</script>
	
</body>
</html>