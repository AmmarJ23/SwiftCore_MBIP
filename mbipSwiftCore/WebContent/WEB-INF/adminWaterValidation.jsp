<%@ page import="com.model.Water" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Water Form</title>
    <link
      href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css"
      integrity="sha512-xcPP4LWdrQeT5VG2za6YwL1WJ3ro/Jn4jme4hE3LQebhpNOQnW1FfM24b4DmDZ0lFD6QtqenIu+pcCL4kyjp3A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>

  <body class="d-flex flex-column min-vh-100">
    <header
      class="bg-dark text-white text-center py-3 d-flex justify-content-between align-items-center"
      style="background-color: #f96023 !important"
    >
      <div class="mr-1 col-1">
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-primary btn-lg text-white" style="background-color:orange; border:orange">Dashboard</a>
      </div>
      <div class="mr-1 col-1">
        <span id="usernamePlaceholder">Admin</span>
      </div>
    </header>

    <header
      class="bg-dark text-black text-center py-3 d-flex justify-content-between align-items-center"
      style="background-color: white !important"
    >
      <div
        class="container d-flex align-items-center"
        style="margin-left: 50px"
      >
        <img src="${pageContext.request.contextPath}/resources/img/mbip_logo.png" alt="Logo" style="width: 65px" />
        <img
          src="${pageContext.request.contextPath}/resources/img/iskandar-puteri-low-carbon.png"
          alt="LogoTitle"
          style="width: 100px"
        />
        <h1 class="text-center" style="width: 400px; margin: 0 auto">
          Water Form
        </h1>
      </div>
    </header>

    <main class="flex-grow-1 p-4">
      <div class="row">
        <!-- First Card -->
        <div class="col-md-6 mb-3">
          <div class="card">
            <div class="card-body">
              
              <%
			    List<Water> electricityList = (List<Water>)request.getAttribute("waterList");
				%>

              <!-- Table -->
              <table class="table">
                <thead>
                  <tr style ="background-color: #d7d7d7">
                    <th scope="col">Username</th>
                    <th scope="col">Month</th>
                    <th scope="col">Status</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <% 
                    
                    for (com.model.Water electricity : electricityList) { 
                    
                    	String username = electricity.getUsername();
                    	String noInvoice = electricity.getNoInvoice();
                    	Double consumption = electricity.getConsumption();
                    	String month = electricity.getMonth();
                    	String status = electricity.getStatus();
                    	
                    	// Set the color based on the status
				        String statusColor = "";
				        if ("validated".equalsIgnoreCase(status)) {
				            statusColor = "text-success"; // Green color for validated
				        } else if ("rejected".equalsIgnoreCase(status)) {
				            statusColor = "text-danger"; // Red color for rejected
				        }
				    %>
				    <tr onclick="displayUserDetails('<%= username %>', '<%= noInvoice %>', <%= consumption %>, '<%=month%>');">
				        <td><%= electricity.getUsername() %></td>
				        <td><%= electricity.getMonth() %></td>
				        <td class="<%= statusColor %>"><%= electricity.getStatus() %></td>
				    </tr>
			        <% } %>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Second Card -->
        <div  id="userDetailsCard" class="col-md-6 mb-3">
          <div class="card">
            <div class="card-body">
              <div class="row">
                <div class="col-10">
                  <ul class="list-group">
                    <li class="list-group-item active">User Details</li>
                    <li class="list-group-item">Username:</li>
                    <li class="list-group-item">Invoice No:</li>
                    <li class="list-group-item">Usage:</li>
                  </ul>
                </div>
                <div class="col-2">
                  <!-- Hidden anchor with data-lightbox attribute -->
                  <a
                    href="img/bil_elektrik.png"
                    data-lightbox="bill"
                    style="display: none;"
                    id="bill-lightbox-link"
                  ></a>

                  <!-- Actual image with click event to trigger lightbox -->
                  <img
                    src="${pageContext.request.contextPath}/resources/img/syabas.gif"
                    alt="Bill Image"
                    class="img-fluid"
                    style="max-height: 200px; cursor: pointer;"
                    onclick="document.getElementById('bill-lightbox-link').click();"
                  />
                </div>
              </div>
              <div class="mt-3 text-center">
                <!-- Button for Approve/Reject (Centered) -->
                <div class="gap-2">
                  <button
                    type="button"
                    class="btn btn-success"
                    onclick="alert('User details approved!');"
                  >
                    Approve
                  </button>
                  <button
                    type="button"
                    class="btn btn-danger"
                    onclick="alert('User details rejected!');"
                  >
                    Reject
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Lightbox Library -->
      <script
        src="${pageContext.request.contextPath}js/lightbox.min.js"
        integrity="sha512-Pg4Xe3SgHvVJuZJBwh1s+fCeXpxN3BEwtA+pPck3h37OomXj2OvNiV8UcwWE5SP9ozI3fjPh93ZlpBf0TsqbPQ=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
      ></script>
    </main>

    <footer
      class="bg-dark text-white text-center py-3 mt-auto"
      style="background-color: #f96023 !important"
    >
      <p>&copy; 2024 SwiftCore. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
  
