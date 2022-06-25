<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
</head>
<body>
<%

try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt =conn.createStatement();
	String id_gongji = request.getParameter( "key" );

	String sql = "delete from gongji where id= " +id_gongji+";";
	stmt.execute( sql ); 
	

%>
	<table cellspacing = 1 width = 600 border = 1>
	<tr>
	<td><input type=button onClick=location.href='gongji_list.jsp' value="확인"></input></td>
	</tr>
	</table>
	

<%
	stmt.close();
	conn.close();
} catch(Exception e) {
 	out.println("오류 페이지");
            
 }  
%>
</body>
</html>