 <%@page import="core.db.DBConn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%

        String userName = request.getParameter("userName").trim();
try{
String sql="SELECT * FROM `traindata`  WHERE `que` like '%"+userName+"%'";
        System.out.println(sql);
    Statement st=DBConn.connect();
  ResultSet rs =  st.executeQuery(sql);
    
    while(rs.next()){
    userName=rs.getString("ans");
        System.out.println("ccc"+userName);
    }
//		if(userName == null || "".equals(userName)){
//			userName = "Guest";
//		}
		
		String greetings = "Hello " + userName;
		
		response.setContentType("text/plain");
		response.getWriter().write(greetings);
}catch(Exception ex){
ex.printStackTrace();
}
%>