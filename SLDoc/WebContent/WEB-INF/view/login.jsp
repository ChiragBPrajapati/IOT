
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
   
   <meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Robust admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, robust admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>Login</title>
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
    
    
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap.min.css">
    <!-- font icons-->
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/icomoon.css">
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/sliders/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/extensions/pace.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/icheck/custo	m.css">
    <!-- END VENDOR CSS-->
    <!-- BEGIN ROBUST CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap-extended.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/app.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/colors.min.css">
    <!-- END ROBUST CSS-->
    <!-- BEGIN Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/horizontal-menu.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/vertical-overlay-menu.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/login-register.min.css">
        <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/selects/select2.min.css">
    <!-- END Page Level CSS-->
    <!-- BEGIN Custom CSS-->
     <link rel="stylesheet" type="text/css" href="css/animate.css">
     <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- END Custom CSS-->
  
    <script language="Javascript">
	function capLock(e)
	{
	 	kc = e.keyCode?e.keyCode:e.which;
	 	sk = e.shiftKey?e.shiftKey:((kc == 16)?true:false);
	 	if(((kc >= 65 && kc <= 90) && !sk)||((kc >= 97 && kc <= 122) && sk))
	 		{
	 		 	document.getElementById('divMayus').style.visibility = 'visible';
	 		}
	 	else
	 		{
	 			document.getElementById('divMayus').style.visibility = 'hidden';
	 		}
	}
	
	
	function hideMessage()
	{
		//document.getElementById("panelbody").style.display="none"; 
		 $('.alert').fadeOut('slow');
	}

		function startTimer()
		 {
				var tim = window.setTimeout("hideMessage()", 5000);  // 5000 milliseconds = 5 seconds
		 }
</script>
</head>
 <body data-open="hover" data-menu="horizontal-menu" data-col="1-column" class="horizontal-layout horizontal-menu 1-column  blank-page blank-page">
    
    
    <div class="app-content container center-layout">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
        <!-- <img src="img/sltllogo.png" alt="sltlLogo" class="animated zoomIn"> -->
        
        
        
        <section class="flexbox-container">
		    <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1 box-shadow-2 p-0">
		    <%if(request.getAttribute("loginError") !=null) {%>
		    <div class="alert alert-danger alert-dismissible fade in mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<strong>Oh snap!</strong> ${loginError}
								</div>
					<%} %>			
		        <div class="card border-grey border-lighten-3 px-2 py-2 m-0">
		            <div class="card-header no-border pb-0">
		                <div class="card-title text-xs-center">
		                 <div class="BODY">
		                    <img alt="" src="img/sltllogoNEW.png" width="200px;" height="70px;">
			</div>
                </div>
                <h6 class="card-subtitle line-on-side text-muted text-xs-center font-small-3 pt-2"><span>SLDoc Portal Login</span></h6>
            </div>
            <div class="card-body collapse in">
                <!-- <p class="card-subtitle line-on-side text-muted text-xs-center font-small-3 mx-2 my-1"><span></span></p> -->
                <div class="card-block">
                	<%if(request.getRequestURL().toString().contains("view")){ %>
                		 <form class="form-horizontal" action="login" method="post" >
                	<%}else{%>
                		 <form class="form-horizontal" action="controller/login" method="post" >
                	<%} %>
                   
                        <fieldset class="form-group position-relative has-icon-left">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Your username" required>
                            <div class="form-control-position"  style="margin-top:10px">
                                <i class="icon-head"></i>
                            </div>
                        </fieldset>
                        <br>
                        <fieldset class="form-group position-relative has-icon-left">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                            <div class="form-control-position"  style="margin-top:10px">
                                <i class="icon-key3"></i>
                            </div>
                        </fieldset>
                        <br>
                        <button type="submit" class="btn btn-primary btn-block"><i class="icon-unlock2"></i> Login</button>
                    </form>
                </div>
            </div>
        </div>
        </div>
        
    </div>
</section>

        </div>
      </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->

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
    <script src="app-assets/vendors/js/forms/validation/jqBootstrapValidation.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/forms/icheck/icheck.min.js" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN ROBUST JS-->
    <!-- build:js app-assets/js/app.min.js-->
    <script src="app-assets/js/core/app-menu.min.js" type="text/javascript"></script>
    <script src="app-assets/js/core/app.min.js" type="text/javascript"></script>
    <script src="app-assets/js/scripts/ui/fullscreenSearch.min.js" type="text/javascript"></script>
      <script src="app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
    <!-- /build-->
    <!-- END ROBUST JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/scripts/forms/form-login-register.min.js" type="text/javascript"></script>
    <script src="app-assets/js/scripts/forms/select/form-select2.min.js" type="text/javascript"></script>
    
    	<script type="text/javascript" src="customJs/dontBack.js"></script>
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