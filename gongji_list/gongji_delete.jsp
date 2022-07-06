<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
</head>
<body>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt =conn.createStatement();
	String id = request.getParameter( "key" );

	String sql = "delete from gongji where id= " +id+";";
	stmt.executeUpdate( sql ); 
	
	stmt.close();
	conn.close();
	response.sendRedirect("gongji_list.jsp");//특정페이지로의 이동
%>
</body>
</html>