<script>
   function displayUserDetails(username, noInvoice, consumption, month) {
      // Update the content of the second card dynamically
      var userDetailsCard = document.getElementById('userDetailsCard');
      userDetailsCard.innerHTML =
          '<div class="card">' +
            '<div class="card-body">' +
              '<div class="row">' +
                '<div class="col-10">' +
                  '<ul class="list-group">' +
                    '<li class="list-group-item active">User Details</li>' +
                    '<li class="list-group-item">Username: ' + username + '</li>' +
                    '<li class="list-group-item">Invoice No: ' +  noInvoice + '</li>' +
                    '<li class="list-group-item">Usage: ' + consumption + ' m3</li>' +
                  '</ul>' +
                '</div>' +
                '<div class="col-2">' +
                  '<a ' +
                    'href="img/bil_elektrik.png" ' +
                    'data-lightbox="bill" ' +
                    'style="display: none;" ' +
                    'id="bill-lightbox-link"' +
                  '></a>' +
                  '<img ' +
                    'src="${pageContext.request.contextPath}/resources/img/syabas.gif" ' +
                    'alt="Bill Image" ' +
                    'class="img-fluid" ' +
                    'style="max-height: 200px; cursor: pointer;" ' +
                    'onclick="document.getElementById(\'bill-lightbox-link\').click();"' +
                  '/>' +
                '</div>' +
              '</div>' +
              '<div class="mt-3 text-center">' +
                '<div class="gap-2">' +
                  '<button ' +
                    'type="button" ' +
                    'class="btn btn-success" ' +
                    'onclick="approveUserDetails(\'' + username + '\', \'' + month + '\');"  ' +
                  '>' +
                    'Approve' +
                  '</button>' +
                  '<button ' +
                    'type="button" ' +
                    'class="btn btn-danger" ' +
                    'onclick="rejectUserDetails(\'' + username + '\', \'' + month + '\');"  ' +
                  '>' +
                    'Reject' +
                  '</button>' +
                '</div>' +
              '</div>' +
            '</div>' +
          '</div>';
   }

   function approveUserDetails(username, month) {
	      // Redirect to the specified URL with parameters
	      var redirectUrl = "${pageContext.request.contextPath}/admin/approveFormWater?username=" + username + "&month=" + month;
	      window.location.href = redirectUrl;
	   }

   function rejectUserDetails(username, month) {
	      // Redirect to the specified URL with parameters
	      var redirectUrl = "${pageContext.request.contextPath}/admin/rejectFormWater?username=" + username + "&month=" + month;
	      window.location.href = redirectUrl;
	   }
</script>


  
</html>
