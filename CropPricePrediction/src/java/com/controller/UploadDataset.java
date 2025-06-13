/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


@MultipartConfig
public class UploadDataset extends HttpServlet {
   Date parsedDate;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
        String fileName = filePart.getSubmittedFileName();
        File file = new File(getServletContext().getRealPath("/") + fileName);

        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(file)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
                System.out.println(""+bytesRead);
            }
            processCSV(file);
            response.getWriter().println("File uploaded and data inserted successfully.");
        } catch (Exception e) {
            response.getWriter().println("File upload failed: " + e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
      
    }
private void processCSV(File file) {
    String driver = "com.mysql.jdbc.Driver";
    String jdbcURL = "jdbc:mysql://localhost:3306/croppriceprediction?useSSL=false&serverTimezone=UTC";
    String dbUser = "root";
    String dbPassword = "";
    String sql = "INSERT INTO price_dataset (`district`, `city`, `crop`, `max_price`, `modal_price`, `arrival_date`, `temp`, `humidity`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    try {
        Class.forName(driver);
        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement(sql);
             BufferedReader br = new BufferedReader(new FileReader(file))) {

            String line;
            br.readLine(); // Skip header
            while ((line = br.readLine()) != null) {
                String[] values = line.split(",");
                if (values.length < 8) continue; // Skip incomplete rows

                stmt.setString(1, values[0]); // district
                stmt.setString(2, values[1]); // city
                stmt.setString(3, values[2]); // crop
                stmt.setString(4, values[3]); // max_price
                stmt.setString(5, values[4]); // modal_price
                SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MMM-yy");
                SimpleDateFormat mysqlFormat = new SimpleDateFormat("yyyy-MM-dd");
                String arrivalDate = mysqlFormat.format(inputFormat.parse(values[5].trim()));
                stmt.setString(6, arrivalDate);

                //stmt.setString(6, values[5]); // arrival_date as text
                stmt.setString(7, values[6]); // temp
                stmt.setString(8, values[7]); // humidity

                stmt.executeUpdate();
            }

        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
