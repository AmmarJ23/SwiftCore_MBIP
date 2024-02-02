<%@ page import="com.model.Electricity" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
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
                    <input type="text" placeholder="Invoice number" name="invoiceNo">
                    <input type="text" placeholder="Usage value: kg" name="usage">
                    <input type="hidden" value="${month}" name="month">
                    <button class="upload-button">Click here to upload <br /> your bill's image</button>
                    <button class="form-submit" type="submit">Submit</button>
                </div>
            </div>
        </form>
        
        <% } else { %>

        <form action="${pageContext.request.contextPath}/electricity/update">

            <div name="row">

                <div class="container">
                    Electricity Consumption
                    <input type="text"  name="invoiceNo" value="<%= e.getNoInvoice() %>">
                    <input type="text"  name="usage" value="<%= e.getConsumption() %>">
                    <input type="hidden" value="${month}" name="month">
                    <button class="upload-button">Click here to upload <br /> your bill's image</button>
                    <button class="form-submit" type="submit">Submit</button>
                </div>
            </div>
        </form>
        
        <% } %>

    </div>

</body>

</html>