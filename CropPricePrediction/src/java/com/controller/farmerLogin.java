/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import core.db.DBConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class farmerLogin extends HttpServlet {

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
        HttpSession session=request.getSession();
        try {
              String farmermobile=request.getParameter("fmob");
               String farmerpassword=request.getParameter("fpass");
            if(farmermobile.equals("admin") && farmerpassword.equals("admin")){
             out.print("<script type='text/javascript'>alert('Login Successfully');window.open('TrainBot.jsp'); </script>");
            }else{
            String sql="SELECT * FROM `farmerregister` WHERE `fmobile`='"+farmermobile+"' and `fpass`='"+farmerpassword+"'";
            System.out.println("sql"+sql);
            Statement st=DBConn.connect();
            ResultSet rs=st.executeQuery(sql);
            if (rs.next()) {                
                 out.print("<script type='text/javascript'>alert('Login Successfully');window.open('Dashboard/ChatBot.jsp'); </script>");
                 session.setAttribute("farmername", rs.getString("fname"));
                  session.setAttribute("fid", rs.getString("fid"));
            }else{
             out.print("<script type='text/javascript'>alert('Incorrect Login');window.open('login.jsp'); </script>");
            }}
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
