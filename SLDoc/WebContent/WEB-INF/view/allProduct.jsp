<%@page import="java.text.Format"%>
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
<title>Customer Machine</title>
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

var custProdId;
var sector_id ;
var html = "";	
function getListData(id,id1){
	 custProdId = id;
	  sector_id = id1;
	
	 $("#customerIddd").val(custProdId);
	 $("#sector_id").val(sector_id);
	 html = "";	
	 $('#attachmentTxt').children().last().remove();
	 if(sector_id == 29){

	  html = "	<div class=\"col-md-4 col-lg-4 col-sm-4 col-xs-4\">\r\n" + 
		"														<div class=\"form-group\">\r\n" + 
		"															<label for=\"userinput1\">SPM Machine</label> <select\r\n" + 
		"																class=\"select2 form-control border-primary\"\r\n" + 
		"																name=\"spmType\" id=\"spmType\" required\r\n" + 
		"																>\r\n" + 
		"																<option value=\"\" selected=\"selected\">---SELECT TYPE---</option>\r\n" + 
		"															\r\n" + 
		"																\r\n" + 
		"																<option value=\"docs\">Docs</option>\r\n" + 
		"																<option value=\"application\">Application\r\n" + 
		"																</option>\r\n" + 
		"														\r\n" + 
		"															</select>\r\n" + 
		"\r\n" + 
		"														</div>\r\n" + 
		"													</div>";
	
	 
	
    }else{
    	
    	html = "";	
    }
	
	 $(html).appendTo("#attachmentTxt");
	
	
}

</script>

