<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.util.Calendar"%>
<!-- 자바 캘린더 클래스 임포트 -->
<html>
<head>
<title>새 글 등록</title>

<style type="text/css">
textarea { /* textarea 요소에 스타일 적용 */
	width: 100%;
	text-align: left;
	resize: none;
}
</style>
<SCRIPT LANGUAGE="JavaScript">
	//html로 작성한 form의 submit 을 자바 스크립트로 전송
	function submitForm() {
		fm.action = "gongji_write.jsp?key=INSERT"; //요청을 보낼 url, key=INSERT
		fm.submit(); //form 전송
	}
	//유효성 검사: 특수문자 입력 제한 (제목)
	function characterCheck(obj) {
		//정규표현식(Regular Expression)을 사용
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
String today = new java.text.SimpleDateFormat("yyyy-MM-dd")
		.format(new java.util.Date()); /* 오늘 날짜를 받아 변수 today에 문자열로 저장 */

String id = request.getParameter("key"); //key에 해당하는 데이터를 가져와 id에 문자열로 할당
ResultSet rset = stmt.executeQuery("select * from gongji where id = " + id + ";");
%>
<body>
	<FORM METHOD=POST name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5><!-- 테이블 표 생성 -->
			<tr><!-- 표 안에 행을 정의 -->
				<td><b>번호</b></td><!-- 행 속에 열 정의 -->
				<td>신규(insert)<input type="hidden" name=id value=<%=id%>></td><!--hidden 은 서버에 데이터를 보낼 때 사용자가 입력하지 않고 자동으로 전송-->
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type="text" name=title size=70 maxlength=70
					onkeydown="characterCheck(this)" required></td> <!-- onkeydown 은 텍스트가  입력되기 전에 이벤트 실행-->
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><%=today%></td> <!-- 오늘 날짜 띄우기 -->
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea name=content cols=70 row=600
						style='width: 500px; height: 250px; overflow-y: scroll' required></textarea></td>
			</tr>
		</table>
		<table width=650><!-- 버튼 테이블 정의 -->
			<tr>
				<td width=600></td>
				<!-- 버튼 두개를 화면 오른쪽에 위치시키기 위해 앞의 열 부분에 넓이 지정  -->
				<td><input type=button value="취소"
					onClick="window.location='gongji_list.jsp'"></td>
				<td><input type=button value="쓰기" onClick="submitForm()"></td>
				<!-- 버튼에서 submitForm() 함수 호출 -->
			</tr>
			<!-- 사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제) -->
			<%
stmt.close();
conn.close();
%>
		</table>
		
		
	</FORM>
</body>
</html>
