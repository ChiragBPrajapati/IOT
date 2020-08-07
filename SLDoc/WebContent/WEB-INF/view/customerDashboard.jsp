<%@page import="com.controller.getYear"%>
<%@page import="com.controller.AESEncrypt"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.ArrayList"%>
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
<title>Customer Dashboard</title>
<%@include file="header.jsp"%>
</head>
<body>
	<%
	String customerSession = new EncodeDecode().encodeString("customerSession");
	CustomerBean customerBean = (CustomerBean) session.getAttribute(customerSession);
	
	int cust_id = customerBean.getCustomer_id();
	
	String decId = request.getParameter("sector_id").toString();

	
	String sector_id = AESEncrypt.decrypt(decId);
	int id = Integer.parseInt(sector_id);
	String prodIdd = null;
	int custId = 0;
/* AllListDAO allListDAO = new AllListDAO();
List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
List<CustomerProductBean> listOfProduct =  allListDAO.listOfCustomerProduct(userBean.getUser_id());
List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomer(); */

AllListDAO allListDAO = new AllListDAO();
List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
List<Integer> listOfProduct2 =  allListDAO.listOfCustomerProduct3(cust_id, id);
List<Integer> listOfgroupbtSector =  allListDAO.listOfgroupbtSector(cust_id);
List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomer(); 
int pid = 0;
int prodIdd1 = 0;
String product_name = null;
String sector_name = null;

prodIdd = request.getParameter("prodIdd");

 product_name = request.getParameter("prod_name");
 sector_name = request.getParameter("sec_name");



if(prodIdd  != null){
List<AttachmentBean> listOfAttachmentss =  null;

prodIdd1 = Integer.parseInt(prodIdd); 
}




//  String[] arrOfStr = listOfgroupbtSector.split(","); 

%>

<%

if(product_name  == null){
%>
<script type="text/javascript">
$("#chirag").hide();
</script>
<%} %>


<%
getYear g = new getYear();
%>





	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">
			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0">Machine Lists</h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJNRGFzaGJvYXJk">Home</a>
								</li>

								<li class="breadcrumb-item active">Machine List</li>
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
						<a href="redirect?p=Y3VzdG9tZXJNRGFzaGJvYXJk"><button type="button" class="btn-icon btn btn-secondary btn-round"
						 data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-home"></i>
					</button></a>
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
		
        <div class="card">
            <div class="card-body">
                <div class="row">

                		<%
                		for (Integer a : listOfProduct2) {  
                			
                			ProductBean productBean  =  allListDAO.getListOfProductfromId(a);
                			String product_name1 = productBean.getProduct_name();
                			String sector_name1 = productBean.getSectorBean().getSector_name();
							int prodId = productBean.getProduct_id();
							
							String temp = Integer.toString(prodId);
							
							String encId = AESEncrypt.encrypt(temp);
							
							
							/* List<AttachmentBean> listOfAttachments =  allListDAO.listOfAttachment(cust_id,prodId);

							 sector_name = p.getSectorBean().getSector_name();
							 product_name = p.getProductBean().getProduct_name(); */
							 
								
							 List<CustomerProductBean> listofproductofcust = allListDAO.listOfCustomerProduct2(cust_id, id, prodId);
								 
								
							  File directory=new File("D:\\datastorae\\SLDoc\\application\\");
							    int fileCount=directory.list().length;
					        
		        		
				        			%>
							
				
						
                    <div class="col-lg-4 col-md-12 col-sm-12 border-right-blue-grey border-right-lighten-5">
                        <div class="p-1 text-xs-center">
                        	<div class="media-left media-middle">
										<img src="img\<%=product_name1%>.png" height="120px;" width="140px;">
									</div>
                           <div class="media-body text-xs-right">
										<span class="font-large-1 text-bold-200 blue"><%=product_name1%></span>
										<br><span class="text-bold-200 blue"><h5>No Of machine  : <%=listofproductofcust.size()%></span>
										<br><span class="text-bold-200 blue"><h5>Segment : <%=productBean.getSectorBean().getSector_name()%></span>
										
							
							<%-- 		<%
									for(AttachmentBean a : listOfAttachments){
										 %>	
						        			<span class="font-large-1 text-bold-200 info"><%=a.getMachine_serial_no()%></span>
						        		
									<%} %>	 --%>
									
									</div>
									
                            <div class="card-body overflow-hidden">
                                <ul class="list-inline clearfix mb-0">
                          
                              		<%-- <a href="redirect?p=Y3VzdG9tZXJNYWNoaW5l&prodId=<%=encId%>"> --%>
                                    <li class="border-right-grey border-right-lighten-2 pr-2" onclick="showApplications('<%=product_name1%>' ,'<%=sector_name1%>' ,'<%=decId%>');">
                                        <h2 class="info text-bold-200" ></h2>
                                        <span  class="btn btn-outline-blue"><i class="icon-file"></i> Applications</span>
                                    </li>
                                    <!-- </a> -->
                          
                                    <li class="pl-2" onclick="showMachines(<%=prodId%> ,'<%=decId%>');">
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
                                        </h2>
                                        <span class="btn btn-outline-blue"><i class="icon-folder"></i> Documents</span>
                                    </li>
                                    
                               
                                   	
                                 
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                  
                  
              <%}%>


