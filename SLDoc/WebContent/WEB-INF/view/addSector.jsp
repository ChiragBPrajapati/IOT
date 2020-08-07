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
<title>Add Sector</title>
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
	List<SectorBean> listOfSector =  allListDAO.listOfSector();
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

	
				<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-office"></i>   Add Sector</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="redirect?p=YWRkQ3VzdG9tZXI=">SLDoc Portal</a></li>
		                  <li class="breadcrumb-item"><a href="#">Add Sector</a></li>
		                  <li class="breadcrumb-item active"></li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="javascript:$('#insertDiv').show();$('#tableDiv').hide();$('#updateDiv').hide();" data-toggle="tooltip"
						data-original-title="Add New Sector">
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
									<h4 class="card-title" id="striped-label-layout-icons">Add Sector</h4>
								</div>
							
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
											<form class="form" action="sectorInsert" method="GET">
											<input type="hidden" name="uId" value="">
											
											<input type="hidden" name="subRedirection" value="subClient">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
													
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Sector Name</label> 
																<input type="text" id="sName" class="form-control border-primary" placeholder="Add Sector Name" name="sName" required data-validation-required-message="This field is required">
															</div>
														</div>
														
													</div>
									
									
													<div class="form-actions right">
													<button type="submit" class="btn btn-primary">
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary" id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#insertDiv').hide();$('#tableDiv').show();">
														<i class="icon-cross2"></i> Go To List
													</button>
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
						                                    
						                                    <th style="padding: 5px;">Name</th>
						                                
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(SectorBean s : listOfSector){
					                            		int sector_id = s.getSector_id();
						                            %>
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count%></td>
						                            		<td style="padding: 5px;white-space: nowrap;"><%=s.getSector_name()%></td>
						                            	

						                            		<td style="padding: 5px;">
						                            			<i class="icon-trash" title="Delete Sector" style="color: red;cursor: pointer;" onclick="deleteSector(<%=s.getSector_id()%>)"></i>
						                            			
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
	
  		<!-- Multi Select Plugin Js -->
<script src="plugins/multi-select/js/jquery.multi-select.js"></script>

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
    <!-- /build-->
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <script type="text/javascript" src="app-assets/vendors/js/ui/jquery.sticky.js"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN ROBUST JS-->
    <!-- build:js app-assets/js/app.min.js-->
    <script src="app-assets/js/core/app-menu.min.js" type="text/javascript"></script>
    <script src="app-assets/js/core/app.min.js" type="text/javascript"></script>
    <script src="app-assets/js/scripts/ui/fullscreenSearch.min.js" type="text/javascript"></script>
    <!-- /build-->
    <!-- END ROBUST JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <!-- END PAGE LEVEL JS-->

    
		<script src="app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
		<script src="app-assets/js/scripts/forms/select/form-select2.min.js" type="text/javascript"></script>	

	<script type="text/javascript">
	$("#updateDiv").hide();
	$("#insertDiv").hide();
	$("#saveLoader").hide();
	$("#updateLoader").hide();
	
	function deleteSector(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			location.href = "deactiveSector?cId="+value;
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
	

	</script>
	
</body>
</html>