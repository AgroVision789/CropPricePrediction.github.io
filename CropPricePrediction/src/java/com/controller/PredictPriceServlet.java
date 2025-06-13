package com.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/PredictPrice")
public class PredictPriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String city = request.getParameter("city");
        String crop = request.getParameter("crop");
        String date = request.getParameter("date");
        String model = "rf"; // now using Random Forest

        double predictedPrice = callPythonModelAPI(city, crop, model, date);
        if (predictedPrice == -1) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('Prediction failed. Please check inputs or backend.'); window.history.back();</script>");
        } else {
            response.sendRedirect("finalprediction.jsp?crop=" + crop + "&city=" + city + "&predict=" + predictedPrice + "&fut=" + date);
        }
    }

    private double callPythonModelAPI(String city, String crop, String model, String date) {
        try {
            String apiURL = "http://localhost:5000/predict?model=" + model + "&crop=" + crop + "&city=" + city + "&date=" + date;
            HttpURLConnection conn = (HttpURLConnection) new URL(apiURL).openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) sb.append(line);
            in.close();

            JSONObject json = new JSONObject(sb.toString());
            JSONArray forecast = json.getJSONArray("forecast");
            return forecast.getDouble(0);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