</div></div></div>
<br>

	<%if(product_name  != null){ %>		
         <div class="card"  id="chirag" class="hide">
            <div class="card-body">
                <div class="row">
                
            <div class="card-body collapse in">
                <div class="card-block">
                <h2 class="content-header-title mb-0" >Application List of <%=product_name %></h2>
                <br>
	                <!-- Task List table -->
	                 <!-- Task List table -->
	                <table id="project-task-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
				        <thead>
				            <tr>
				              	<th>No</th>
				                <th>Attachment</th>
				             	<th>Last Modified Date</th>
				             	<th>File Size (KB)</th>
				                <th>Actions</th>
				            </tr>
				        </thead>
				        <tbody>
				        <%
				        int count = 0;
				        
				        List<String> results = new ArrayList<String>();

				        File directory=new File("D:\\datastorae\\SLDoc\\application\\"+sector_name+"\\"+product_name+"");
					    int fileCount=directory.list().length;
				        File[] files = new File("directory").listFiles();
		
				        
				        
				        File folder = new File("D:\\datastorae\\SLDoc\\application\\"+sector_name+"\\"+product_name+"");
				        File[] listOfFiles = folder.listFiles();

				        for (int i = 0; i < listOfFiles.length; i++) {
				          if (listOfFiles[i].isFile()) {
				           // System.out.println("File " + listOfFiles[i].getName());
				      
							    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
  								  String strDate= formatter.format(listOfFiles[i].lastModified()); 
					        	
  								long fileSizeInBytes = listOfFiles[i].length();
  									// Convert the bytes to Kilobytes (1 KB = 1024 Bytes)
  									long fileSizeInKB = fileSizeInBytes / 1024;
  									// Convert the KB to MegaBytes (1 MB = 1024 KBytes)
  									long fileSizeInMB = fileSizeInKB / 1024;
							count++;
					        %>
				        
				        	<!-- ABC Project -->
				            <tr>
				          <td style="font-size: 30px;"><%=count %></td>
				            <td style="font-size: 23px;"><%=listOfFiles[i].getName()%></td>
				              <td><%=strDate%></td>
				               <td><%=fileSizeInKB%> KB</td>
				             <td class="i-xxxlarge"><a href="appDownload?product_name=<%=product_name%>&attachment=<%=listOfFiles[i].getName()%>&sector_name=<%=sector_name%>"><i class="icon-folder-download info"></i></a></td>
				                
				       
				            </tr>
		
		
				   <% } }%>
				 
				          
				        </tbody>
				
					</table>
					<!--/ Task List table -->
				</div>
            </div>
            </div>
            </div>
        </div>
<%} %>


<br>


