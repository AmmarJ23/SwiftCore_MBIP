<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css">
  </head>

  <header
    class="bg-dark text-white text-center py-3 d-flex justify-content-between align-items-center"
    style="background-color: #f96023 !important"
  >
    <div class="container text-end">
      <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-lg text-white">Logout</a>
    </div>
    <div class="mr-1 col-1">
      <span id="usernamePlaceholder">Admin</span>
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
        Dashboard Admin
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
    <div
      class="container shadow rounded-3 p-5 mt-3 mb-5"
      style="height: 500px; width: 70%; background-color: #d7d7d7"
    >
      <!-- Bootstrap Cards -->
      <div class="row">
        <h2 class="text-center mb-4">Form Submission Statistics</h2>
      <table class="table table-bordered table-striped" style="margin: 0px 0px  70px 0px;">
        <thead>
          <tr>
            <th scope="col">Form Submitted</th>
            <th scope="col">Form Validated</th>
            <th scope="col">Form Rejected</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>${totalSubmission[0]}</td>
            <td>${totalSubmission[1]}</td>
            <td>${totalSubmission[2]}</td>
          </tr>
        </tbody>
      </table>
        <!-- Card 1 -->
        <div class="col-md-4 mb-3">
          <a href="${pageContext.request.contextPath}/admin/electricValidation" class="text-decoration-none">
            <div class="card w-100 mx-auto">
              <div class="card-body text-center" style="height: 150px">
                <!-- Adjust the height as needed -->
                <h5 class="card-title">Electricity</h5>
                <i class="bi bi-lightning" style="font-size: 3rem; color: #007BFF;"></i>
              </div>
            </div>
          </a>
        </div>

        <!-- Card 2 -->
        <div class="col-md-4 mb-3">
          <a href="your_target_url_for_card_2" class="text-decoration-none">
            <div class="card w-100 mx-auto">
              <div class="card-body text-center" style="height: 150px">
                <!-- Adjust the height as needed -->
                <h5 class="card-title">Water</h5>
                <i class="bi bi-droplet-fill" style="font-size: 3rem; color: #28A745;"></i>
              </div>
            </div>
          </a>
        </div>

        <!-- Card 3 -->
        <div class="col-md-4 mb-3">
          <a href="your_target_url_for_card_3" class="text-decoration-none">
            <div class="card w-100 mx-auto">
              <div class="card-body text-center" style="height: 150px">
                <!-- Adjust the height as needed -->
                <h5 class="card-title">Recycle</h5>
                <i class="bi bi-trash" style="font-size: 3rem; color: #DC3545;"></i>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>

    <footer
      class="bg-dark text-white text-center py-3"
      style="background-color: #f96023 !important"
    >
      <p>&copy; 2024 Your Company. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
