<%@page import="java.util.Calendar"%>
<%@page import="com.bean.SectorBean"%>
<%@page import="com.bean.CustomerProductBean"%>
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
<title>Upload Application</title>
<script src="plugins/jquery/jquery.min.js"></script>
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
      
        var sectorId = document.getElementById('sectorId').value;
        var product_id = document.getElementById('prodId').value;
        var year = document.getElementById('yearId').value;
 
        if(sectorId == ""){
        	 swal({
                 title: "Error!",
                 text: "Sector Name can not be null...!",
                 type: "error"
             });
        }
        if(product_id == ""){
       	 swal({
                title: "Error!",
                text: "Product Name can not be null...!",
                type: "error"
            });
       }
        if(year == ""){
          	 swal({
                   title: "Error!",
                   text: "Year can not be null...!",
                   type: "error"
               });
          }
        fd.append("sectorId", sectorId);
        fd.append("product_id", product_id);
        fd.append("year", year);
        fd.append("spmType", spmType);
        fd.append("multipartFile", file);
        xhr.upload.addEventListener("progress", onUploadProgress, false);
        xhr.addEventListener("load", onUploadComplete, false);
        xhr.addEventListener("error", onUploadFailed, false);
        xhr.open("POST", "save-product2");
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

</head>
	<%
	String customerSession = new EncodeDecode().encodeString("customerSession");
	CustomerBean customerBean1 = (CustomerBean) session.getAttribute(customerSession);
	int temp_cust_id = 0;
	int temp_cust_type_id = 0;
	int userLoginCustId = 0;
	int customerRights = 0;
	if(customerBean1 != null){
		userLoginCustId = customerBean1.getCustomer_id();
		temp_cust_type_id = customerBean1.getCustomerTypeBean().getCustomer_type_id();
		customerRights = Integer.parseInt(customerBean1.getProducts());
	}
	if(temp_cust_type_id == 2 || temp_cust_type_id == 3){
		/* session.removeAttribute("customerBean1");
		session.invalidate(); */
		response.sendRedirect("redirect?p=bG9naW4=");
	}
	
	
	
	%>
<%@include file="header.jsp"%>

<body>
	<%
	AllListDAO allListDAO = new AllListDAO();

	int sectorId = 0;
	int prodId = 0;
	if(request.getParameter("sectorId") != null){
		sectorId = Integer.parseInt(request.getParameter("sectorId"));
	}
	

	String sector_name = null;
/* 	
	List<String> listOfKapanByCustomer = allListDAO.listOfKapanByCustomerIdByFilter(custId);
	List<String> listOfLotByCustomer = allListDAO.listOfLotByCustomerIdByFilter(custId,kapan); */
 
	List<SectorBean> listOfSector =  allListDAO.listOfSector();
	List<ProductBean> listOfProduct =  allListDAO.getListOfProductfromSectorId(sectorId);

	
	String listOfSector2 =  allListDAO.listOfSector2(customerRights);
	
	int cid = 0;
	int pid = 0;