<script>
    var totalFileLength, totalUploaded, fileCount, filesUploaded,res;
    //To log everything on console
     function debug(s) {
        var debug = document.getElementById('debug');
        if (debug) {
            debug.innerHTML = debug.innerHTML + '<br/>' + s;
        }
    }
    
     function completed(s) {
         var completed = document.getElementById('completed');
         if (completed) {
        	 completed.innerHTML = completed.innerHTML + '<br/>' + s;
         }
     }
    
    
    //Will be called when upload is completed
    function onUploadComplete(e) {
        totalUploaded += document.getElementById('files').files[filesUploaded].size;
        filesUploaded++;
        completed('complete ' + filesUploaded + " of " + fileCount);
        debug('totalUploaded: ' + totalUploaded); 
        if (filesUploaded < fileCount) {
            uploadNext();
        } else {
           
            //for testing
            if (res == "") {
               window.alert("Their is some error while uploading files");
            }else{
           	 if(res == "This file already exists......."){
           		 var bar = document.getElementById('bar');
                 bar.style.width = '0%';
                 bar.innerHTML = 'Error';
               	 setTimeout(function() {
                     swal({
                         title: "Error!",
                         text: res,
                         type: "error"
                     }, function() {
                    	 location.reload();
                     });
                 }, 100);
               		
           	 }else if(res == "File(s) Uploaded Successfully......."){
           		 var bar = document.getElementById('bar');
                 bar.style.width = '100%';
                 bar.innerHTML = '100% complete';
                     swal({
                         title: "Success!",
                         text: res,
                         type: "success"
                     }, function() {
                    	 location.reload();
                     });
           	 }
           	 
            }
        }
    }
 
    //Will be called when user select the files in file control
    function onFileSelect(e) {
        var files = e.target.files; // FileList object
        var output = [];
        fileCount = files.length;
        totalFileLength = 0;
        for (var i = 0; i < fileCount; i++) {
            var file = files[i];
            output.push(file.name, ' (', file.size, ' bytes, ', file.lastModifiedDate.toLocaleDateString(), ')');
            output.push('<br/>');
            debug('add ' + file.name, ' (', file.size, ' bytes, ');
            totalFileLength += file.size; 
        }
        document.getElementById('selectedFiles').innerHTML = output.join('');
        debug('totalFileLength:' + totalFileLength); 
    }
 
    //This will continueously update the progress bar
    function onUploadProgress(e) {
        if (e.lengthComputable) {
            var percentComplete = parseInt((e.loaded + totalUploaded) * 100 / totalFileLength);
            var bar = document.getElementById('bar');
            bar.style.width = percentComplete + '%';
            bar.innerHTML = percentComplete + ' % complete';
        } else {
        	debug('unable to compute');
        }
    }
 
    //the Ouchhh !! moments will be captured here
    function onUploadFailed(e) {
        alert("Error uploading file");
    }
    function chirag() {
        location.reload();
    }
    //Pick the next file in queue and upload it to remote server
    function uploadNext() {
        var xhr = new XMLHttpRequest();
        var fd = new FormData();
        var file = document.getElementById('files').files[filesUploaded];
        var selection = document.getElementById('files');
/*         for (var i=0; i<selection.files.length; i++) {
            var ext = selection.files[i].name.substr(-3);
            if(ext !== "pdf" || ext !== "rar" || ext !== "zip" || ext !== "txt"|| ext !== "docx" )  {
                alert('Only .pdf ,.rara ,.zip , .txt ,.docx extensions are supported');
                location.reload();
                return false;
                
            }
        } */
        
        var spmType = null;
        spmType = document.getElementById('spmType');
      
        if(spmType == null || spmType == ""){
        	spmType = "";
        }else{
       	 
       	 spmType = document.getElementById('spmType').value;	 
        }
		fd.append("spmType", spmType)
		fd.append("custProdId", custProdId)
        fd.append("sector_id", sector_id);
        fd.append("multipartFile", file);
        xhr.upload.addEventListener("progress", onUploadProgress, false);
        xhr.addEventListener("load", onUploadComplete, false);
        xhr.addEventListener("error", onUploadFailed, false);
        xhr.open("POST", "save-product1");
        debug('uploading ' + file.name);
        xhr.send(fd);
        xhr.onreadystatechange = function () {
            if(xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200){
                res = xhr.responseText;
            }
        }
    }
    //Let's begin the upload process
    function startUpload() {
        totalUploaded = filesUploaded = 0;
        uploadNext();
    }
    //Event listeners for button clicks
    window.onload = function() {
        document.getElementById('files').addEventListener('change', onFileSelect, false);
        document.getElementById('uploadButton').addEventListener('click', startUpload, false);
    }
</script>
<body>
<%
/* String customerSession = new EncodeDecode().encodeString("customerSession");
CustomerBean customerBean = (CustomerBean) session.getAttribute(customerSession); */


//int user_id1 = 21;
String customerId = request.getParameter("custId");
int custId = Integer.parseInt(customerId);
AllListDAO allListDAO = new AllListDAO();

CustomerBean customerBean2 = allListDAO.customerDetails(custId);

List<CustomerProductBean> listOfProducts =  allListDAO.listOfCustomerProduct(custId);

