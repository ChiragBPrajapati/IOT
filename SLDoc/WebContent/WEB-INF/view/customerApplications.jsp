<%@page import="java.util.ArrayList"%>
<%@page import="java.text.Format"%>
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
<title>Customer Applications</title>
<%@include file="header.jsp" %>
</head>
<body>
<%
String customerSession = new EncodeDecode().encodeString("customerSession");
CustomerBean customerBean = (CustomerBean) session.getAttribute(customerSession);

int cust_id = customerBean.getCustomer_id();

String sector_name = request.getParameter("sector_name");
String product_name = request.getParameter("product_name");


%>
     <div class="app-content container center-layout mt-2">
      <div class="content-wrapper">
        <div class="content-header row">
          <div class="content-header-left col-md-6 col-xs-12">
            <h2 class="content-header-title mb-0">Applications List</h2>
            <div class="row breadcrumbs-top">
              <div class="breadcrumb-wrapper col-xs-12">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJNRGFzaGJvYXJk">Home</a>
                  </li>

                  <li class="breadcrumb-item active">Applications List
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
            	<h4 class="card-title">Applications List</h4>
            	<a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
       
            </div>
            <div class="card-body collapse in">
                <div class="card-block">
	                <!-- Task List table -->
	                <table id="project-task-list" class="table table-white-space table-bordered row-grouping display table-responsive no-wrap icheck table-middle">
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
</body>
</html>