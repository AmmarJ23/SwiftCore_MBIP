<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://fonts.googleapis.com/css?family=Poppins&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Inter&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formStyle.css" />
    
    <title>Document</title>
  </head>

  <body>
    <div class="box">
      <img
        src="${pageContext.request.contextPath}/resources/img/mbip_logo.png"
        alt="MBIP Logo"
        width="50"
        height="50"
        style="display: block; margin: 0 auto"
      />
      <p style="color: #43464c"><b>Iskandar Puteri Low Carbon</b></p>
      <hr />

      <form action="${pageContext.request.contextPath}/electricity/month">
      
      <% String[] monthColour = (String[]) request.getAttribute("monthColour"); 
      %>
      
        <div class="button-container-row ">
          <button class="form-submit  me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="January" style="<%=monthColour[0] %>">January</button>
          <button class="form-submit  me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="February" style="<%=monthColour[1] %>">February</button>
          <button class="form-submit  me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="March" style="<%=monthColour[2] %>">March</button>
        </div>
        
        <br>

        <div class="button-container-row">
          <button class="form-submit me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="April" style="<%=monthColour[3] %>">April</button>
          <button class="form-submit me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="May" style="<%=monthColour[4] %>">May</button>
          <button class="form-submit me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="June" style="<%=monthColour[5] %>">June</button>
        </div>
        
        <div class="mr-3 col-3">
          <a href="${pageContext.request.contextPath}/user/dashboard"  style="margin: 50px auto auto 315px;" class="btn btn-primary btn-lg text-white">Dashboard</a>
        </div>
        
      </form>
    </div>
  </body>
</html>
