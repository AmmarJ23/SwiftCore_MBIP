<%@ page import="com.model.Electricity" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formStyle.css" />
    <title>Document</title>
</head>

<body>

    <div class="box">
        <img src="${pageContext.request.contextPath}/resources/img/mbip_logo.png" alt="MBIP Logo" width="50" height="50" style="display: block; margin: 0 auto;">
        <p style="color: #43464c;"><b>Iskandar Puteri Low Carbon</b></p>
        <hr>

        <br>
        
        <% 
        Electricity e = (Electricity) request.getAttribute("eObj");
        if (e == null) { %>

        <form action="${pageContext.request.contextPath}/electricity/add">

            <div name="row">

                <div class="container">
                    Electricity Consumption
                    
                    <label for="invoiceNo" class="col-sm-2 col-form-label">Invoice Number: </label>
                    <input type="text" placeholder="Invoice number" name="invoiceNo">
                    
                    <label for="usage" class="col-sm-2 col-form-label">Usage: </label>
                    <input type="text" placeholder="Usage value: kg" name="usage">
                    
                    <input type="hidden" value="${month}" name="month">
                    <button class="upload-button">Click here to upload <br /> your bill's image</button>
                    <button class="form-submit" type="submit">Submit</button>
                </div>
            </div>
        </form>
        
        <% } else { %>
        
        <br>

        <form action="${pageContext.request.contextPath}/electricity/update">


                <div class="container">
                    Electricity Consumption </br>
                    <label for="invoiceNo" class="col-sm-2 col-form-label">Invoice Number: </label> 
                    <input type="text"  name="invoiceNo" value="<%= e.getNoInvoice() %>"> </br>
                    
                    <label for="usage" class="col-sm-2 col-form-label">Usage: </label>
                    <input type="text"  name="usage" value="<%= e.getConsumption() %>"> </br>
                    
                    <input type="hidden" value="${month}" name="month">
                    <button class="upload-button">Click here to upload <br /> your bill's image</button>
                    <button class="form-submit" type="submit">Submit</button>
                </div>
        </form>
        
        <% } %>

    </div>

</body>

</html>