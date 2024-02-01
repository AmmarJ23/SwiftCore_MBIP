<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
	<script>

	function show() {
	    var p = document.getElementById('pwd');
	    p.setAttribute('type', 'text');
	}

	function hide() {
	    var p = document.getElementById('pwd');
	    p.setAttribute('type', 'password');
	}

	var pwShown = 0;

	document.getElementById("eye").addEventListener("click", function () {
	    if (pwShown == 0) {
	        pwShown = 1;
	        show();
	    } else {
	        pwShown = 0;
	        hide();
	    }
	}, false);

	</script>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/personal_info_style.css">
</head>
<body>
	<div class="overlay">

	<form style="background-color: white;" action="<%=request.getContextPath()%>/user/personalInfo">

	   <div class="con">

	   <header class="head-form">
        <img src="<%=request.getContextPath()%>/resources/imgmbip.jpg" alt="gambar mbip" width="100" height="100" title="mbip" >

	      <h1>Iskandar Puteri Low Carbon</h1>
	   </header>

	   <br>
	   <div class="field-set">

        Your personal information
        
        <input type="hidden" value="${username}" name="username">
        
        <br>
        <hr>
	         
        Phone number: <input class="form-input" id="phoneNumber" type="text" placeholder="phone number" name="phoneNumber" required > <br>

        Address: <input class="form-input" id="address" type="text" placeholder="address line 1 " name="address1" required >

        <input class="form-input" id="address2" type="text" placeholder="address line 2 " name="address2" required >

        State: <input class="form-input" id="state-input" type="text" placeholder="state" name="state" required >

        Postcode: <input class="form-input" id="postcode-input" type="text" placeholder="postcode" name="postcode" required >

        <br>
        <br>

        Your owned building information

        <hr>

        No. of residents: <input class="form-input" id="state-input" type="text" placeholder="no. of residents" name="noResidents" required > <br>

		Building type: 
        <select class="form-input" id="building-type" name="building-type" required>
            <option value="" disabled selected>Select building type</option>
            <option value="house">House</option>
            <option value="apartment">Apartment</option>
            <option value="condo">Condo</option>
        </select>

        <br>
        <br>

        Type of user

        <hr>

		User type:
        <select class="form-input" id="user-type" name ="user-type" required>
            <option value="" disabled selected>Select user type</option>
            <option value="a1">Housing (high rise)</option>
            <option value="a2">Housing (landed)</option>
            <option value="b">Institution</option>
            <option value="mbip">MBIP staff and dvisions</option>
        </select>

        <br>
	     
	   </div>
	  
	   <div class="other">

		<button style="color: white;">Fill in bill's data </button>

	   </div>

	</form>
	</div>
</body>
</html>