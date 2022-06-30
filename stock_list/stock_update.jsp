<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재고수정</title>

</head>
<body>


	<%
	  Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
		Statement stmt = conn.createStatement();//연결된 데이터베이스에서 자료 가져오기
		
		request.setCharacterEncoding("UTF-8"); // 한글 처리
	
		String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());//현재날짜 받아오기
	
		String id = request.getParameter("key"); //http 요청의 파라미터 값을 얻기 위해 request.getParameter() 사용

		String product="", firstDate = "", finalDate="", detail="", img="";
		int stockCount = 0;
		
		
		ResultSet rset = stmt.executeQuery("select * from twiceStock where id = '" +id+ "';");

		
		while (rset.next()) {

			product = rset.getString(2);
			stockCount = rset.getInt(3);
			firstDate = rset.getString(4);
			finalDate = rset.getString(5);
			detail = rset.getString(6);
			img = rset.getString(7);
		};


		%>


<div id="box">
<div>
<h3 align=center>(주)트와이스 재고 현황-재고수정</h3>

<form method=post name='fm'>
<table  border=1 cellspacing=0 cellpadding=5 align=center>

<tr>
<td><b>상품 번호</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="id" value=<%=id%>><%=id%></td>
</tr>

<tr>
<td><b>상품명</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="product" value=<%=product%>><%=product%></td>
</tr>

<tr>
<td><b>재고 현황</b></td>
<td width=480 colspan=3 align=left><input type='number' name="stockCount" value=<%=stockCount%>></td>
</tr>

<tr>
<td><b>상품등록일</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="firstDate" value=<%=firstDate%>><%=firstDate%></td>
</tr>

<tr>
<td><b>재고등록일</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="finalDate" value=<%=finalDate%>><%=finalDate%></td>
</tr>

<tr>
<td><b>상품설명</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="detail" value=<%=detail%>><%=detail%></td>
</tr>

<tr>
<td><b>상품사진</b></td>
<td width=480 height=200 colspan=3 align=left>
<img src='<%=img%>' width="300px" height="220px"></td>
</tr>
</div>
</div>


<%
rset.close();	
stmt.close();
conn.close();
%>
</form>




<table>
<tr>
		<td width=660></td>
		<td><input type=submit value="재고수정" OnClick="submitForm()"></td>
</tr>
</table>
		<SCRIPT LANGUAGE="JavaScript">
		function submitForm() {
		      fm.action = 'stock_updateDB.jsp?key=<%=id%>';
		      fm.submit();
		    }


</SCRIPT>
</body>
</html>