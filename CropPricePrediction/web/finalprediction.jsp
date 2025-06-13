<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Prediction Result</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding-top: 50px;
        }
        .box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            width: 60%;
            margin: auto;
        }
        h1 {
            color: #333;
        }
        .price {
            font-size: 24px;
            color: #2E8B57;
        }
    </style>
</head>
<body>

    <%
    String crop = request.getParameter("crop") != null ? request.getParameter("crop") : "N/A";
    String city = request.getParameter("city") != null ? request.getParameter("city") : "N/A";
    String fut = request.getParameter("fut") != null ? request.getParameter("fut") : "N/A";
    String predictedPrice = request.getParameter("predict") != null ? request.getParameter("predict") : "Unavailable";
    %>


    <div class="box">
        <h1>Predicted Price</h1>
        <p>Crop: <strong><%= crop %></strong></p>
        <p>City: <strong><%= city %></strong></p>
        <p>Future Date: <strong><%= fut %></strong></p>
        <p class="price">Expected Modal Price: <strong>Rs. <%= predictedPrice %></strong> per Quintal</p>

        <!-- Forecast chart placeholder -->
        <br>
        <img src="forecast.png" alt="Forecast Graph" width="90%" height="auto">
    </div>

</body>
</html>
