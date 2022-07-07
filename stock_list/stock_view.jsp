<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import = "java.util.Calendar" %>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //객체생성
	String id = request.getParameter("key"); //key에 해당하는 데이터를 가져와 변수 id에 문자열로 할당

	ResultSet rset = stmt.executeQuery("select * from twiceStock where id = " +id+ ";");
	rset.next();

	int id_stock2 = rset.getInt(1); //번호
	String product = rset.getString(2); //상품명
	Integer stockCount = rset.getInt(3); //재고수
	String finalDate = rset.getString(4); //재고파악일
	String firstDate = rset.getString(5); //상품등록일
	String detail = rset.getString(6); //내용
	String img = rset.getString(7); //이미지
%>

<html>
<head>
<title>상품상세</title>
<SCRIPT LANGUAGE="JavaScript">
	
</SCRIPT>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<div>
		<h3 align=center>(주)트와이스 재고 현황-상품상세</h3>

		<table border=1 cellspacing=0 cellpadding=5 align=center>
			<tr>
				<td><b>상품 번호</b></td>
				<td width=480 colspan=3 align=left><input type='hidden'
					name="id" value=<%=id%>><%=id%></td>
			</tr>

			<tr>
				<td><b>상품명</b></td>
				<td width=480 colspan=3 align=left><input type='hidden'
					name="product" value=<%=product%>><%=product%></td>
			</tr>

			<tr>
				<td><b>재고 현황</b></td>
				<td width=480 colspan=3 align=left><input type='hidden'
					name="stockCount" value=<%=stockCount%>><%=stockCount%></td>
			</tr>

			<tr>
				<td><b>상품등록일</b></td>
				<td width=480 colspan=3 align=left><input type='hidden'
					name="finalDate" value=<%=finalDate%>><%=finalDate%></td>
			</tr>

			<tr>
				<td><b>재고등록일</b></td>
				<td width=480 colspan=3 align=left><input type='hidden'
					name="firstDate" value=<%=firstDate%>><%=firstDate%></td>
			</tr>

			<tr>
				<td><b>상품설명</b></td>
				<td width=480 colspan=3 align=left><input type='hidden'
					name="detail" value=<%=detail%>><%=detail%></td>
			</tr>

			<tr>
				<td><b>상품사진</b></td>
				<td width=480 height=200 colspan=3 align=left><img src=<%=img%>
					width="300px" height="220px"></td>
			</tr>
			</div>

			<!-- 사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제) -->
			<%
			rset.close(); //파일 내용 닫기
			stmt.close(); //파일 닫기
			conn.close(); //연결 닫기
			%>

			<table width=590 align=center>

				<tr>
					<td width=590></td>
					<td><input type=button value="재고 수정"
						OnClick="location.href='stock_update.jsp?key=<%=id%>'"></td>
					<td><input type=button value="상품 삭제"
						OnClick="location.href='stock_delete.jsp?key=<%=id%>'"></td>
				</tr>
			</table>
</body>
</html>
