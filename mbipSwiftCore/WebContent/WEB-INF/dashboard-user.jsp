<%@ page import="com.model.Electricity" %>
<%@ page import="com.model.Water" %>
<%@ page import="com.model.Recycle" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
    <link
      href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>

  <header
    class="bg-dark text-white text-center py-3 d-flex justify-content-between align-items-center"
    style="background-color: #41a0ff !important"
  >
    <div class="container text-end">
      <a href="#" class="btn btn-primary btn-lg text-white">Logout</a>
    </div>
    
    
    <div class="mr-1 col-1">
    <span>${sessionScope.username}</span>
    </div>
  </header>

  <header
    class="bg-dark text-black text-center py-3 d-flex justify-content-between align-items-center"
    style="background-color: white !important"
  >
    <div class="container d-flex align-items-center" style="margin-left: 50px">
      <img src="${pageContext.request.contextPath}/resources/img/mbip_logo.png" alt="Logo" style="width: 65px" />
      <img
        src="${pageContext.request.contextPath}/resources/img/iskandar-puteri-low-carbon.png"
        alt="LogoTitle"
        style="width: 100px"
      />
      <h1 class="text-center" style="width: 400px; margin: 0 auto">
        Dashboard User
      </h1>
    </div>
  </header>

  <div
    class="directory-container p-3"
    style="background-color: #d7d7d7; margin-left: 150px; margin-right: 150px"
  >
    <div class="directory">
      <span>Home</span> /
      <span>Dashboard</span>
    </div>
  </div>

  <body>
    <!-- Main Content Container with Shadow -->
    <div class="container shadow rounded-3 p-5 mt-3 mb-5" style="height: 100%; width: 70%; background-color: #d7d7d7">
      <!-- Bootstrap Cards -->
      <div class="text-center mt-3">
        <h2>Total Carbon Emission by Month</h2>
        
        
		<%
		    // Use a for loop to iterate over the range
		    String [] monthList = {"January", "February", "March", "April", "May", "June"};
			Electricity[] monthCarbonElectric = (Electricity[]) request.getAttribute("monthCarbonElectric");
		    for (int i = 0; i <= 5; i++) {
		%>
		
		<!-- Emission Card -->
        <div class="card mt-3">
          <div class="card-header">
            <h5><%=monthList[i] %></h5>
          </div>
          <div class="card-body">
          	<p>Total Electric Carbon Emission:
                <%
                    if (monthCarbonElectric[i] == null) {
                %>
                    Not Submitted
                <%
                    } else {
                        String status = monthCarbonElectric[i].getStatus();
                        if (status != null) {
                            if ("validated".equals(status)) {
                %>
                                <%= monthCarbonElectric[i].getCarbonFootprint() %> kg
                <%
                            } else if ("submitted".equals(status)) {
                %>
                                Waiting for validation
                <%
                            } else {
                %>
                               <span style="color: red;" >Form Submission Rejected: Please Check Details Again</span> 
                <%
                            }
                        } else {
                %>
                            Not Submitted
                <%
                        }
                    }
                %>
            </p>
          	<p>Total Water Carbon Emission: 100 kg</p>
          	<p>Total Recycle Carbon Emission: 100 kg</p>
            <p>Total Carbon Emission: 100 kg</p>
            
          </div>
          
        </div>
		
		
		
		<%
		    }
		%>
      </div>
      <div class="text-center mt-3">
      
      <form action="${pageContext.request.contextPath}/user/formPage">
      
      <button
          class="btn btn-light btn-sm border border-dark w-25 mx-auto py-4"  >
          Fill in form
        </button>
      
      </form>
      
        
      </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 fixed-bottom">
      <p>&copy; 2024 Your Company. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
