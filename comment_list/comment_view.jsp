<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.util.Calendar"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
Statement stmt = conn.createStatement(); //객체생성
String id = request.getParameter("key");
int viewcnt = 0;

ResultSet rset2 = stmt.executeQuery("select * from gongji_comment where id = '" + id + "';"); //리스트의 해당 번호를 택하면 

while (rset2.next()) {
	viewcnt = rset2.getInt(3) + 1;
}
rset2.close();

stmt.executeUpdate("update gongji_comment set viewcnt = " + viewcnt + " where id = '" + id + "';");

ResultSet rset = stmt.executeQuery("select * from gongji_comment where id = " + id + ";");
rset.next();

Integer id_comment = rset.getInt(1);//번호
String title = rset.getString(2); //제목
/* viewcnt = rset.getInt(3); //조회수 */
String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
String content = rset.getString(5); //내용
int rootid = rset.getInt(6); //원글
int relevel = rset.getInt(7); //댓글수준
int recnt = rset.getInt(8); //댓글 내 순서
rset.close();
%>

<html>
<style>
/* input[type=number], select {
  width: 20px;
   color: black;
  padding: 2px;
  border: 1px solid #ccc;
} */
</style>
<head>
<title>글 보기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<SCRIPT LANGUAGE="JavaScript">
	function submitForm(mode) {
		if (mode == 'write') {
			fm.action = "comment_write.jsp";
		} else if (mode == "delete") {
			fm.action = "comment_delete.jsp";
		} 
		fm.submit();
	}
</SCRIPT>
</head>
<body>

	<table class="table" border=1 cellspacing=0 cellpadding=5>

		<tr>
			<td><b>번호</b></td>
			<td width=480 colspan=3 align=left><input type='hidden'
				name="id" value=<%=id%>><%=id%></td>
		</tr>

		<tr>
			<td><b>제목</b></td>
			<td width=480 colspan=3 align=left><input type='hidden'
				name="title" value=<%=title%>><%=title%></td>
		</tr>

		<tr>
			<td><b>일자</b></td>
			<td width=480 colspan=3 align=left><input type='hidden'
				name="today" value=<%=today%>><%=today%></td>
		</tr>

		<tr>
			<td><b>조회수</b></td>
			<td width=480 colspan=3 align=left><input type='hidden'
				name="click" value=<%=viewcnt%>><%=viewcnt%></td>
		</tr>

		<tr>
			<td><b>내용</b></td>
			<td width=480 colspan=3 align=left><input type='hidden'
				name="click" value=<%=content%>><%=content%></td>
		</tr>

		<tr>
			<td><b>원글</b></td>
			<td width=480 colspan=3 align=left><input type='hidden'
				name="click" value=<%=rootid%>><%=rootid%></td>
		</tr>

		<tr>
			<td><b>댓글수준</b></td>
			<td width=480 colspan=3 align=left><input type='hidden'
				name="click" value=<%=relevel%>><%=relevel%>
				<center>
					댓글내 순서<input type='number' name="recnt" maxlength="1" value=<%=recnt%> readonly style='font-size: 9pt; width: 2px margin:3px; padding: 2px; border: 1px solid #ccc;'>
				</center></td>
		</tr>


		<%
		rset.close();
		stmt.close();
		conn.close();
		%>

	</table>
	<div class="float-right">

		<table class="btn" width=540>

			<tr>
				<td width=500></td>
				<td><input type=button class="btn btn-dark" value="목록"
					OnClick="location.href='comment_list.jsp'"></td>
				<td><input type=button class="btn btn-dark" value="수정"
					OnClick="location.href='comment_update.jsp?key=<%=id%>'"></td>
				<td><input type=button class="btn btn-dark" value="삭제"
					OnClick="location.href='comment_delete.jsp?key=<%=id%>'"></td>
				<td><input type=button class="btn btn-dark" value="댓글"
					OnClick="location.href='comment_reinsert.jsp?key=<%=id%>'"></td>
			</tr>
		</table>
	</div>
</body>
</html>
