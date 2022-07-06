<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import = "java.util.Calendar" %>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //객체생성
	String id_gongji = request.getParameter("key");
	
	Integer id = 0;
	String title="", today="", content="";
	id = Integer.parseInt(id_gongji);
	
	ResultSet rset = stmt.executeQuery("select * from gongji where id = " +id+ ";");
	

	while (rset.next()) {

		title = rset.getString(2); //제목
		today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		content = rset.getString(4);
	};
	
	

		/*  Integer id_comment = rset.getInt(1);*///번호

	
%>

<html>
<head>
<title>글 보기</title>
<SCRIPT LANGUAGE="JavaScript">

function submitForm(mode){
	if(mode == 'write'){
		fm.action = "gongji_write.jsp";
	}else if(mode == "delete") {
		fm.action = "gongji_delete.jsp";
	}
	fm.submit();
}

</SCRIPT>
</head>
<body>

<table  border=1 cellspacing=0 cellpadding=5>

<tr>
<td><b>번호</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="id" value=<%=id%>><%=id%></td>
</tr>

<tr>
<td><b>제목</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="title" value=<%=title%>><%=title%></td>
</tr>

<tr>
<td><b>일자</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="today" value=<%=today%>><%=today%></td>
</tr>

<tr>
<td><b>내용</b></td>
	<td><textarea style='width:500px; height:250px; overflow-y:scroll' name=content cols=70 row=600 required value=<%=content%>><%=content%></textarea></td>
<%-- <td width=480 colspan=3 align=left><input type='hidden' name="content" value=<%=content%>><%=content%></td> --%>
</tr>
<%	
rset.close();
stmt.close();
conn.close();
%>

</table>
<table width=540>

<tr>
		<td width=500></td>
		<td><input type=button value="목록" OnClick="location.href='e_01.jsp'"></td>
		<td><input type=button value="수정" OnClick="location.href='gongji_update.jsp?key=<%=id%>'"></td>
		<td><input type=button value="삭제" OnClick="location.href='gongji_delete.jsp?key=<%=id%>'"></td>
</tr>
</table>

</body>
</html>
