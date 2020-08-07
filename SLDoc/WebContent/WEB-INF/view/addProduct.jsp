<%@page import="com.bean.SectorBean"%>
<%@page import="com.bean.ProductBean"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Robust admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, robust admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>SLDoc Portal</title>
<link rel="apple-touch-icon" sizes="60x60"
	href="img/sltlICO.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="img/sltlICO.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="img/sltlICO.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="img/sltlICO.png">
	
	
<link rel="shortcut icon" type="image/x-icon"
	href="img/sltlICO.png">
<link rel="shortcut icon" type="image/png"
	href="img/sltlICO.png">
 <link rel="apple-touch-icon" sizes="76x76" href="app-assets/images/ico/apple-icon-76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="app-assets/images/ico/apple-icon-120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="app-assets/images/ico/apple-icon-152.png"> 
  <link rel="shortcut icon" type="image/x-icon" href="https://pixinvent.com/bootstrap-admin-template/robust/app-assets/images/ico/favicon.ico">
	    <link rel="shortcut icon" type="image/png" href="app-assets/images/ico/favicon-32.png"> 
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
 <title></title>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap.min.css">
<!-- font icons-->
<link rel="stylesheet" type="text/css" href="app-assets/fonts/icomoon.css">
<link rel="stylesheet" type="text/css" href="app-assets/fonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/sliders/slick/slick.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/extensions/pace.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/charts/jquery-jvectormap-2.0.3.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/charts/morris.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/extensions/unslider.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/weather-icons/climacons.min.css">
<!-- END VENDOR CSS-->
<!-- BEGIN ROBUST CSS-->
<link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/css/app.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/css/colors.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<!-- END ROBUST CSS-->

<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/pickers/daterange/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/pickers/datetime/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/pickers/pickadate/pickadate.css">

<link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/horizontal-menu.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/vertical-overlay-menu.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/css/plugins/pickers/daterange/daterange.min.css">
<link href="offlineDatePicker/12jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/scrollupdown.css">
    


    
 <!-- BEGIN VENDOR CSS-->
<meta name="apple-mobile-web-app-status-bar-style" content="default">
    <script src="app-assets/js/core/libraries/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="fusioncharts/js/fusioncharts.js"></script>
	<script type="text/javascript" src="fusioncharts/js/themes/fusioncharts.theme.fint.js"></script>
<link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css">



<link rel="stylesheet" type="text/css" href="app-assets/css/core/colors/palette-gradient.min.css">

<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/selects/select2.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/selectize/selectize.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/selects/selectize.default.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/selects/selectize.css">
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css">
   	   
   	      <!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/validation/form-validation.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/switch.min.css"> 
<!-- END Custom CSS-->
<title>Customer Master</title>
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
<body>
<%
	AllListDAO allListDAO = new AllListDAO();
	int parent_id = 0;
	
	List<ProductBean> listOfProduct =  allListDAO.listOfProduct();
	List<SectorBean> listOfSector =  allListDAO.listOfSector();
	
	int sid = 0;
	int pid = 0;
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-display"></i>   Product Master</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="redirect?p=YWRkQ3VzdG9tZXI=">SLDoc Portal</a></li>
		                  <li class="breadcrumb-item active">Product Master</li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="javascript:$('#insertDiv').show();$('#tableDiv').hide();$('#updateDiv').hide();" data-toggle="tooltip"
						data-original-title="Add New Product">
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
<%if(request.getAttribute("productError") !=null ) {%>
	<div class="body">
		<div class="alert alert-dismissable alert bg-grey"
			data-type="autoclose-timer">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<b>${productError}</b>
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
									<h4 class="card-title" id="striped-label-layout-icons">Product Master</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								<form class="form" id="formSave" action="productInsert" method="GET">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="insertDiv">
											<input type="hidden" name="parent_id" value="">
											<input type="hidden" name="uId" value="">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Product Name</label> 
																<input type="text"  class="form-control border-primary"
																	placeholder="Product Name" name="prod_name" required>
															</div>
														</div>
																		<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4">
															<div class="form-select2">
																<label for="userinput1">Sector Type</label> <select
																	class="select2 form-control border-primary"
																	name="sectorId" id="sectorId" required
																	onchange="setValue(this.value);checkStoneName(this.value);">
																	<option value="" selected="selected">---SELECT
																		SECTOR TYPE---</option>
																	<%
																		for (SectorBean s : listOfSector) {
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
										
				
										
										
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Product Name</th>
						                                    <th style="padding: 5px;">Sector Name</th>
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(ProductBean p : listOfProduct){
					                            		int prod_id = p.getProduct_id();
					                            		
					                            	%>
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count%></td>
						                            		<td style="padding: 5px;white-space: nowrap;"><%=p.getProduct_name()%></td>
						                            		<td style="padding: 5px;"><%=p.getSectorBean().getSector_name()%></td>
						                            		<td style="padding: 5px;">
						                            			<i class="icon-pencil2" title="Edit" onclick="editData(<%=p.getProduct_id()%>);" style="cursor: pointer;color: green"></i>
						                            			<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteProduct(<%=p.getProduct_id()%>)"></i>
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


function chirag(){
	
	
	var productName = $("#prod_name").val();

	    	if(productName == null){
	    	
	    		alert("ProductName can not be null...!");
	    		window.location.reload();
	    		window.location.replace("redirect?p=YWRkUHJvZHVjdA==");
	    	}
	    	
}
</script>	

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
	
	
	
	function deleteProduct(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			location.href = "deactiveProduct?cId="+value;
		}
		
	}
	
	

	
	
	function submitForm(){
		$("#saveBtn").hide();
		$("#saveLoader").show();
		$("#formSave").submit();
	}
	
	function updateForm(){
		$("#updateBtn").hide();
		$("#updateLoader").show();
		$("#formUpdate").submit();
	}
	
	
	function editData(value){
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'detailsOfCustomerMaster',
		    //form send data
		    data:{cId : value},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
		    	 
		    	$("#cId").val(json.customer_id);
				$("#cCode").val(json.customer_code);
				$("#cCodeTxt").html(json.customer_code);
				$("#fName").val(json.fullname);
				$("#cName").val(json.company);
				$("#gstNumber").val(json.gst_number);
				$("#cNoOne").val(json.contact_one);
				$("#cNoTwo").val(json.contact_two);
				$("#emailOne").val(json.email_one);
				$("#emailTwo").val(json.email_two);
				$("#address").val(json.address);
				$("#zipCode").val(json.zipcode);
				$("#city").val(json.city);
				$("#state").val(json.state);
				$("#country").val(json.country);
				$("#maxNum").val(json.customer_num);
				$("#vatNumber").val(json.vat_number);
				$("#vatRate").val(json.vat_rate);
				$("#inv_seq").val(json.invoice_seq);
				$("#challan_seq").val(json.challan_seq);
				$("#parent_id").val(json.parent_customer_id);
				
				
				$("#insertDiv").hide();
				$("#tableDiv").hide();
				$("#updateDiv").show();
		    	
		    }
		});
		
	}
	
	</script>
</body>
</html>