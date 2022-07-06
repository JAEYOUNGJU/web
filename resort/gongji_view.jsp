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
<style>
  textarea {
  	width:70%;
  	height:70%;
    text-align: left;
    resize: none;
  }
  /* table {
  width:20%;
  } */
</style>
<title>글 보기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
<div>
<br><br>
<p>
<table border=1 width=600 cellspacing=0 cellpadding=1 align=center>
</p>




<tr>
<td width=100 style="text-align:center;"><b>번호</b></td>
<td width=400 colspan=3 align=left><input type='hidden' name="id" value=<%=id%>><%=id%></td>
</tr>

<tr>
<td width=100 style="text-align:center;"><b>제목</b></td>
<td width=400 colspan=3 align=left><input type='hidden' name="title" value=<%=title%>><%=title%></td>
</tr>

<tr>
<td width=100 style="text-align:center;"><b>일자</b></td>
<td width=400 colspan=3 align=left><input type='hidden' name="today" value=<%=today%>><%=today%></td>
</tr>

<tr>
<td width=100 style="text-align:center;"><b>내용</b></td>
	<td><textarea style='width:400px; height:150px; overflow-y:scroll' name=content cols=70 row=600 required value=<%=content%>><%=content%></textarea></td>
<%-- <td width=480 colspan=3 align=left><input type='hidden' name="content" value=<%=content%>><%=content%></td> --%>
</tr>
<%	
rset.close();
stmt.close();
conn.close();
%>

</table>
<table width=600 align=center style="position:relative">

<tr>
		<td width=600></td>
		<td><input type=button value="목록" OnClick="location.href='e_01.jsp'"></td>

</tr>
</table>

</body>
</html>
