<%@page import="com.controller.AESEncrypt"%>
<%@page import="com.bean.SectorBean"%>
<%@page import="java.io.File"%>
<%@page import="com.bean.AttachmentBean"%>
<%@page import="com.bean.CustomerProductBean"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="com.bean.CustomerTypeBean"%>
<%@page import="com.dao.AllListDAO"%>
<%@page import="com.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Machine Dashboard</title>
<%@include file="header.jsp"%>
</head>
<body>
	<%
	String customerSession = new EncodeDecode().encodeString("customerSession");
	CustomerBean customerBean = (CustomerBean) session.getAttribute(customerSession);
	
	int cust_id = customerBean.getCustomer_id();


/* AllListDAO allListDAO = new AllListDAO();
List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
List<CustomerProductBean> listOfProduct =  allListDAO.listOfCustomerProduct(userBean.getUser_id());
List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomer(); */

AllListDAO allListDAO = new AllListDAO();
List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
List<CustomerProductBean> listOfProduct =  allListDAO.listOfCustomerProduct(cust_id);
List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomer(); 
List<Integer> listOfgroupbtSector =  allListDAO.listOfgroupbtSector(cust_id);
int pid = 0;
String sector_name = null;
String product_name = null;
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">
			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0">Customer Information</h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJNRGFzaGJvYXJk">Home</a>
								</li>

								<li class="breadcrumb-item active">Segment List</li>
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

<%-- 			<div class="app-content container center-layout mt-2">
				<div class="content-wrapper">
					<div class="content-header row"></div>
					<div class="content-body">
						<!-- Sales stats -->
						<div class="row">
							<%
							for (CustomerProductBean p : listOfProduct) {
																		
							%>
							<a href ="#">
							<div
								class="col-xl-3 col-lg-6 col-sm-12 border-right-blue-grey border-right-lighten-7"
								style="background-color: white;height: 200px;">
								<div class="media px-1">
									<div class="media-left media-middle">
										<i class="icon-box font-large-1 blue-grey"></i>
									</div>
									<div class="media-body text-xs-right">
										<span class="font-large-1 text-bold-200 info"><%=p.getProductBean().getProduct_name()%></span>
									</div>
									<p class="text-muted">
										Total Products <span class="info float-xs-right"><i
											class="icon-arrow-up4 info"></i> 16.89%</span>
									</p>
									<progress class="progress progress-sm progress-info" value="80"
										max="100"></progress>
								</div>
							</div>
							</a>
							<%}%>
				
							
						</div>
					</div>
				</div>
			</div> --%>
<br>
        <div class="card">
            <div class="card-body">
                <div class="row">
                	<!--    <div class="col-lg-12 col-md-12 col-sm-12 border-right-blue-grey border-right-lighten-5">
                        <div class="p-1 text-xs-center">
                        	<div class="media-left media-middle col-lg-4 col-md-4 col-sm-4">
										<i class="font-large-1 icon-users blue-grey"> Customer Information</i>
									</div>
									<br>
								</div>
                      
                        </div> -->
       <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12" >
	        <div class="card box-shadow-2">
	            <div class="card-body" style="height: 180px;">
	                <div class="card-block">
	            
	                    <div class="card-header mt-1 text-xs-center font-large-1" style="padding: 0;">  <i class="font-large-1 icon-users"> Customer Information</i>
						      <br>
						      <span class="darken-1"></span>
	                    </div>
	                    <div class="">
	                    	 <div class="card-header mt-1 font-small" style="padding: 0;align-content: left;"> Company Name : <%=customerBean.getCompany_name() %></i>
	                    	 <div class="card-header mt-1 font-small" style="padding: 0;align-content: left;"> Contact No  : <%=customerBean.getContact_one() %></i>
	                    	  <div class="card-header mt-1 font-small" style="padding: 0;align-content: left;"> Email Id  : <%=customerBean.getEmail_one() %></i>
	             
	                    </div>
	        
	                    
	                </div>
	            </div>
	        </div>
	    </div>
                         
                         
									
           
                </div>
            </div>

</div>
	</div>
