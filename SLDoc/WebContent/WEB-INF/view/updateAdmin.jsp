<%@page import="com.controller.AESEncrypt"%>
<%@page import="javax.swing.text.Segment"%>
<%@page import="com.bean.SectorBean"%>
<%@page import="com.bean.CustomerProductBean"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="com.bean.CustomerTypeBean"%>
<%@page import="com.dao.AllListDAO"%>
<%@page import="com.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.*"%> 
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Master</title>
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
<body onload="editData();">
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
	 String username = null;
	 String fullname = null;
	 String empCode = null;
	 String wIdArra = null;
	 String password = null;
	 String pwd = null;
	 String emailId = null;
	 String mobNo = null;
	 
	 boolean test1 = false;
	if(request.getParameter("uuId") != null){
		uuId =Integer.parseInt(request.getParameter("uuId"));
		
		CustomerBean customerBean = allListDAO.customerDetails(uuId);
		
		 wIdArra = customerBean.getProducts();
		  username = customerBean.getUsername();
		  fullname = customerBean.getFullname();
		  empCode = customerBean.getEmpCode();
		  password = customerBean.getPassword();
		   pwd = AESEncrypt.decrypt(password);
		 cid = customerBean.getCustomer_id(); 
		 emailId = customerBean.getEmail_one();
		 mobNo = customerBean.getContact_one();
		 
		 
		
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
					<h2 class="content-header-title mb-0"><i class="icon-user-tie"></i> Admin Master</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">SLDoc Portal</a></li>
		                  <li class="breadcrumb-item active">Admin Master</li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
	
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>

			<br>
			
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
								<div class="col-md-12">
									<h4 class="card-title" id="striped-label-layout-icons">Update Admin Detail of <%=fullname%></h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
					
						
							<div class="card-body collapse in">
								<div class="card-block">
											<form class="form" id="formUpdate" action="updateAdmin" method="post">
											<input type="hidden" name="uuId"  id="uuId" value="<%=uuId%>">
											<input type="hidden" id="cId" name="cId" value="<%=cid%>">
											  	  <div class="modal-body">
													<label>Fullname</label>
													<div class="form-group">
														<input type="text" name="fName" id="fName" placeholder="Enter Fullname" value="<%=fullname%>"  class="form-control">
													</div>

													<label>Username</label>
													<div class="form-group">
														<input type="text" name="uName" id="uName" placeholder="Enter Username" value="<%=username%>" class="form-control">
													</div>
												
													<label>Employee code</label>
													<div class="form-group">
														<input type="text" name="cCode" id="cCode" placeholder="Enter Employee code" value="<%=empCode%>" class="form-control">
													</div>
													
														<label>Password</label>
													<div class="form-group">
														<input type="text" name="sPassword" id="sPassword" value="<%=pwd%>" placeholder="Enter Password" class="form-control" readonly="readonly">
													</div>
													
													
													<label>Mob No. </label>
													<div class="form-group">
														<input type="text" name="mobNo" id="mobNo"  value="<%=mobNo%>" placeholder="Enter Mob No." class="form-control">
													</div>
													<label>Emailid</label>
													<div class="form-group">
														<input type="text" name="emailId" id="emailId"  value="<%=emailId%>" placeholder="Enter Emailid" class="form-control">
													</div>
													
													
													<input type="hidden" id="SIDSS" name="SIDSS" value="">
													<label>Products</label>
																			<div class="form-group">
																			
																		<select
																	class="selectize-multiple"
																	placeholder="----Select Product----" name="secId"
																	id="secId" multiple="multiple" onchange="setCount();" required style="height: 500px;">
																	<%	for (SectorBean s : listOfSegment) { %>
																		<option value="<%=s.getRights()%>"><%=s.getSector_name()%></option>
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
								<!-- <form class="form" id="formSave" action="customerInsert" method="post"> -->
								<%-- 		<form action="javascript:;" id="formSavee">
											
											
										<input type="hidden" id ="fullname11" name="fullname11" value="">
										<input type="hidden" id ="username11" name="username11" value="">
										<input type="hidden" id ="password11" name="password11" value="">
										<input type="hidden" id ="empCodee" name="empCodee" value="">
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
													
															<button type="button" class="btn btn-primary" id="saveBtn"
														onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary" id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#updateDiv').hide();$('#insertDiv').hide();$('#tableDiv').show();">
														<i class="icon-cross2"></i> Go To List
													</button>
												  </div>
												</form> --%>
					
								
							</div>
							
							</div></div>
							
							
							
							
							
						</div>
					</div>
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
		   var stoneId = $("#secId").val();
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

				var stoneId = $("#secId").val();

				$("#SIDSS").val(stoneId);
				var username = $("#uName").val();
				$("#username11").val(username);
				var password = $("#sPassword").val();
				$("#password11").val(password);
				var fullname = $("#fName").val();
				$("#fullname11").val(fullname);
				var empCode = $("#cCode").val();
				$("#empCodee").val(empCode);
				
				
				var mobNo = $("#mobNo").val();
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