<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="core.db.DBConn"%>
<%@page import="java.sql.Statement"%>
<%
String userName = request.getParameter("userName").trim();

String sql="SELECT * FROM `traindata`  where WHERE `que`='"+userName+"'"
        System.out.println(sql);
    Statement st=DBConn.connect();
  ResultSet rs =  st.executeQuery(sql);
    
    while(rs.next()){
    userName=rs.getString("ans");
    }
//		if(userName == null || "".equals(userName)){
//			userName = "Guest";
//		}
		
		String greetings = "Hello " + userName;
		
		response.setContentType("text/plain");
		response.getWriter().write(greetings);

%>