<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<script type="text/javascript">

function addYear() {
	   var currentYear = new Date().getFullYear();  
	   
	    for (var i = 1; i <= 10; i++ ) {
	        $("#timeSelector").append(
	            
	            $("<option></option>")
	                .attr("value", currentYear)
	                .text(currentYear)
	            
	        );
	        currentYear--;
	        alert(currentYear);
	    }
	}

	addYear();
</script>
<body onload="addYear()">
<%


%>

<select id="timeSelector" onclick="chirag(this.value);">

</select>
	<script src="app-assets/js/core/libraries/jquery.min.js"
		type="text/javascript"></script>
<script type="text/javascript">
function chirag(value) {
	var id = value;
	alert(id);
	
}

</script>


</body>
</html>