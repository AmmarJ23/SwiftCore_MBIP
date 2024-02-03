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
        <div class="button-container-row ">
          <button class="form-submit  me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="January" style="width: 130px;">January</button>
          <button class="form-submit  me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="February" style="width: 130px;">February</button>
          <button class="form-submit  me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="March" style="width: 130px;">March</button>
        </div>
        
        <br>

        <div class="button-container-row">
          <button class="form-submit me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="April" style="width: 130px;">April</button>
          <button class="form-submit me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="May" style="width: 130px;">May</button>
          <button class="form-submit me-2 btn btn-primary btn-lg" type="submit" name="selectedMonth" value="June" style="width: 130px;">June</button>
        </div>
      </form>
    </div>
  </body>
</html>
