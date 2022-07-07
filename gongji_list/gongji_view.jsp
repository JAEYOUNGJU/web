<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.util.Calendar"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
Statement stmt = conn.createStatement(); //객체생성
String id_gongji = request.getParameter("key");//key에 해당하는 데이터를 가져와 변수 id_gongji에 문자열로 할당
//변수 선언과 초기화(저장하는 공간을 확보하겠다는 것)
Integer id = 0;
String title = "", today = "", content = "";
id = Integer.parseInt(id_gongji); //위에서 key값을 저장한 string id_gongji를 int형으로 변환하여 id에 값 저장

request.setCharacterEncoding("UTF-8"); // 한글 처리
//해당 테이블의 id를 ResultSet을 통해 쿼리 실행해 값 읽어오기
ResultSet rset = stmt.executeQuery("select * from gongji where id = " + id + ";");
while (rset.next()) {//한 행씩 반복 처리
	title = rset.getString(2); //제목
	today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); //날짜
	content = rset.getString(4); //내용
} ;

%>

<html>
<head>
<title>글 보기</title>
<SCRIPT LANGUAGE="JavaScript">//html로 작성한 form의 submit 을 자바 스크립트로 전송
	function submitForm(mode) { //submitForm 함수
		if (mode == 'write') {
			fm.action = "gongji_write.jsp";// mode가 white일 때 요청을 보낼 url
		} else if (mode == "delete") {
			fm.action = "gongji_delete.jsp";//delete일 때 요청을 보낼 url
		}
		fm.submit(); //form 전송
	}
</SCRIPT>
</head>
<body>

	<table border=1 cellspacing=0 cellpadding=5>
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
			<td><b>내용</b></td>
			<td><textarea
					style='width: 500px; height: 250px; overflow-y: scroll'
					name=content cols=70 row=600 required value=<%=content%>><%=content%></textarea></td>
		</tr>
		<!-- 사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제) -->
		<%
		rset.close();
		stmt.close();
		conn.close();
		%>

	</table>
	<table width=540>
		<tr>
			<td width=500></td>
			<td><input type=button value="목록"
				onClick=location.href='gongji_list.jsp'></td>
			<td><input type=button value="수정"
				OnClick="location.href='gongji_update.jsp?key=<%=id%>'"></td>
			<td><input type=button value="삭제"
				OnClick="location.href='gongji_delete.jsp?key=<%=id%>'"></td>
		</tr>
	</table>

</body>
</html>
