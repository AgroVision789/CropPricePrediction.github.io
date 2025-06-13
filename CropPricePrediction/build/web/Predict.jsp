<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Price Prediction</title></head>
<body>
    <form method="post" action="PredictPrice">
        <label>Crop:</label>
        <input type="text" name="crop" required /><br>
        <label>City:</label>
        <input type="text" name="city" required /><br>
        <label>Future Date:</label>
        <input type="date" name="date" required /><br>
        <input type="submit" value="Predict Price" />
    </form>
</body>
</html>
