<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>s
<title>글 수정</title>
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
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new java.util.Date());
%>

<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //객체생성
	String id_gongji = request.getParameter("key");
	ResultSet rset = stmt.executeQuery("select * from gongji where id='"+id_gongji+"';");
	
	rset.next();
	int id = rset.getInt(1);
	String title = rset.getString(2);
	String content = rset.getString(4);
	rset.close();
	stmt.close();
	conn.close();
	
%>

<body>

<FORM METHOD=POST action='gongji_write.jsp?key=update&id=<%=id%>'>
<table width=650 border=1 cellspacing=0 cellpadding=5>
<tr>
		<td><b>번호</b></td>
		<td><%=id%></td>
</tr>
<tr>
		<td><b>제목</b></td>
		<td><input type=text name=title size=70 maxlength=70 value=<%=title%>></td>
</tr>
<tr>
		<td><b>일자</b></td>
		<td><%=today%></td>
</tr>
<tr>
		<td><b>내용</b></td>
		<td><textarea style='width:500px; height:250px;' name=content cols=70 row=600><%=content%></textarea></td>
</tr>
</table>
<table width=650>
<tr>
		<td width=600></td>
		<td><input type=button value="취소" OnClick="location.href='gongji_list.jsp'"></td>
		<td><input type=button value="쓰기" OnClick="location.href='gongji_write.jsp?id=<%=id%>'"></td>
		<td><input type=button value="삭제" OnClick="location.href='gongji_delete.jsp?id=<%=id%>'"></td>
</tr>
</table>
</FORM>
</body>
</html>
