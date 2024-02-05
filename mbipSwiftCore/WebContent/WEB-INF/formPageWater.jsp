<%@ page import="com.model.Water" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
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
                    Water Consumption </br>
                    
                    <label for="invoiceNo" class="col-sm-2 col-form-label">Invoice Number: </label>
                    <input type="text" placeholder="Invoice number" name="invoiceNo">
                    
                    <label for="usage" class="col-sm-2 col-form-label">Usage: </label>
                    <input type="text" placeholder="Usage value: m^3" name="usage">
                    
                    <input type="hidden" value="${month}" name="month">
                    
                    <label for="error" class="col-sm-2 col-form-label" style="color: red;"> ${errorMsg} </label>
                    
                    <label for="usage" class="col-sm-2 col-form-label">Bill Image: </label>
					<input type="file" name="billImg">
                    <button class="form-submit" type="submit">Submit</button>
                </div>
            </div>
        </form>
        
        <% } else { %>
        
        <br>

        <form action="${pageContext.request.contextPath}/water/update">


                <div class="container">
                    Water Consumption </br>
                    <label for="invoiceNo" class="col-sm-2 col-form-label">Invoice Number: </label> 
                    <input type="text"  name="invoiceNo" value="<%= e.getNoInvoice() %>" required> </br>
                    
                    <label for="usage" class="col-sm-2 col-form-label">Usage: </label>
                    <input type="text"  name="usage" value="<%= e.getConsumption() %>" required> </br>
                    
                    <input type="hidden" value="${month}" name="month">
                    
                    <label for="error" class="col-sm-2 col-form-label" style="color: red;"> ${errorMsg} </label>
                    
					<label for="usage" class="col-sm-2 col-form-label">Bill Image: </label>
					<input type="file" name="billImg">
                    <button class="form-submit" type="submit">Update</button>
                </div>
        </form>
        
        <% } %>

    </div>

</body>

</html>