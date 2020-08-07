<%@page import="com.controller.AESEncrypt"%>
<%@page import="java.text.Format"%>
<%@page import="com.bean.AttachmentBean"%>
<%@page import="java.io.File"%>
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
<title>View All Documents</title>
<%@include file="header.jsp" %>
</head>
<body>
<%
String customerSession = new EncodeDecode().encodeString("customerSession");
CustomerBean customerBean = (CustomerBean) session.getAttribute(customerSession);

//int cust_id = customerBean.getCustomer_id();
//int user_id1 = 21;
//String prodIdd = request.getParameter("prodId");


String decId = request.getParameter("prodId");


//String prodIdd = AESEncrypt.decrypt(decId);
int id = Integer.parseInt(decId);

String decCustId = request.getParameter("customer_id");


//String prodIdd = AESEncrypt.decrypt(decId);
int cust_id = Integer.parseInt(decCustId);


AllListDAO allListDAO = new AllListDAO();
List<AttachmentBean> listOfAttachmentss =  allListDAO.listOfAttachments(cust_id , decId);
List<Integer> listOfProduct2 =  allListDAO.listOfCustomerProduct3(cust_id, id);

%>
     <div class="app-content container center-layout mt-2">
      <div class="content-wrapper">
        <div class="content-header row">
          <div class="content-header-left col-md-6 col-xs-12">
            <h2 class="content-header-title mb-0">Documents List</h2>
            <div class="row breadcrumbs-top">
              <div class="breadcrumb-wrapper col-xs-12">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="redirect?p=YWRkQ3VzdG9tZXI=">Home</a>
                  </li>

                  <li class="breadcrumb-item active">Documents List
                  </li>
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
          <div class="content-header-lead col-xs-12 mt-2">
            <p class="lead"></p>
          </div>
        </div>
        <div class="content-body"><section class="row">
    <div class="col-xs-12">
        <div class="card">
            <div class="card-header">
            	<h4 class="card-title">Documents List</h4>
            	<a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
       
            </div>
            
            	<%
                		for (Integer a : listOfProduct2) {  
                			
                			ProductBean productBean  =  allListDAO.getListOfProductfromId(a);
                			String product_name1 = productBean.getProduct_name();
                			
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
										<i class="icon-box font-large-1 blue-grey"></i>
									</div>
                           <div class="media-body text-xs-right">
										<span class="font-large-1 text-bold-200 blue"><%=product_name1%></span>
										<br><span class="text-bold-200 blue">Segment : <%=productBean.getSectorBean().getSector_name()%></span>
							
							<%-- 		<%
									for(AttachmentBean a : listOfAttachments){
										 %>	
						        			<span class="font-large-1 text-bold-200 info"><%=a.getMachine_serial_no()%></span>
						        		
									<%} %>	 --%>
									
									</div>
									
                            <div class="card-body overflow-hidden">
                                <div id="morris-comments" class="height-50" style="position: relative;"><svg height="75" version="1.1" width="322" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; left: -0.666664px; top: -0.899994px;"><desc>Created with Rapha�l 2.1.2</desc><defs></defs><path style="fill-opacity: 0.1;" fill="#5cc7ac" stroke="none" fill-opacity="0.1"></path><circle cx="25" cy="31.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="44.4171952102698" cy="25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="63.834390420539606" cy="30" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="83.25158563080942" cy="36.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="102.72197863617585" cy="32.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="122.13917384644564" cy="38.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="141.5560427276483" cy="33.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="160.9732379379181" cy="37.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="180.44363094328455" cy="36.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="199.86082615355434" cy="42.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="219.27802136382414" cy="46.25" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="238.69521657409396" cy="38.75" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="258.16560957946035" cy="45" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="277.5828047897302" cy="35" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle><circle cx="297" cy="32.5" r="0" fill="#37bc9b" stroke="#ffffff" style="" stroke-width="1"></circle></svg><div class="morris-hover morris-default-style" style="display: none;"></div></div>
                                <ul class="list-inline clearfix mb-0">
                                   
                                   	<a href="redirect?p=Y3VzdG9tZXJBcHBsaWNhdGlvbnM=&sector_name=">
                                    <li class="border-right-grey border-right-lighten-2 pr-2">
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
                                     <%=listofproductofcust.size()%>   
                                        </h2>
                                        <span class="btn btn-outline-blue"><i class="icon-folder"></i> Machines</span>
                                    </li>
                                    </a>
                                   		<a href="redirect?p=Y3VzdG9tZXJNYWNoaW5l&prodId=<%=encId%>">
                                    <li class="pl-2">
                                        <h2 class="info text-bold-200" ></h2>
                                        <span  class="btn btn-outline-blue"><i class="icon-file"></i> Applications</span>
                                    </li>
                                    </a>
                                   	
                                 
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                  
                  
              <%}%>
            
            
            
            <div class="card-body collapse in">
                <div class="card-block">
	                <!-- Task List table -->
	                <table id="project-task-list" class="table table-white-space table-bordered row-grouping">
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
				        int count = 0;
				        for(AttachmentBean a : listOfAttachmentss){
				        
				        	SimpleDateFormat ddmmyyyyhhmmss1 = new SimpleDateFormat("dd/MM/yyyy");
				        	String date = a.getDate_of_submission();
				        	
				       
							count++;
					        %>
				        
				        	<!-- ABC Project -->
				            <tr>
				            <td style="font-size: 30px;"><%=count %></td>
				            <td style="font-size: 22px;"><%=a.getProductBean().getProduct_name() %></td>
				            <td style="font-size: 15px;"><%=a.getMachine_serial_no() %></td>
				            <td style="font-size: 15px;"><%=a.getAttachment_name()%></td>
				            <td style="font-size: 15px;"><%=date%></td>
				            
				             <td><a href="fileDownload?prodId=<%=a.getProductBean().getProduct_id()%>&attachment_status=<%=a.getAttachment_status()%>&product_name=<%=a.getProductBean().getProduct_name()%>&machine_serial_no=<%=a.getMachine_serial_no()%>&attachment=<%=a.getAttachment_name()%>&user_id=<%=a.getCustomerBean().getCustomer_id()%>"><i class="icon-folder-download info"></i></a>
				             &nbsp;&nbsp;
				             <i class="icon-trash" title="Delete Attachment" style="color: red;cursor: pointer;" onclick="deleteAttachment(<%=a.getAttachment_id()%>)"></i>
				             </td>
				                
				       
				            </tr>
		
		
				   <%} %>
				 
				          
				        </tbody>
				
					</table>
					<!--/ Task List table -->
				</div>
            </div>
        </div>
    </div>
</section>
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
		<script type="text/javascript">
		function deleteAttachment(value){
			
			var ratval = confirm("Are you sure?");
			
			if(ratval == true){
				location.href = "deleteAttachment?attachmentId="+value;
			}
			
		}

		
		
		</script>
</body>
</html>