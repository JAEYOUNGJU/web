<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
<title>공지사항 게시판</title>
</head>
<body>
	<h3>공지사항 리스트</h3>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50><p align=center>번호</p></td>
			<td width=500><p align=center>제목</p></td>
			<td width=100><p align=center>등록일</p></td>
		</tr>

		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
		Statement stmt = conn.createStatement(); //Statement 객체 생성
		//해당 테이블의 id를 역순으로 정렬하고 ResultSet을 통해 쿼리 실행해 결과값 읽어오기
		ResultSet rset = stmt.executeQuery("select * from gongji order by id desc;");
		while (rset.next()) { //한 행씩 반복 처리
			int id = rset.getInt(1); //첫 번째 id 값을 int 형으로 변수 id에 할당
		%>

		<tr>
			<td align=center><%=id%></td>
			<td><a href='gongji_view.jsp?key=<%=id%>'><%=rset.getString(2)%></a></td>
			<!-- 상세보기 페이지로 링크 걸기 -->
			<td align=center><%=rset.getString(3)%></td>
		</tr>
		<%
		} /* while 문 끝 */
		%>
	</table>
	<table>
		<!-- 버튼 표 정의 -->
		<tr>
			<td width=550></td>
			<td><input type=submit onClick=location.href='gongji_insert.jsp' value=신규></td>
		</tr>
	</table>
	<!-- 사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제) -->
	<%
	rset.close();
	stmt.close();
	conn.close();
	%>

</html>
</head>
