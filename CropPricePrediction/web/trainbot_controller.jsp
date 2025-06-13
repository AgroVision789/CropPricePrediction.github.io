<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="core.db.DBConn"%>
<%@page import="java.sql.Statement"%>
<%
    
try{
//    MultipartRequest multipartRequest = new MultipartRequest(request, request.getServletContext().getRealPath("/"));
//            File file1,file2;
String question_word=request.getParameter("que");
String ans=request.getParameter("ans");
//  System.out.println("path of file:" + request.getServletContext().getRealPath("/"));
//            System.out.println("m  " + request.getServletContext().getRealPath("/") + "/files/");
//     file1 = multipartRequest.getFile("img");
//                   file2 = multipartRequest.getFile("panfile");
//
////            }
//
//            System.out.println("course:" + pannumber);
//            System.out.println("sub_courses:" + adharnumber);
////            System.out.println("menu_name:" + menu_name);
////            System.out.println("menu_price:" + menu_price);
////            System.out.println("menu_desc:" + menu_desc);
//
//            String absolutePath1 = file1.getAbsolutePath();
//             String absolutePath2 = file2.getAbsolutePath();
//           
//            
//            
//            System.out.println("absolutePath:" + absolutePath1);
            
String sql="INSERT INTO `traindata`(`que`, `ans`) VALUES ('"+question_word+"','"+ans+"')";
System.out.println(sql);
// Connection con = DBConn.getConnection();
//PreparedStatement s = con.prepareStatement(sql);//DataConnection.connect1().prepareStatement(insert);
//            s.setString(1, question_word);
//            s.setString(2, ans);
       
        
//            // request.getServletContext().getRealPath("/")+"/files/"+file.getName() - hdd path
////             request.getServletContext().getContext("/").getContextPath()+"/files/"+file.getName() - android path
//            
//            s.executeUpdate();
//System.out.println(sql);
    Statement st=DBConn.connect();
    st.executeUpdate(sql);
    
     out.print("<script type='text/javascript'>alert('Data Train Successfully');window.open('TrainBot.jsp'); </script>");
}catch(Exception ex){

      ex.printStackTrace();
}
%>