<br>
        <div class="card">
            <div class="card-body">
                <div class="row">
                		<%
							for (Integer a : listOfgroupbtSector) {
								
								
							int sectorId = a;
							
							String temp = Integer.toString(sectorId);
							
							String encId = AESEncrypt.encrypt(temp);
							SectorBean sectorBean = allListDAO.getListOfSectorfromId(sectorId);
							
							sector_name = sectorBean.getSector_name();
							
							List<CustomerProductBean> listofmachine= allListDAO.getListOfCustomerProductfromSectorId(sectorId ,cust_id);
							
									
							 
							  File directory = new File("D:\\datastorae\\SLDoc\\application\\"+sector_name+"");
							    int fileCount=directory.list().length;
					        
							  File  file1 = new File("D:\\datastorae\\SLDoc\\application\\"+sector_name+"\\"+sector_name+".png"); 
		        		
				        			%>
							
				
							<a href="redirect?p=Y3VzdG9tZXJEYXNoYm9hcmQ=&sector_id=<%=encId%>">  
                    <div class="col-lg-4 col-md-12 col-sm-12 border-right-blue-grey border-right-lighten-5">
                        <div class="p-1 text-xs-center">
                        	<div class="media-left media-middle">
										    <%if(sector_name.equalsIgnoreCase("SPM")){
										    	String sector_name1 = "LCM";
										    	%>
										     <img alt="" src="img/<%=sector_name1%>.png" width="150px;" height="100px;">
										     <%} else{%>
										     <img alt="" src="img/<%=sector_name%>.png" width="150px;" height="100px;">
										     <%} %>
									</div>
                           <div class="media-body text-xs-right">
										<span class="font-large-1 text-bold-200 blue"><%=sector_name%> </span>
							<%-- 		<%
									for(AttachmentBean a : listOfAttachments){
										 %>	
						        			<span class="font-large-1 text-bold-200 info"><%=a.getMachine_serial_no()%></span>
						        		
									<%} %>	 --%>
									
									</div>
								
                            <div class="card-body overflow-hidden">
                              
                                <ul class="list-inline clearfix mb-0">
                                   	
                                 
                                    
                                   
                                    <li class="border-right-lighten-2 pr-2 media-left">
                                        <h2 class="info text-bold-400"><%-- <%
                                        		File folder = new File("/Users/you/folder/");
                                        File[] listOfFiles = folder.listFiles();

                                        for (File file : listOfFiles) {
                                            if (file.isFile()) {
                                                System.out.println(file.getName());
                                            }
                                        }
                                        
                                        
                                        %>
                                         --%>
                                     <%=listofmachine.size()%>   
                                        </h2>
                                        <span class="btn btn-outline-blue"><i class="icon-folder"></i> Machines</span>
                                    </li>
                                    </a>
                                  
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                  
                  
              <%}%>
           
                </div>
            </div>
        </div>

			 
		
	 <!-- BEGIN VENDOR JS-->
	<!-- build:js app-assets/js/vendors.min.js-->
	<script src="app-assets/js/core/libraries/jquery.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/tether.min.js"
		type="text/javascript"></script>
	<script src="app-assets/js/core/libraries/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/perfect-scrollbar.jquery.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/unison.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/blockUI.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/jquery.matchHeight-min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/jquery-sliding-menu.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/sliders/slick/slick.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/screenfull.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/extensions/pace.min.js"
		type="text/javascript"></script>
	<!-- /build-->
	<!-- BEGIN VENDOR JS-->
	<!-- BEGIN PAGE VENDOR JS-->
	<script type="text/javascript"
		src="app-assets/vendors/js/ui/jquery.sticky.js"></script>
	<script src="app-assets/js/core/app-menu.min.js" type="text/javascript"></script>
	<script src="app-assets/js/core/app.min.js" type="text/javascript"></script>
	<script src="app-assets/js/scripts/ui/fullscreenSearch.min.js"
		type="text/javascript"></script>
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
    <script type="text/javascript" src="app-assets/vendors/js/ui/jquery.sticky.js"></script>
    <script src="app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/validation/jqBootstrapValidation.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/icheck/icheck.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/toggle/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/toggle/switchery.min.js" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN ROBUST JS-->

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
</body>
</html>