%>
     <div class="app-content container center-layout mt-2">
      <div class="content-wrapper">
        <div class="content-header row">
          <div class="content-header-left col-md-6 col-xs-12">
           <h2 class="content-header-title mb-0"><i class="icon-display"></i> Machine List</h2>
            <div class="row breadcrumbs-top">
              <div class="breadcrumb-wrapper col-xs-12">
                <ol class="breadcrumb">
                   <li class="breadcrumb-item"><a href="#">SLDoc Portal</a></li>
                  

                  <li class="breadcrumb-item active">Machine List
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
    <div class="col-xs-12 col-lg-12 col-md-12">
        <div class="card">
            <div class="card-header">
            	<h4 class="card-title">Machine List of <%=customerBean2.getFullname() %> </h4>
            	<a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
       
            </div>
            <div class="card-body">
                <div class="card-block">
	                <!-- Task List table -->
	                <div class="table-responsive">
	                <table class="table mb-0" >			        <thead>
				            <tr>
				              	<th>No</th>
				                <th>Machine Name</th>
				                <th>Machine Serial no</th>
				                <th>Segment</th>
				                <th>Actions</th>
				            </tr>
				        </thead>
				        <tbody>
				        <%
				        int count = 0;
				        for(CustomerProductBean a : listOfProducts){
							count++;
					        %>
				        
				        	<!-- ABC Project -->
				            <tr>
				            <td style="font-size: 30px;"><%=count %></td>
				            <td style="font-size: 15px;"><%=a.getProductBean().getProduct_name() %></td>
				            <td style="font-size: 15px;"><%=a.getMachine_serial_no() %></td>
				            <td style="font-size: 15px;align-content: center;"><%=a.getSectorBean().getSector_name()%></td>
				            
				            
				             <td><a href="#inlineForm1" data-toggle="modal"  onclick="getListData(<%=a.getCust_prod_id()%>,<%=a.getSectorBean().getSector_id()%>)"><button class="btn btn-outline-primary btn-min-width mr-1 mb-1">Upload Documents</a></button>
				                <a href="redirect?p=dmlld0RvY3VtZW50cw==&customer_id=<%=a.getCustomerBean().getCustomer_id()%>&prodId=<%=a.getProductBean().getProduct_id()%>"><button class="btn btn-outline-primary btn-min-width mr-1 mb-1">View Documents</a></button></td> 
				       
				            </tr>
		            

		
				   <%} %>
				 
				          
				        </tbody>
				
					</table>
					</div>
					<!--/ Task List table -->
				</div>
            </div>
            

<!-- Modal -->
									<div class="modal fade text-xs-left" id="inlineForm1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
										<div class="modal-dialog modal-xl" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													  <span aria-hidden="true">&times;</span>
													</button>
													
													<h3><label class="modal-title text-text-bold-600" id="myModalLabel33">Upload Machines Documents</label></h3>
												</div>
							
								
							<br><br><br>
							 <div class="modal-body">
							
										<form class="form" action="startUpload" id="formSave"
											method="post">	
											<input type="hidden" value="" id="customerIddd" name="customerIddd">
												<input type="hidden" value="" id="sector_id" name="sector_id">
											<!-- This Hidden field shiow the status which action perform in servlet -->
											
											<div class="form-group">
										
												<div class="row">
									
								
												<!-- 	<hr style="border: dashed 1px gray;"> -->
												<h5>
													<i class="icon-paper-clip"></i> Attachment &nbsp; 	
												</h5>

												<div class="row">
														<div class="form-group" style="margin-left: 25px;margin-right: 25px;">
															<form style="margin-bottom: 20px ;">


																<div id='progressBar'
																	style='height: 20px;  border: 2px solid green; margin-bottom: 20px ;'>
																	<div id='bar'
																		style='height: 100%; background: #33dd33; width: 0%'>
																	</div>
																</div>
																<div id="completed" style='overflow: auto'></div>
																<input type="file" id="files" multiple
																	accept=".zip,.rar,.txt,.pdf,.docx" name="attachment"
																	required="required" /></br>
																<output id="selectedFiles"></output>
																<div id='debug'
																	style='height: 200px; border: 2px solid #ccc; overflow: auto'></div>

															</form>

															<input type="hidden" name="redirect">
														</div>

													</div>
													<div id="attachmentTxt"></div>
												</div>

												<div class="form-actions right">
													<button type="button" class="btn btn-primary"
														id="uploadButton" value="Upload">
														<i class="icon-check2"></i> Save
													</button>
												
													<button type="reset" class="btn btn-warning mr-1"
														onclick="chirag()">
														<i class="icon-cross2"></i> Reset
													</button>
												</div>
										</form>
									</div>
									<hr>
									<h2 class="card-inside-title" style="color: red">Note :
										Wait Untill the all files are uploaded and confirmation pop-up
										will be appear..</h2>

								</div>


											</div>
										</div>
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