<div id="docs" class="docs">
         <div  class="card" >
            <div class="card-body">
                <div class="row">
            <div class="card-body collapse in">
                <div class="card-block">
                  <h2 class="content-header-title mb-0">Document List</h2>
                <br>
                <%
                List<CustomerProductBean> listofmachine = allListDAO.listOfCustomerProductusingProdid(prodIdd1 ,cust_id);
               
                %>
                
                   <h2 class="content-header-title mb-0"></h2>
                   		<div class="form-group">
																<label for="userinput1">Machine</label> 
																<select class="select2 form-control border-primary" name="custId" id="custId" onchange="setStone(this.value);" required>
																	<option value="0" selected="selected">---All Machine---</option>
																	<%  for(CustomerProductBean c : listofmachine){
																	if(custId == c.getCust_prod_id()){
																	%>
																		<option value="<%=c.getCust_prod_id()%>" selected="selected"><%=c.getProductBean().getProduct_name()%>_<%=c.getMachine_serial_no()%></option>
																	<%}else{ %>
																		<option value="<%=c.getCust_prod_id()%>"><%=c.getProductBean().getProduct_name()%>_<%=c.getMachine_serial_no()%></option>
																	<%} %>	
																	<%} %>
																</select>
																
															</div>
                   
	                <!-- Task List table -->
	                <br>
	        		 <table class="table table-bordered" id="facilityBooking" style="font-size: 13px;">
	        		 
	        		 
	        		      <thead>
				            <tr>
				              	<th>No</th>
				                <th>Machine Name</th>
				                <th>Machine Serial no</th>
				                <th>Attachment</th>
				             	<th>Date</th>
				                <th>Actions</th>
				            </tr>
				        </thead>
							<tbody>
							
							</tbody>
						</table>
	         
	         <%--        <table id="project-task-list" class="table table-white-space table-bordered row-grouping display table-responsive no-wrap icheck table-middle">
				        <thead>
				            <tr>
				              	<th>No</th>
				                <th>Machine Name</th>
				                <th>Machine Serial no</th>
				                <th>Attachment</th>
				             	<th>Date</th>
				                <th>Actions</th>
				            </tr>
				        </thead>
				        <tbody>
				        <%
				        int countt = 0;
				        List<AttachmentBean> listOfAttachmentss =  allListDAO.listOfAttachments(cust_id , prodIdd);				       
				        for(AttachmentBean a : listOfAttachmentss){
				        
				        	SimpleDateFormat ddmmyyyyhhmmss1 = new SimpleDateFormat("dd/MM/yyyy");
				        	String date = a.getDate_of_submission();
				        	
				       
							countt++;
					        %>
				        
				        	<!-- ABC Project -->
				            <tr>
				            <td style="font-size: 30px;"><%=countt %></td>
				            <td style="font-size: 22px;"><%=a.getProductBean().getProduct_name() %></td>
				            <td style="font-size: 15px;"><%=a.getMachine_serial_no() %></td>
				            <td style="font-size: 15px;"><%=a.getAttachment_name()%></td>
				            <td style="font-size: 15px;"><%=date%></td>
				            
				             <td><a href="fileDownload?prodId=<%=a.getProductBean().getProduct_id()%>&attachment=<%=a.getAttachment_name()%>&user_id=<%=cust_id%>&mc_no=<%=a.getMachine_serial_no()%>"><i class="icon-folder-download info"></i></a></td>
				                
				       
				            </tr>
		
		
				   <%} %>
				 
				          
				        </tbody>
				
					</table> --%>
					<!--/ Task List table -->
				</div>
            </div>
            </div>
            </div>
        </div> 
        </div>
<%-- 
                		<%
							for (CustomerProductBean p : listOfProduct) {
							int prodId = p.getProductBean().getProduct_id();
							
							String temp = Integer.toString(prodId);
							
							String encId = AESEncrypt.encrypt(temp);
							
							
							List<AttachmentBean> listOfAttachments =  allListDAO.listOfAttachment(cust_id,prodId);

							 sector_name = p.getSectorBean().getSector_name();
							 product_name = p.getProductBean().getProduct_name();
							 
								
							 
								 
								
							  File directory=new File("D:\\datastorae\\SLDoc\\application\\"+sector_name+"\\"+product_name+"");
							    int fileCount=directory.list().length;
					        
		        		
				        			%>
							
				
						
                    <div class="col-lg-4 col-md-12 col-sm-12 border-right-blue-grey border-right-lighten-5">
                        <div class="p-1 text-xs-center">
                        	<div class="media-left media-middle">
										<i class="icon-box font-large-1 blue-grey"></i>
									</div>
                           <div class="media-body text-xs-right">
										<span class="font-large-1 text-bold-200 blue"><%=p.getProductBean().getProduct_name()%></span>
										<br><span class="text-bold-200 blue">Machine Serial no : <%=p.getMachine_serial_no()%></span>
							
									<%
									for(AttachmentBean a : listOfAttachments){
										 %>	
						        			<span class="font-large-1 text-bold-200 info"><%=a.getMachine_serial_no()%></span>
						        		
									<%} %>	
									
									</div>
									
                            <div class="card-body overflow-hidden">
                                <div id="morris-comments" class="height-50" style="position: relative;"><svg height="75" version="1.1" width="322" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; left: -0.666664px; top: -0.899994px;"><desc>Created with Raphaël 2.1.2</desc><defs></defs><path style="fill-opacity: 0.1;" fill="#5cc7ac" stroke="none" fill-opacity="0.1"></path><circle cx="25" cy="31.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="44.4171952102698" cy="25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="63.834390420539606" cy="30" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="83.25158563080942" cy="36.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="102.72197863617585" cy="32.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="122.13917384644564" cy="38.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="141.5560427276483" cy="33.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="160.9732379379181" cy="37.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="180.44363094328455" cy="36.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="199.86082615355434" cy="42.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="219.27802136382414" cy="46.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="238.69521657409396" cy="38.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="258.16560957946035" cy="45" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="277.5828047897302" cy="35" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="297" cy="32.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle></svg><div class="morris-hover morris-default-style" style="display: none;"></div></div>
                                <ul class="list-inline clearfix mb-0">
                                   
                                   	<a href="redirect?p=Y3VzdG9tZXJBcHBsaWNhdGlvbnM=&sector_name=<%=p.getSectorBean().getSector_name()%>&product_name=<%=p.getProductBean().getProduct_name()%>">
                                    <li class="border-right-grey border-right-lighten-2 pr-2">
                                        <h2 class="info text-bold-400"><%
                                        		File folder = new File("/Users/you/folder/");
                                        File[] listOfFiles = folder.listFiles();

                                        for (File file : listOfFiles) {
                                            if (file.isFile()) {
                                                System.out.println(file.getName());
                                            }
                                        }
                                        
                                        
                                        %>
                                        
                                     <%=fileCount%>   
                                        </h2>
                                        <span class="btn btn-outline-blue"><i class="icon-folder"></i> Applications</span>
                                    </li>
                                    </a>
                                   	<a href="redirect?p=Y3VzdG9tZXJNYWNoaW5l&prodId=<%=encId%>">
                                    <li class="pl-2">
                                        <h2 class="info text-bold-400" ><%=listOfAttachments.size() %></h2>
                                        <span  class="btn btn-outline-blue"><i class="icon-file"></i> Documents</span>
                                    </li>
                                    </a>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                  
                  
              <%}%> --%>
           


			 
		</div>
	</div>
	
