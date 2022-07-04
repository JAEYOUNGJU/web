<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*,java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

	Class.forName("com.mysql.cj.jdbc.Driver"); // 데이터베이스용 jar파일 사용
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	// database에 연결
	Statement stmt = conn.createStatement(); // 연결된 데이터베이스에서 자료 가져오기
	String id = request.getParameter("key");
	int rootid = 0;
	int relevel = 0;
	int recnt = 0;
	ResultSet rset = stmt.executeQuery("select * from gongji_comment where id = '" + id + "';");
	while (rset.next()) {
		rootid = rset.getInt(6);
		relevel = rset.getInt(7) + 1;
		recnt = rset.getInt(8) + 1;
	}
	rset.close(); // 파일 내용 닫기
	stmt.close(); // 파일 닫기
	conn.close(); // 연결 닫기
	%>
	<form method="post" name="fm" action="comment_write.jsp?key=REINSERT">
		<table class="table" width="650" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td width="100"><b>번호</b></td>
				<td>댓글(INSERT)<input type="hidden" name="id" value="INSERT"></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type="text" name="title" size="70" maxlength="70"
					required></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><%=sf.format(nowTime)%></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style='width: 500px; height: 250px; resize: none;'
						name="content" class="contents" cols="70" rows="600" required></textarea></td>
			</tr>
			<tr>
				<td><b>원글</b></td>
				<td><input type="text" name="rootid" value="<%=rootid%>"
					readonly></td>
			</tr>
			<tr>
				<td><b>댓글수준</b></td>
				<td><input type="text" name="relevel" value="<%=relevel%>"
					readonly> <b>댓글내 순서 </b><input type="text"
					value="<%=recnt%>" name="recnt" readonly
					style="width: 50px; border-color: darkblue;"></td>
			</tr>
		</table>
		<div class="float-right">
		<table class="btn" width="650">
			<tr>
				<td width="600"></td>
				<td><input type="button" class="btn btn-dark" value="취소"
					onclick="location.href='comment_list.jsp'"></td>
				<td><input type="submit" class="btn btn-dark" value="쓰기"></td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>