%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0">
						<i class="icon-user-tie"></i>Upload Applications
					</h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="redirect?p=YWRkQ3VzdG9tZXI=">SLDoc Portal</a></li>
								<li class="breadcrumb-item active">Upload Applications</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<a href="redirect?p=YWRkQ3VzdG9tZXI="><button type="button" class="btn-icon btn btn-secondary btn-round"
					
						data-toggle="tooltip" data-original-title="Home">
						<i class="icon-home"></i>
					</button></a>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>
			<br>
	<%-- 				<div class="row">
													<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group">
															<label for="userinput1">Machine Segment</label> <select
																class="select2 form-control border-primary"
																name="sectorId" id="sectorId" required
																>
																<option value="" selected="selected">---SELECT
																	SEGMENT ---</option>
																<%
																		for (String s : listOfSector2) {
																			
																	%>
															
																
																<option value="<%=s.getSector_id()%>"><%=s.getSector_name()%>

																</option>
																<%
																		}
																	%>
																
															</select>

														</div>
													</div>
			
			</div> --%>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-3">
									<h4 class="card-title" id="striped-label-layout-icons">Upload Applications</h4>
								</div>

							</div>
							<div class="card-body">
								<div class="card-block">
									<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<form class="form" action="startUpload" id="formSave"
											method="post">
											<input type="hidden" name="uId" value=""> <input
												type="hidden" name="subRedirection" value="subClient">
											<!-- This Hidden field shiow the status which action perform in servlet -->
											<div class="form-body">
												<div class="row">
													<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group">
															<label for="userinput1">Machine Segment</label> <select
																class="select2 form-control border-primary"
																name="sectorId" id="sectorId" required
																onchange="setStone();">
																<option value="" selected="selected">---SELECT
																	SEGMENT ---</option>
																<%
																		for (SectorBean s : listOfSector) {
																			if (sectorId == s.getSector_id()) {
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
													<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group">
															<label for="userinput1">Product</label> <select
																class="select2 form-control border-primary"
																name="prodId" id="prodId" required
																onchange="setValue(this.value);">
													
																<option value="" selected="selected">---SELECT
																	PRODUCT ---</option>
																<%
																		for (ProductBean p : listOfProduct) {
																			if (prodId == p.getProduct_id()) {
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
															</select>

														</div>
													</div>
<!-- 											
											int year = 0;
		Calendar calendar = Calendar.getInstance(); 
		 year = calendar.get(Calendar.YEAR);
		 List<Integer> list = new ArrayList<Integer>();
	    for (int i = 0; i <= 10; i++ ) {	    	 
	    	 year = year - 1;
	    	 System.out.println(year);
	    	 //System.out.println(year);
	    	 list.add(year);
	    }
	 -->
											
													<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group">
															<label for="userinput1">Year</label> <select
																class="select2 form-control border-primary"
																name="yearId" id="yearId" required
																onfocus="setValue();">
													<%	int year = 0;
														int year1 = 0;
													Calendar calendar = Calendar.getInstance(); 
													 year = calendar.get(Calendar.YEAR); 
													 year1 = Calendar.getInstance().get(Calendar.YEAR);
													 %>
																<option value="<%=year1%>" selected="selected"><%=year1 %></option>
																<%
															
																 for (int i = 0; i <= 10; i++) {	
																	 year = year - 1;
																	%>
																<option value="<%=year%>"><%=year%></option>
																<%
																 
																 }
																	%>
															</select>

														</div>
													</div>
											
												</div>

												<br>
												<br>

												<!-- 	<hr style="border: dashed 1px gray;"> -->
												<h5>
													<i class="icon-paper-clip"></i> Attachment &nbsp;
												</h5>

												<div class="row">
													<div class="col-sm-12">
														<div class="form-group">
															<form style="margin-bottom: 20px">


																<div id='progressBar'
																	style='height: 20px; border: 2px solid green; margin-bottom: 20px'>
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


			<!-- Jquery DataTable Plugin Js -->

			<!-- Jquery Core Js -->


			<!-- Bootstrap Core Js -->
			<script src="plugins/bootstrap/js/bootstrap.js"></script>

			<!--   Bootstrap Colorpicker Js -->
			<script
				src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>

			<!-- Dropzone Plugin Js -->
			<script src="plugins/dropzone/dropzone.js"></script>

			<!-- Input Mask Plugin Js -->
			<script src="plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>

			<!-- Multi Select Plugin Js -->
			<script src="plugins/multi-select/js/jquery.multi-select.js"></script>

			<!-- Select Plugin Js -->
			<script src="plugins/bootstrap-select/js/bootstrap-select.js"></script>

			<!-- Jquery Spinner Plugin Js -->
			<script src="plugins/jquery-spinner/js/jquery.spinner.js"></script>

			<!-- Bootstrap Tags Input Plugin Js -->
			<script src="plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

			<!-- noUISlider Plugin Js -->
			<script src="plugins/nouislider/nouislider.js"></script>


			<!-- Slimscroll Plugin Js -->
			<script src="plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

			<!-- Waves Effect Plugin Js -->
			<script src="plugins/node-waves/waves.js"></script>

			<!-- Jquery CountTo Plugin Js -->
			<script src="plugins/jquery-countto/jquery.countTo.js"></script>

			<!-- Morris Plugin Js -->
			<script src="plugins/raphael/raphael.min.js"></script>
			<script src="plugins/morrisjs/morris.js"></script>

			<!-- ChartJs -->
			<script src="plugins/chartjs/Chart.bundle.js"></script>

			<!--  Custom Js -->
			<script src="js/admin.js"></script>
			<script src="js/pages/forms/advanced-form-elements.js"></script>

			<!-- Flot Charts Plugin Js -->
			<script src="plugins/flot-charts/jquery.flot.js"></script>
			<script src="plugins/flot-charts/jquery.flot.resize.js"></script>
			<script src="plugins/flot-charts/jquery.flot.pie.js"></script>
			<script src="plugins/flot-charts/jquery.flot.categories.js"></script>
			<script src="plugins/flot-charts/jquery.flot.time.js"></script>

			<!-- Sparkline Chart Plugin Js -->
			<script src="plugins/jquery-sparkline/jquery.sparkline.js"></script>

			<!-- Custom Js -->
			<script src="js/admin.js"></script>
			<script src="js/pages/index.js"></script>
			<script src="js/pages/ui/modals.js"></script>
			<script src="js/pages/tables/jquery-datatable.js"></script>

			<script src="js/pages/ui/dialogs.js"></script>

			<script src="plugins/jquery-datatable/jquery.dataTables.js"></script>
			<script
				src="plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
			<script
				src="plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
			<script
				src="plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
			<script src="plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
			<script
				src="plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
			<script src="plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
			<script
				src="plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
			<script
				src="plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

			<!-- Demo Js -->
			<script src="js/demo.js"></script>


			<!-- Bootstrap Notify Plugin Js -->
			<script src="plugins/bootstrap-notify/bootstrap-notify.js"></script>
			<script src="plugins/sweetalert/sweetalert.min.js"></script>
			<script type="text/javascript">
function setStone(){
	var sectorId = $("#sectorId").val();
	var yearId = $("#yearId").val();
	
	
	window.location.href = "redirect?p=YWRtaW5BcHBVcGxvYWQ=&sectorId="+sectorId+"&yearId="+yearId;
}

/* function setValue(){
	var prodId = $("#prodId").val();
	var custId = $("#custId").val();
	window.location.href = "redirect?p=YWRtaW5BcHBVcGxvYWQ=&prodId="+prodId+"&custId="+custId;
} */
</script>
</body>
</html>
