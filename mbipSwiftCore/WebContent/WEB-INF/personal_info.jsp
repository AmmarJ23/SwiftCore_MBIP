<%@ page import="com.model.User" %>
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
	
	<% String url  = new String();
	if ( (boolean) request.getAttribute("isSignUp")){
		
		url = request.getContextPath()+ "/user/personalInfo";
		User user = new User(" ", " ", " ", " ", " ", " ", " ", " ", " ", " ");
	} else
	{
		url = request.getContextPath() + "/user/personalInformationUpdate";
		User user = (User) request.getAttribute("user");
	}
	
	%>

	<form style="background-color: white;" action="<%=url%>">

	   <div class="con">

	   <header class="head-form">
        <img src="<%=request.getContextPath()%>/resources/img/mbip.jpg" alt="gambar mbip" width="100" height="100" title="mbip" >

	      <h1>Iskandar Puteri Low Carbon</h1>
	   </header>

	   <br>
	   <div class="field-set">

        Your personal information
        
        <input type="hidden" value="${username}" name="username">
        
        <br>
        <hr>
	         
        Phone number: <input class="form-input" id="phoneNumber" type="text" placeholder="phone number" name="phoneNumber" value="${user.getPhoneNumber()}" required > <br>

        Address: <input class="form-input" id="address" type="text" placeholder="address line 1 " name="address1" value="${user.getAddress()}" required >

        State: <input class="form-input" id="state-input" type="text" placeholder="state" name="state" value="${user.getState()}" required >

        Postcode: <input class="form-input" id="postcode-input" type="text" placeholder="postcode" name="postcode" value="${user.getPostcode()}" required >

        <br>
        <br>

        Your owned building information

        <hr>

        No. of residents: <input class="form-input" id="state-input" type="text" placeholder="no. of residents" name="noResidents" value="${user.getNoResidents() }" required > <br>

		Building type: 
        <select class="form-input" id="building-type" name="building-type" required>
		    <option value="" disabled>Select building type</option>
		    <option value="house" ${user.getBuildingType() eq 'house' ? 'selected' : ''}>House</option>
		    <option value="apartment" ${user.getBuildingType() eq 'apartment' ? 'selected' : ''}>Apartment</option>
		    <option value="condo" ${user.getBuildingType() eq 'condo' ? 'selected' : ''}>Condo</option>
		</select>

        <br>
        <br>

        Type of user

        <hr>

		User type:
        <select class="form-input" id="user-type" name ="user-type" required>
            <option value="" disabled selected>Select user type</option>
            <option value="a1" ${user.getUserType() eq 'a1' ? 'selected' : ''}>Housing (high rise)</option>
            <option value="a2" ${user.getUserType() eq 'a2' ? 'selected' : ''}>Housing (landed)</option>
            <option value="b" ${user.getUserType() eq 'b' ? 'selected' : ''}>Institution</option>
            <option value="mbip" ${user.getUserType() eq 'mbip' ? 'selected' : ''}>MBIP staff and divisions</option>
        </select>

        <br>
	     
	   </div>
	  
	   <div class="other">

		<% 
		if ( (boolean) request.getAttribute("isSignUp")){
			%> <button style="color: white;">Fill in personal information </button> <% 
		}
		
		else{
			%> <button style="color: white;">Update Information </button> <% 
		}
		
		%>

		

	   </div>

	</form>
	</div>
</body>
</html>