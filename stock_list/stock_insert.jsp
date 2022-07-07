<%@ page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재고 신규등록</title>
<style type="text/css">
textarea {/* textarea 요소에 스타일 적용 */
	resize: none;
}
</style>
<SCRIPT LANGUAGE="JavaScript">//html로 작성한 form의 submit 을 자바 스크립트로 전송
	function submitForm() {
		document.fm.action = "stock_write.jsp"; //요청을 보낼 url
		fm.submit();
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
<body>
	<div>
		<h3 align=center>(주)트와이스 재고 현황-상품등록</h3>
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
		Statement stmt = conn.createStatement(); //객체생성
		String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

		String id = request.getParameter("key"); //http 요청의 파라미터 값을 얻기 위해 request.getParameter() 사용
		%>
		<div>
			<!-- 파일 업로드 시 enctype 설정해야함 -->
			<!-- enctype은 form 데이터가 서버로 제출될 때 해당 데이터가 인코딩되는 방법을 명시 -->
			<!-- 이 속성은 <form> 요소의 메서드 속성값이 post 인 경우에만 사용할 수 있음 -->
			<form method="post" name="fm" enctype="multipart/form-data"> 
				<table border=1 cellspacing=0 cellpadding=5 align=center>

					<tr>
						<td><b>상품 번호</b></td>
						<td width=480 colspan=3 align=left><input type='number'
							name="id" onkeydown="characterCheck(this)" required></td> <!-- 특수문자 입력 제한, 빈칸 허용 안됨 -->
					</tr>

					<tr>
						<td><b>상품명</b></td>
						<td width=480 colspan=3 align=left><input type='text'
							maxlength='3' name="product" onkeydown="characterCheck(this)" required></td>
					</tr>

					<tr>
						<td><b>재고 현황</b></td>
						<td width=480 colspan=3 align=left><input type='number'
							min='0' onkeydown="characterCheck(this)" name="stockCount"
							required></td>
					</tr>

					<tr>
						<td><b>상품등록일</b></td>
						<td width=480 colspan=3 align=left><input type='hidden'
							name="finalDate" value=<%=today%>><%=today%></td><!-- 새로 등록하는 제품은 오늘 날짜로 자동 업데이트 -->
					</tr>

					<tr>
						<td><b>재고등록일</b></td>
						<td width=480 colspan=3 align=left><input type='hidden'
							name="firstDate" value=<%=today%>><%=today%></td><!-- 새로 등록하는 제품은 오늘 날짜로 자동 업데이트 -->
					</tr>

					<tr>
						<td><b>상품설명</b></td>
						<td width=480 colspan=3 align=left><input type='text'
							maxlength="1000" name="detail" required></td>
					<tr>
						<td><b>상품사진</b></td>
						<!-- 웹에서 파일을 첨부하기 위한 input type=file 사용, 자동으로 찾아보기 버튼이 생기고 파일 브라우징이 가능-->
						<td width=480 height=200 colspan=3><input type="file"
							required name="photo" size="70" maxlength="70" accept="images"></td>
					</tr>
				</table>
			</form>

		</div>
		<!-- 사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제) -->
		<%
		stmt.close();
		conn.close();
		%>

		<table width=700 align=center>
			<tr>
				<td width=600></td>
				<td><input type=submit value="완료" onClick="submitForm()"></td>
			</tr>
		</table>

	</div>
</body>
</html>

