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

public class FarmerRegister extends HttpServlet {

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
           
        try {
            Statement st=DBConn.connect();
            String farmername=request.getParameter("fname");
            String farmermobile=request.getParameter("fmob");
            String farmeraddress=request.getParameter("faddress");
            String farmerpassword=request.getParameter("fpass");
            
            String check="SELECT `fid` FROM `farmerregister` WHERE `fmobile`='"+farmermobile+"'";
            
            ResultSet rs=st.executeQuery(check);
            if(rs.next()){
             out.print("<script type='text/javascript'>alert('Already Exist Successfully');window.open('login.jsp'); </script>");
            }else{
            
             String sql="INSERT INTO `farmerregister`(`fid`, `fname`, `fmobile`, `fpass`, `faddress`) VALUES (null,'"+farmername+"','"+farmermobile+"','"+farmerpassword+"','"+farmeraddress+"')";
            System.out.println("sql"+sql);
           
            int insert=st.executeUpdate(sql);
            System.out.println("id"+insert);
            if(insert==1){
            out.print("<script type='text/javascript'>alert('Inserted Successfully');window.open('login.jsp'); </script>");
//            response.sendRedirect("login.jsp");
            }else{
                 out.print("register not done");
            }
            
            }
            
            
            
           
            
        } catch (Exception e) {
            e.printStackTrace();
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
