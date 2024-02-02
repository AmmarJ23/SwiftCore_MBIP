<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Dashboard Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>

<body>
    <header class="bg-dark text-white text-center py-3 d-flex justify-content-between align-items-center"
            style="background-color: #41a0ff !important">
        <div class="container"></div>
        <div class="mr-3 col-3">
            <a href="#" class="btn btn-primary btn-lg text-white">Logout</a>
        </div>
    </header>

    <header class="bg-dark text-black text-center py-3 d-flex justify-content-between align-items-center"
            style="background-color: white !important">
        <div class="container d-flex align-items-center" style="margin-left: 50px">
            <img src="img/mbip_logo.png" alt="Logo" style="width: 65px"/>
            <img src="img/iskandar-puteri-low-carbon.png" alt="LogoTitle" style="width: 100px"/>
            <h1 class="text-center" style="width: 400px; margin: 0 auto">Dashboard Admin</h1>
        </div>
    </header>

    <div class="directory-container p-3" style="background-color: #d7d7d7; margin-left: 150px; margin-right: 150px">
        <div class="directory">
            <span>Home</span> /
            <span>Dashboard</span>
        </div>
    </div>

    <!-- Main Content Container with Shadow -->
    <div class="container shadow rounded-3 p-5 mt-3" style="height: 400px; width: 70%; background-color: #d7d7d7">
        <!-- Bootstrap Cards -->
        <div class="row">
            <!-- Card 1 -->
            <div class="col-md-6 mb-3">
                <a href="your_target_url_for_card_1" class="text-decoration-none">
                    <div class="card w-50 mx-auto">
                        <div class="card-body text-center" style="height: 150px">
                            <!-- Adjust the height as needed -->
                            <h5 class="card-title">Carbon Calculation</h5>
                        </div>
                    </div>
                </a>
            </div>
            <!-- Card 2 -->
            <div class="col-md-6 mb-3">
                <a href="your_target_url_for_card_2" class="text-decoration-none">
                    <div class="card w-50 mx-auto">
                        <div class="card-body text-center" style="height: 150px">
                            <!-- Adjust the height as needed -->
                            <h5 class="card-title">Carbon Analysis</h5>
                        </div>
                    </div>
                </a>
            </div>
            <!-- Card 1 -->
            <div class="col-md-6 mb-3">
                <a href="your_target_url_for_card_1" class="text-decoration-none">
                    <div class="card w-50 mx-auto">
                        <div class="card-body text-center" style="height: 150px">
                            <!-- Adjust the height as needed -->
                            <h5 class="card-title">Project Progress</h5>
                        </div>
                    </div>
                </a>
            </div>
            <!-- Card 2 -->
            <div class="col-md-6 mb-3">
                <a href="your_target_url_for_card_2" class="text-decoration-none">
                    <div class="card w-50 mx-auto">
                        <div class="card-body text-center" style="height: 150px">
                            <!-- Adjust the height as needed -->
                            <h5 class="card-title">Form Submission</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 fixed-bottom">
        <p>&copy; 2024 Your Company. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
