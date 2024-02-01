<%@ page contentType="text/html;charset=ISO-8859-1" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>

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

	document.getElementById("eye").addEventListener("click", function() {
		if (pwShown == 0) {
			pwShown = 1;
			show();
		} else {
			pwShown = 0;
			hide();
		}
	}, false);
</script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/styles.css'/>"/>
</head>
<body>
	<div class="overlay">
		<!-- LOGN IN FORM  -->
		<form style="background-color: white;" action="${pageContext.request.contextPath}/user/login" method="POST">
			<div class="con">
			<header class="head-form">
					<img src="mbip.jpg" alt="gambar mbip" width="100" height="100" title="mbip">
					<!--     A welcome message or an explanation of the login form -->
					<h1>Iskandar Puteri Low Carbon</h1>
				</header>
				<!--     End  header Content  -->
				<br>
				<div class="field-set">

					<!--   user name -->
					<span class="username"> <i img src="us2.jpg"
						alt="gambar usn" title="usn"></i>
					</span>
					<!--   user name Input-->
					<input class="form-input" id="txt-input" type="text"
						placeholder="username" required> <br>

					<!--   Password -->

					<span class="password"> <i img src="pd2.png"
						alt="gambar pwd" title="pwd"></i>
					</span>
					<!--   Password Input-->
					<input class="form-input" type="password" placeholder="password"
						id="pwd" name="password" required>

					<!--      Show/hide password  -->
					<span> <i class="fa fa-eye" aria-hidden="true" type="button"
						id="eye"></i>
					</span>

				</div>

				<!--   other buttons -->
				<div class="other">
					<!--      Forgot Password button-->
					<button class="btn submits frgt-pass">Forgot Password?</button>
					<!--     Sign Up button -->
					<button class="btn submits sign-up" style="color: white;">
						Sign in
					</button>
					<br> Don't have an account? <a href="signup.jsp"
						style="color: green;">SIGN UP</a>
					<!--      End Other the Division -->
				</div>

				<!--   End Container  -->
			</div>

			<!-- End Form -->
		</form>
	</div>
</body>
</html>