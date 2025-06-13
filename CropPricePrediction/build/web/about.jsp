<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>About Us - Crop Price Prediction</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap / Style -->
    <link rel="stylesheet" href="assets/css/style-starter.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>
<body>

<%@ include file="header.jsp" %>

<!-- Hero Section -->
<section class="w3l-about-breadcrumb text-left">
    <div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
        <div class="container">
            <h2 class="title">About Us</h2>
            <ul class="breadcrumbs-custom-path mt-2">
                <li><a href="index.jsp">Home</a></li>
                <li class="active"><span class="fa fa-arrow-right mx-2" aria-hidden="true"></span> About</li>
            </ul>
        </div>
    </div>
</section>

<!-- About Section -->
<section class="w3l-content-6 py-5">
    <div class="container py-md-4 py-3">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="hny-title mb-3">AgroVision Project Team</h3>
                <p class="mb-4">We are final-year engineering students passionate about building intelligent systems for the agriculture domain. Our project focuses on predicting future crop prices using advanced Machine Learning models to help farmers plan better.</p>

                
                <h4 class="mt-4">Contact Info</h4>
                <p>Email: <a href="mailto:team.agrovision@gmail.com">team.agrovision@gmail.com</a></p>
                <p>Phone: +91 98765 43210</p>

                <a href="index.jsp" class="btn btn-style btn-primary mt-4">← Back to Home</a>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<%@ include file="footer.jsp" %>

<!-- Scripts -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</body>
</html>
