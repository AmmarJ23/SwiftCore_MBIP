<%@ page import="com.model.Water" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formStyle.css" />
    <title>Water Form</title>
</head>

<body>

    <div class="box">
        <img src="${pageContext.request.contextPath}/resources/img/mbip_logo.png" alt="MBIP Logo" width="50" height="50" style="display: block; margin: 0 auto;">
        <p style="color: #43464c;"><b>Iskandar Puteri Low Carbon</b></p>
        <hr>

        <br>
        
        <% 
        Water e = (Water) request.getAttribute("eObj");
        if (e == null) { %>

        <form action="${pageContext.request.contextPath}/water/add">

            <div name="row">

                <div class="container">
                    Water Consumption
                    <input type="text" placeholder="Invoice number" name="invoiceNo">
                    <input type="text" placeholder="Usage value: m^3" name="usage">
                    <input type="hidden" value="${month}" name="month">
                    <button class="upload-button">Click here to upload <br /> your bill's image</button>
                    <button class="form-submit" type="submit">Submit</button>
                </div>
            </div>
        </form>
        
        <% } else { %>

        <form action="${pageContext.request.contextPath}/water/update">

            <div name="row">

                <div class="container">
                    Water Consumption
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