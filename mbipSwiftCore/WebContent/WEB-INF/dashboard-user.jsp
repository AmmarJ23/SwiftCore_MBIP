<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
    <title>Dashboard User</title>
</head>

<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #0085FF;">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Collapsible Navigation Menu -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <!-- <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Link 1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link 2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link 3</a>
                    </li>
                </ul> -->
            </div>

            <!-- Login/Logout Link -->
            <div class="d-flex justify-content-end">
                <a class="nav-link" href="#" style="color: #ffffff;">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container-fluid">
        <!-- Logo and Title (Centered) -->
        <div class="row mt-4">
            <div class="col-md-auto text-left">
                <img src="<%=request.getContextPath()%>/resources/img/mbip_logo.png" alt="Logo" height="50">
            </div>
            <div class="col-md-auto text-center mt-2">
                <h2>Dashboard</h2>
            </div>
        </div>



        <!-- Directory Container -->
        <div class="directory-container">
            <!-- Directory Structure -->
            <div class="directory">
                <span>Home</span> /
                <span>Dashboard</span>
            </div>
        </div>

        <!-- Main Dashboard Card -->
        <div class="row mt-4">
            <div class="col-md-12 mb-5">
                <div class="card">
                    <!-- Clickable Cards in the Same Row -->
                    <div class="row">

                        <!-- Clickable Card 1 -->
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card" style="max-width: 100%;">
                                    <div class="card-body d-flex flex-column align-items-center">
                                        <h5 class="card-title">
                                            <a href="carbon_calculation.html">Carbon Calculation</a></h5>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Clickable Card 2 -->
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card" style="max-width: 100%;">
                                    <div class="card-body d-flex flex-column align-items-center">
                                        <h5 class="card-title">
                                            <a href="carbon_analysis.html">Carbon Analysis</a></h5>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Clickable Cards Row -->

                    <!-- Image Slider -->
                    <div id="imageSlider" class="carousel slide mt-4" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<%=request.getContextPath()%>/resources/img/image1.png" class="d-block mx-auto w-100" alt="Image 1">
                            </div>
                            <div class="carousel-item">
                                <img src="<%=request.getContextPath()%>/resources/img/image2.png" class="d-block mx-auto w-100" alt="Image 2">
                            </div>
                            <!-- Add more carousel items as needed -->
                        </div>
                        <a class="carousel-control-prev" href="#imageSlider" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#imageSlider" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <!-- End Image Slider -->
                </div>
            </div>
        </div>

    </div>

    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>