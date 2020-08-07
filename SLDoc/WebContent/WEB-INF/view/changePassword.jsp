<%@page import="com.dao.AllListDAO"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<script src="plugins/jquery/jquery.min.js"></script>
	
<%@include file="header.jsp" %>
</head>
<body>
	<%
	String diamondSession = new EncodeDecode().encodeString("diamondSession");
	UserBean userBean1111 = (UserBean) session.getAttribute(diamondSession);
	SimpleDateFormat ddmmyyyyhhmmss = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
	SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");
	AllListDAO aaaaa = new AllListDAO();
	int user_id = userBean11.getUser_id();
	%>


	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-key3"></i> Change Password</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">SLDoc Portal</a></li>
		                  <li class="breadcrumb-item active">Change Password</li>
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
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-3">
									<h4 class="card-title" id="striped-label-layout-icons">Change Password</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
								</div>
										<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Enter Your Password Here</h4>
													<div class="row">
														<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Enter Password</label> <input type="text"
																	id="pass" class="form-control border-primary"
																	placeholder="Enter Password" name="pass" required>
															</div>
														</div>
														<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Re-Enter Password</label> <input type="text"
																	id="rePass" class="form-control border-primary"
																	placeholder="Re-enter Password" name="rePass" required>
															</div>
														</div>
													</div>
												</div>
												<br>
												<div align="right">
													<button type="button" class="btn btn-primary" onclick="checkPassRePass();">
														<i class="icon-check2"></i> Update
													</button>
												</div>
										</div>
										<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	< <script type="text/javascript">
		function checkPassRePass(){
			var pass = $("#pass").val();
			var repass = $("#rePass").val();
			
			if(pass == repass){
				$.ajax({
					//for specify Method
				    method: "POST",
				    //for call action
				    url: 'changePassword',
				    //form send data
				    data: {pass : pass,user_id : <%=user_id%>},
				    // action perform when successfully call action with specific method type
				    success: function (data) {
				    	
				    	alert("Password successfully change!!! Please login again..");
				    	location.href = "logout";
				    	
				    }
				});
			}else{
				alert("Password or Re-entered password does not match !!!");
			}
		}
	</script> 
	
	<script type="text/javascript" src="customJs/dontBack.js"></script>
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
  	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-96096445-1', 'auto');
	  ga('send', 'pageview');

	</script>

</body>
</html>