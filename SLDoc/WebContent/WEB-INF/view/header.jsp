
<%@page import="jsx3.lang.System"%>
<%@page import="com.bean.CustomerBean"%>
<%@page import="com.dao.AllListDAO"%>
<%@page import="com.bean.UserBean"%>
<%@page import="com.controller.EncodeDecode"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
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
<link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/validation/form-validation.min.css">
   	   
   	      <!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/validation/form-validation.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/switch.min.css"> 
<!-- END Custom CSS-->

<!-- Card Box CSS -->
<script>
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>

<style>
#grad2 {
	background: #80D2EF; /* For browsers that do not support gradients */
	background: -webkit-linear-gradient(90deg, #80D2EF, #80D2EF);
	/* For Safari 5.1 to 6.0 */
	background: -o-linear-gradient(90deg, #80D2EF, #80D2EF);
	/* For Opera 11.1 to 12.0 */
	background: -moz-linear-gradient(90deg, #80D2EF, #80D2EF);
	/* For Firefox 3.6 to 15 */
	background: linear-gradient(90deg, #80D2EF, #80D2EF);
	/* Standard syntax (must be last) */
}
</style>
</head>

<body data-open="hover" data-menu="horizontal-menu" data-col="2-columns"
	class="horizontal-layout horizontal-menu 2-columns">
	<%
	String userSession = new EncodeDecode().encodeString("userSession");
	UserBean userBean11 = (UserBean) session.getAttribute(userSession);

	if(userBean11 == null){
		session.removeAttribute("userSession");
		session.invalidate();
		 response.sendRedirect("500.jsp");
	}
		 %>	
		 	
	
	<!-- navbar-fixed-top-->
	<nav class="header-navbar navbar navbar-with-menu undefined navbar-light navbar-border navbar-brand-center">
      <div class="navbar-wrapper">
        <div class="navbar-header">
          <ul class="nav navbar-nav">
            <li class="nav-item" style="width: 250px;"><font size="5px" style="font-weight: bold" class="navbar-brand nav-link">Service Document Portal</font></li>
            <li class="nav-item hidden-md-up float-xs-right"><a data-toggle="collapse" data-target="#navbar-mobile" class="nav-link open-navbar-container"><i class="icon-ellipsis pe-2x icon-icon-rotate-right-right"></i></a></li>
          </ul>
        </div>
        <div class="navbar-container container center-layout">
          <div id="navbar-mobile" class="collapse navbar-toggleable-sm">
            <ul class="nav navbar-nav">
              <li class="nav-item hidden-sm-down">
               <img alt="" src="img/sltllogoNEW.png" width="150px;" height="50px;">
              </li>
            </ul>
             <ul class="nav navbar-nav float-xs-right">
             
              <li class="dropdown dropdown-user nav-item"><a href="#" data-toggle="dropdown" class="dropdown-toggle nav-link dropdown-user-link"><span class="avatar avatar-online"><img src="img/user.bmp" alt="avatar"><i></i></span><span class="user-name">
             <%=userBean11.getName()%>
              </span></a>
                <div class="dropdown-menu dropdown-menu-right">
                 <a class="dropdown-item"><i class="icon-user-tie"></i> <%=userBean11.getCustomerTypeBean().getCustomer_type_name() %></a>
              	 <a href="redirect?p=Y2hhbmdlUGFzc3dvcmQ=" class="dropdown-item"><i class="icon-key3"></i> Change password</a>
                 <a href="logout" class="dropdown-item"><i class="icon-power3"></i> Logout</a>
                </div>
              </li>
           
             </ul>
          </div>
        </div>
      </div>
    </nav>
    
    <div role="navigation" data-menu="menu-wrapper"
		style="background-color: #002266;"
		class="header-navbar navbar navbar-horizontal navbar-fixed navbar-light navbar-without-dd-arrow navbar-bordered navbar-shadow"
		id="grad1">
		<!-- Horizontal menu content-->
		<div data-menu="menu-container"
			class="navbar-container main-menu-content container center-layout">
			<!-- include includes/mixins-->
			<ul id="main-menu-navigation" data-menu="menu-navigation"
				class="nav navbar-nav">
			

				
				
			<%if(userBean11.getCustomerTypeBean().getCustomer_type_id() == 1 || userBean11.getCustomerTypeBean().getCustomer_type_id() == 4 ) {%>
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-gear-a"></i><span
						data-i18n="nav.category.ui">Master</span></a>
					<ul class="dropdown-menu">
					<li><a href="redirect?p=YWRkQ3VzdG9tZXI=" class="dropdown-item"><i
								class="icon-users"></i>Customer Master</a></li>
								<li><a href="redirect?p=YWRkU2VjdG9y" class="dropdown-item"><i
								class="icon-price-tags"></i>Sector Master</a></li>
								<li><a href="redirect?p=YWRkUHJvZHVjdA==" class="dropdown-item"><i
								class="icon-diamond2"></i>Product Master</a></li>
							<!-- 	<li><a href="redirect?p=YWRkU2VydmljZUVuZw==" class="dropdown-item"><i
								class="icon-diamond2"></i>Service Eng Master</a></li> -->
								<li><a href="redirect?p=YWRkQWRtaW4=" class="dropdown-item"><i
								class="icon-user-tie"></i>Admin Master</a></li>
						
						
					</ul>
				</li>
		
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-gear-a"></i><span
						data-i18n="nav.category.ui">Admin Upload</span></a>
					<ul class="dropdown-menu">
						<li><a href="redirect?p=YWRtaW5VcGxvYWQ=" class="dropdown-item"><i
								class="icon-file"></i>Upload Documents</a></li>
								<li><a href="redirect?p=YWRtaW5BcHBVcGxvYWQ=" class="dropdown-item"><i
								class="icon-folder"></i>Upload Appllications</a></li>
						
						
					</ul>
				</li>
				<%} %>
			<%if(userBean11.getCustomerTypeBean().getCustomer_type_id() == 3) {%>
			<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-gear-a"></i><span
						data-i18n="nav.category.ui">Customer</span></a>
					<ul class="dropdown-menu">
					<li><a href="redirect?p=Y3VzdG9tZXJNRGFzaGJvYXJk" class="dropdown-item"><i
								class="icon-user-tie"></i>Customer Dashboard</a></li>
					<!-- 	<li><a href="redirect?p=Y3VzdG9tZXJNYWNoaW5l" class="dropdown-item"><i
								class="icon-user-tie"></i>Machine Information</a></li> -->
								
				
						
					</ul>
				</li>

				<%} %>
	
				<%if(userBean11.getCustomerTypeBean().getCustomer_type_id() == 2) {%>
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-gear-a"></i><span
						data-i18n="nav.category.ui">Service Engineer</span></a>
					<ul class="dropdown-menu">
					<li><a href="redirect?p=c2VydmljZUVuZ0Rhc2hib2FyZA==" class="dropdown-item"><i
								class="icon-user-tie"></i>Service Engineer Dashboard</a></li>
					 	<!-- <li><a href="redirect?p=c2VydmljZUVuZ01haW5EYXNoYm9hcmQ=" class="dropdown-item"><i
								class="icon-user-tie"></i>Machine Information</a></li>  -->
								
				
						
					</ul>
				</li>

				<%} %>
				
			</ul>
		</div>
	</div>
    
   
    
</body>

</html>