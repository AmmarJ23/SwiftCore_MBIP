<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*" %>

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

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/signup_style.css">
</head>
<body>
<div class="overlay">
    <!-- LOGIN FORM -->
    <form style="background-color: white;" action="<%=request.getContextPath()%>/user/signup">
        <!-- Container for items in the form -->
        <div class="con">
            <!-- Start header Content -->
            <header class="head-form">
                <img src="<%=request.getContextPath()%>/resources/img/mbip.jpg" alt="gambar mbip" width="100" height="100" title="mbip">
                <!-- A welcome message or an explanation of the login form -->
                <h1>Iskandar Puteri Low Carbon</h1>
            </header>
            <!-- End header Content -->
            <br>
            <div class="field-set">

                <!-- User name -->
                <span class="username">
                    <i img src="<%=request.getContextPath()%>/resources/img/us2.jpg" alt="gambar usn" title="usn"></i>
                </span>
                <!-- User name Input -->
                <input class="form-input" id="txt-input" type="text" placeholder="username" name="username" required>

                <input class="form-input" id="email-input" type="text" placeholder="email" name="email" required>

                <br>

                <!-- Password -->

                <span class="password">
                    <i img src="<%=request.getContextPath()%>/resources/img/pd2.png" alt="gambar pwd" title="pwd"></i>
                </span>
                <!-- Password Input -->
                <input class="form-input" type="text" placeholder="password" id="pwd" name="password1" required>

                <input class="form-input" type="password" placeholder="confirm password" id="pwd_next" name="password2"
                       required>

                <!-- Show/hide password -->
                <span>
                    <i class="fa fa-eye" aria-hidden="true" type="button" id="eye"></i>
                </span>

            </div>

            <!-- Other buttons -->
            <div class="other">
                <button style="color: white;" type="submit">Sign up</button>
                <!-- End Other the Division -->
            </div>
            <!-- End Container -->
        </div>

        <!-- End Form -->
    </form>
</div>
</body>
</html>