<%	
	if(prodIdd1 == 0){
%>
<script type="text/javascript">
$("#docs").hide();
</script>
<%} %>
	
	
	
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
		<script type="text/javascript">
			
		
			function showApplications(value ,value1 ,id){
				var product_id = value;
				var sector_name = value1;
				var sector_id = id;
				$(".docs").hide();
				$("#chirag").show();
				
				/* location.href = "redirect?p=Y3VzdG9tZXJEYXNoYm9hcmQ=&prodIdd="+product_id; */
				location.href = "redirect?p=Y3VzdG9tZXJEYXNoYm9hcmQ=&prod_name="+product_id+"&sec_name="+sector_name+"&sector_id="+sector_id; 
		
			}
			
			

			function showMachines(id,id1){
				var product_id = id;
				var sector_id = id1;
				$("#chirag").hide();
				$(".docs").show();
				location.href = "redirect?p=Y3VzdG9tZXJEYXNoYm9hcmQ=&prodIdd="+product_id+"&sector_id="+sector_id; 
		
			}
			
			
			function setStone(id){
				
				var cust_prod_id = id;	
				$("#facilityBooking tbody").empty();
		    	$
				.ajax({
					method : "POST",
					url : 'custProductInfo',
					 data:{cust_prod_id : cust_prod_id},
					success : function(data) {
						var json1 = JSON.parse(data);
						var j =0;	
						$.each(json1,function(i, f) {//alert(f.TEMPRATURE);
												
							j++;				
							
							
															var html = "<tr>"+
									   		    			
									   		    			"<td>"+j+"</td>"+
									   		    			"<td>"+f.productBean.product_name+"</td>"+
									   		    			"<td>"+f.machine_serial_no+"</td>"+
									   		    			"<td>"+f.attachment_name+"</td>"+
									   		    			"<td>"+f.date_of_submission+"</td>"+
									   		    			/* "<td>"+f.tag_datatype+"</td>"+
									   		    			"<td>"+f.tag_refresh_interval+"</td>"+ */
									   		    			"<td><a href=\"fileDownload?prodId="+f.productBean.product_id+"&attachment_status="+f.attachment_status+"&product_name="+f.productBean.product_name+"&machine_serial_no="+f.machine_serial_no+"&attachment="+f.attachment_name+"&user_id="+f.customerBean.customer_id+"\"><i class=\"icon-folder-download blue\"></i></a></td>"+
									   		    			"</tr>";	
															
															
									   		    			$(html).appendTo("#facilityBooking tbody");
													
													
											 var html;
											 //alert("attach--"+attach);
											
							    			   $(html).appendTo("#attachmentTxt");
							    			   
										});
					}
											
										});
						
			}
		

				

			</script>
		
</body>
</html>