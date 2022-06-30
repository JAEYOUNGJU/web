<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
<title>리스트</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style>
.table{
	border: 3px solid grey;
   	width: 100%;

}
#container{
	width:100%;
	height: 100%;
	justify-content: center;
    
}
</style>
</head>
<body>
<div id="container">

<div>

<h4>공지사항</h4>

<table table class="table table-hover" cellspacing=1 width=300 border=3>
<tr>
<td width=10><p align=center>번호</p></td>
<td width=300><p align=center>제목</p></td>
<td width=50><p  align=center>조회수</p></td>
<td width=50><p  align=center>등록일</p></td>
</tr>

<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt =conn.createStatement();//Statement 객체 생성

	/* 	ResultSet rset = stmt.executeQuery("select * from gongji_comment order by id desc;"); */
	
	ResultSet rset = stmt.executeQuery("select id, title, click, date from gongji_comment order by id desc, recnt asc;");
	
	while(rset.next()){
		int id = rset.getInt(1);
%>
<tr>
<td align=center><%=id%></td><!-- 번호 -->
<td><a href='comment_view.jsp?key=<%=id%>'><%=rset.getString(2)%></a></td><!-- 제목 -->
<td align=center><%=rset.getString(3) %></td><!-- 조회수 -->
<td align=center><%=rset.getString(4) %></td><!-- 날짜 -->
</tr>
<%
	}
%>
</table><br>
<table>
<tr><td width=700></td><td><input align=right type=submit OnClick=location.href='comment_insert.jsp' value=신규></input></td></tr>
</table>

<table cellspacing=3 cellpadding=20>

<%
rset.close();
stmt.close();
conn.close();
%>

</tr>
</table>
</div>

</body>
</html>
</head>
