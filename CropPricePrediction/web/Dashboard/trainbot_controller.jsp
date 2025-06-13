<%@page import="core.db.DBConn"%>
<%@page import="java.sql.Statement"%>
<%
    
try{
String question_word=request.getParameter("que");
String ans=request.getParameter("");

String sql="INSERT INTO `traindata`(`tid`, `que`, `ans`) VALUES (null,'"+question_word+"','"+ans+"')";
System.out.println(sql);
    Statement st=DBConn.connect();
    st.executeQuery(sql);
}catch(Exception ex){

      ex.printStackTrace();
}
%>