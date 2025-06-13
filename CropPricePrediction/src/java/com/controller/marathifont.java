/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import core.db.DBConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class marathifont extends HttpServlet {

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
      
         PrintWriter out = response.getWriter();

        // Get the Marathi word from the request parameter
    
        try {
//                
        } catch (Exception e) {
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
        String marathiWord = request.getParameter("marathiWord");
        String question_word=request.getParameter("que");
String ans=request.getParameter("ans");
        System.out.println("ans"+marathiWord);
//                System.out.println("mmm"+marathiWord);
String sql="INSERT INTO `traindata`(`que`, `ans`) VALUES ('"+question_word+"','सैल, चांगली वातानुकूलित माती असलेले चांगले निचरा होणारे शेत निवडा. बटाटे तटस्थ माती पीएचपेक्षा किंचित आम्लयुक्त असतात. विविधता निवड: तुमच्या प्रदेशातील हवामान आणि बाजारपेठेच्या मागणीनुसार बटाट्याच्या जाती निवडा. रसेट, लाल, पांढरा आणि फिंगरलिंग वाणांसह बटाट्याचे विविध प्रकार आहेत.')";
                System.out.println("sql"+sql);
// Connection con = DBConn.getConnection();
//PreparedStatement s = con.prepareStatement(sql);//DataConnection.connect1().prepareStatement(insert);
//            s.setString(1, question_word);
//            s.setString(2, ans);
       
        
//            // request.getServletContext().getRealPath("/")+"/files/"+file.getName() - hdd path
////             request.getServletContext().getContext("/").getContextPath()+"/files/"+file.getName() - android path
//            
//            s.executeUpdate();
//System.out.println(sql);
    Statement st;
        try {
            st = DBConn.connect();
               st.executeUpdate(sql);
        } catch (Exception ex) {
            Logger.getLogger(marathifont.class.getName()).log(Level.SEVERE, null, ex);
        }
 
                  response.getWriter().println("<!DOCTYPE html>");
        response.getWriter().println("<html lang=\"en\">");
        response.getWriter().println("<head>");
        response.getWriter().println("<meta charset=\"UTF-8\">");
        response.getWriter().println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        response.getWriter().println("<title>Marathi Servlet Response</title>");
        response.getWriter().println("</head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h2>Marathi Word Received <p>मैं कंप्यूटर भाषा सीख रहा हूँ</p>"+sql+"</h2>");
        response.getWriter().println("<p>Received Marathi Word: <s/");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
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
