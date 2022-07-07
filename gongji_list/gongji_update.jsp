<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<%@ page import="java.util.Calendar"%>
<html>
<head>
<title>글 수정</title>
<style type="text/css">
textarea { /* textarea 요소에 스타일 적용 */
	width: 100%;
	text-align: left;
	resize: none; /* textarea 크기 고정 */
}
</style>
<SCRIPT LANGUAGE="JavaScript">//html로 작성한 form의 submit 을 자바 스크립트로 전송
	function submitForm() {
		fm.action = "gongji_write.jsp?key=UPDATE";//요청을 보낼 url, key=UPDAT
		fm.submit();
	}
	//유효성 검사: 특수문자 입력 제한 (제목)
	function characterCheck(obj) {
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		if (regExp.test(obj.value)) {
			alert("특수문자는 입력하실 수 없으셔요.");
			obj.value = obj.value.substring(0, obj.value.length - 1); // 입력한 특수문자 한자리 지움
		}
	}
</SCRIPT>
</head>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
Statement stmt = conn.createStatement(); //객체생성
String id_gongji = request.getParameter("key");//key에 해당하는 데이터를 가져와 변수 id_gongji에 문자열로 할당
//해당 테이블의 id를 ResultSet을 통해 쿼리 실행해 값 읽어오기
ResultSet rset = stmt.executeQuery("select * from gongji where id='" + id_gongji + "';");

request.setCharacterEncoding("UTF-8"); // 한글 처리
String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

while(rset.next()) {
int id = rset.getInt(1);
String title = rset.getString(2);
String content = rset.getString(4);

%>
<FORM METHOD=POST name='fm'>
	<table width=650 border=1 cellspacing=0 cellpadding=5>
		<tr>
			<td><b>번호</b></td>
			<td><%=id%><input type=hidden name=id value=<%=id%>></td>
			<!--hidden 은 사용자가 변경해선 안되는 데이터를 보낼 때 사용-->
		</tr>
		<tr>
			<td><b>제목</b></td>
			<td><input type=text name=title size=70 maxlength=70
				value=<%=title%> onkeyup="characterCheck(this)"
				onkeydown="characterCheck(this)" required></td>
		</tr>
		<tr>
			<td><b>일자</b></td>
			<td><%=today%></td>
		</tr>
		<tr>
			<td><b>내용</b></td>
			<td><textarea
					style='width: 500px; height: 250px; overflow-y: scroll'
					name=content cols=70 row=600 required><%=content%></textarea></td>
		</tr>
	</table>
 	<!-- 버튼 표 정의 -->
	<table width=650>
		<tr>
			<td width=600></td>
			<td><input type=button value="취소" onClick=location.href='gongji_list.jsp'></td>
			<td><input type=button value="쓰기" onClick="submitForm()"></td>
			<td><input type=button value="삭제" onClick="location.href='gongji_delete.jsp?key=<%=id%>'"></td>
		</tr>
	</table>
	<%
	} /* while 문 끝 */
	%>
</FORM>
<%
rset.close();
stmt.close();
conn.close();
%>
</body>
</html>
