<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //객체생성
	String id_gongji = request.getParameter("key");
	ResultSet rset = stmt.executeQuery("select * from gongji where id='"+id_gongji+"';");
%>


<html>
<head>
<title>글 보기</title>
<SCRIPT LANGUAGE="JavaScript">

function submitForm(mode){
	if(mode == 'write'){
		fm.sction = "gongji_write.jsp";
	}else if(mode == "delete"){
		fm.action = "gongji_delete.jsp";
	}
	fm.submit();
}

</SCRIPT>
</head>
<body>

<FORM METHOD=POST name='fm'>
<table  border=1 cellspacing=0 cellpadding=5>



<%	
	while(rset.next()){
		out.println("<tr>");
		out.println("<td><b>번호</b></td><td width=500><p align=center>"+rset.getInt(1)+"</p></td></tr>");
		out.println("<tr><td><b>제목</b></td><td width=500><p align=center>"+rset.getString(2)+"</p></td></tr>");
		out.println("<tr><td><b>일자</b></td><td width=500><p align=center>"+rset.getString(3)+"</p></td>");
		out.println("<tr><td><b>내용</b></td><td width=500><p align=center>"+rset.getString(4)+"</p></td>");
		out.println("</tr>");
	}
	
rset.close();
stmt.close();
conn.close();
%>
</table>
<table width=560>
<tr>
		<td width=500></td>
		<td><input type=button value="목록" OnClick="location.href='gongji_list.jsp'"></td>
		<td><input type=button value="수정" OnClick="location.href='gongji_update.jsp?key=1'"></td>
</tr>
</table>
</FORM>

</body>
</html>
