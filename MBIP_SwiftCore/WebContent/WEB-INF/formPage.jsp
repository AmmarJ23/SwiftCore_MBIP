<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="./css/formStyle.css" />
  <title>Document</title>
</head>

<body>
    <div class="box" style="text-align: center; padding: 20px; border: 1px solid #ccc; width: 70%; height: 70%; margin: 50px auto;">
      <img src="./img/mbip_logo.png" alt="MBIP Logo" width="50" height="50" style="display: block; margin: 0 auto" />
      <p style="color: #43464c"><b>Iskandar Puteri Low Carbon</b></p>
      <hr />
  
      <br />
  
      <div style="display: flex; justify-content: space-between; margin-top: 20px;">
  
        <!-- Form for Electricity Consumption -->
        <a href="monthSelectElectric.jsp" style="text-decoration: none; color: inherit; width: 30%; height: 100px;">
          <form action="monthSelectElectric.jsp" method="post" style="width: 100%; height: 100%;">
            <div class="container" style="height: 100%; display: flex; align-items: center; justify-content: center;">
              Electricity Consumption </br>
            </div>
            <br />
          </form>
        </a>
  
        <!-- Form for Water Consumption -->
        <a href="monthSelectWater.jsp" style="text-decoration: none; color: inherit; width: 30%; height: 100px;">
          <form action="monthSelectWater.jsp" method="post" style="width: 100%; height: 100%;">
            <div class="container" style="height: 100%; display: flex; align-items: center; justify-content: center;">
              Water Consumption </br>
            </div>
            <br />
          </form>
        </a>
  
        <!-- Form for Recycle Activity -->
        <a href="monthSelectRecycleActivity.jsp" style="text-decoration: none; color: inherit; width: 30%; height: 100px;">
          <form action="monthSelectRecycleActivity.jsp" method="post" style="width: 100%; height: 100%;">
            <div class="container" style="height: 100%; display: flex; align-items: center; justify-content: center;">
              Recycle Activity </br>
            </div>
            <br />
          </form>
        </a>
      </div>
    </div>
</body>
</html>
