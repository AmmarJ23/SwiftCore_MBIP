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
        <div class="button-container-row">
          <button class="form-submit" type="submit" name="selectedMonth" value="January">January</button>
          <button class="form-submit" type="submit" name="selectedMonth" value="February">February</button>
          <button class="form-submit" type="submit" name="selectedMonth" value="March">March</button>
        </div>

        <div class="button-container-row">
          <button class="form-submit" type="submit" name="selectedMonth" value="April">April</button>
          <button class="form-submit" type="submit" name="selectedMonth" value="May">May</button>
          <button class="form-submit" type="submit" name="selectedMonth" value="June">June</button>
        </div>
      </form>
    </div>
  </body>
</html>
