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
<title>Service Engineer Dashboard</title>
<%@include file="header.jsp"%>
</head>
<body>
	<%
	String customerSession = new EncodeDecode().encodeString("customerSession");
	CustomerBean customerBean = (CustomerBean) session.getAttribute(customerSession);
	
	int cust_id = customerBean.getCustomer_id();
	String productsss =  customerBean.getProducts();


/* AllListDAO allListDAO = new AllListDAO();
List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
List<CustomerProductBean> listOfProduct =  allListDAO.listOfCustomerProduct(userBean.getUser_id());
List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomer(); */

AllListDAO allListDAO = new AllListDAO();
List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomer(); 
List<SectorBean> listofSector = allListDAO.listOfSector();
CustomerBean customerBean2 = allListDAO.customerDetails(cust_id);
String products = customerBean2.getProducts();

List<Integer> listOfgroupbtSector =  allListDAO.listOfgroupbySectorService(products);

int prodId = 0;




String sector_name = null;
String product_name = null;
int sector_id = 0;
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">
			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0">Machine Lists</h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index-2.html">Home</a>
								</li>

								<li class="breadcrumb-item active">Machine List</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
		
					<button type="button" class="btn-icon btn btn-secondary btn-round">
						<i class="icon-cog3"></i>
					</button>
				</div>

			</div>

	<ul class="nav nav-tabs">	
	<%
							for (SectorBean s : listofSector) {
																		
							%>
										
											<li class="nav-item">
												<%-- <button type="button" onclick="chiragNew(<%=s.getSector_id()%>);"><%=s.getSector_name() %></button> --%>
											</li>
							<%} %>				
										</ul>

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

      
        <div class="card">
            <div class="card-body">
                <div class="row">
                		<%
                		String[] arr = products.split(",");
            			String output = null;
            			

            				
            				 StringBuffer sb = new StringBuffer();
            			      for(String s : arr) {
            			         
            			      
            			     prodId = Integer.parseInt(s);
            			 	List<ProductBean> listOfProduct =  allListDAO.listOfProductusingpId(prodId);
            			     for (ProductBean p : listOfProduct) {
						
            			    	 sector_name = p.getSectorBean().getSector_name();
    							 product_name = p.getProduct_name();
    							 sector_id = p.getSectorBean().getSector_id();
            			    	 
            		/* 	    List<ProductBean> listOfSector =  allListDAO.listOfProductusingpIdgroupbySectroId(prodId ,sector_id);	 

            			    for (ProductBean st : listOfSector) { */
							 
							  File directory=new File("D:\\datastorae\\SLDoc\\application\\"+sector_name+"\\"+product_name+"");
							    int fileCount=directory.list().length;
					        
		        		
				        			%>
							
				
						
                    <div class="col-lg-4 col-md-12 col-sm-12 border-right-blue-grey border-right-lighten-5">
                        <div class="p-1 text-xs-center">
                        	<div class="media-left media-middle">
										<i class="icon-box font-large-1 blue-grey"></i>
									</div>
                           <div class="media-body text-xs-right">
										<span class="font-large-1 text-bold-200 blue"><%=p.getProduct_name()%></span>
							<%-- 		<%
									for(AttachmentBean a : listOfAttachments){
										 %>	
						        			<span class="font-large-1 text-bold-200 info"><%=a.getMachine_serial_no()%></span>
						        		
									<%} %>	 --%>
									
									</div>
									
                            <div class="card-body overflow-hidden">
                                <div id="morris-comments" class="height-50" style="position: relative;"><svg height="75" version="1.1" width="322" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; left: -0.666664px; top: -0.899994px;"><desc>Created with Raphaël 2.1.2</desc><defs></defs><path style="fill-opacity: 0.1;" fill="#5cc7ac" stroke="none" fill-opacity="0.1"></path><circle cx="25" cy="31.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="44.4171952102698" cy="25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="63.834390420539606" cy="30" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="83.25158563080942" cy="36.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="102.72197863617585" cy="32.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="122.13917384644564" cy="38.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="141.5560427276483" cy="33.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="160.9732379379181" cy="37.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="180.44363094328455" cy="36.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="199.86082615355434" cy="42.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="219.27802136382414" cy="46.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="238.69521657409396" cy="38.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="258.16560957946035" cy="45" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="277.5828047897302" cy="35" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="297" cy="32.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle></svg><div class="morris-hover morris-default-style" style="display: none;"></div></div>
                                <ul class="list-inline clearfix mb-0">
                                   
                                   	<a href="redirect?p=c2VydmljZU1hY2hpbmU=&sector_name=<%=p.getSectorBean().getSector_name()%>&product_name=<%=p.getProduct_name()%>">
                                    <li class="border-right-lighten-2 pr-2">
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
                                     <%=fileCount%>   
                                        </h2>
                                        <span class="btn btn-outline-blue"><i class="icon-folder"></i> Applications</span>
                                    </li>
                                    </a>
                                   
                                </ul>
                                		<%
		String[] arr1 = products.split(",");
		 for(String s1 : arr1) {
			 
			  prodId = Integer.parseInt(s1);	 
			 
		List<ProductBean> getSector = allListDAO.listOfProductusingpIdgroupbySectroId(prodId, sector_id);		
		
		for(ProductBean pp : getSector){
      %>
      
        <span class="btn btn-outline-blue"><i class="icon-folder"></i> <%=pp.getSectorBean().getSector_name() %></span>
      
      <% 
		 } }  
       %>
      
                                
                                
                            </div>
                        </div>
                    </div>
                    
                 <%--   <%} %> --%>
                  
              <%} %>
<%}%>
           
                </div>
            </div>
        </div>

			 
		</div>
	</div>
<!-- 		<script type="text/javascript">
		function chiragNew(value){
			alert(value);
			int id = value;
			alert(id);
		}
		
		
		</script> -->
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