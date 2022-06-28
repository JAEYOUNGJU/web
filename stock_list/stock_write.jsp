<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>

<html>
<head>
<title>신규등록</title>
<SCRIPT LANGUAGE="JavaScript">

function submitForm(){
	fm.action ="stock_write.jsp?key=INSERT";
	fm.submit();
}
  
function checkDouble(num) {
var dotcheck = num;
var isTrue = !dotcheck.includes(".");
return Boolean(isTrue);
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
%>
<div>
<form method="post" name="fm" action="stock_write.jsp?key=INSERT">
<table  border=1 cellspacing=0 cellpadding=5 align=center>

<tr>
<td><b>상품 번호</b></td>
<td width=480 colspan=3 align=left><input type='number' name="id" required></td>
</tr>

<tr>
<td><b>상품명</b></td>
<td width=480 colspan=3 align=left><input type='text' maxlength='3' name="product" required></td>
</tr>

<tr>
<td><b>재고 현황</b></td>
<td width=480 colspan=3 align=left><input type='number' name="stockCount" required></td>
</tr>

<tr>
<td><b>상품등록일</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="firstDate" value=<%=today%>><%=today%></td>
</tr>

<tr>
<td><b>재고등록일</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="finalDate" value=<%=today%>><%=today%></td>
</tr>

<tr>
<td><b>상품설명</b></td>
<td width=480 colspan=3 align=left><input type='text' name="detail" required></td>
</tr>

<tr>
<td><b>상품사진</b></td>
<td width=480 height=200 colspan=3><input type="file" name="upoladFile"></td>
</tr>
</table>
</form>

</div>
<%
stmt.close();
conn.close();
%>
<div>
<table width=700 align=center>
<tr>
		<td width=600></td>
		<td><input type=submit value="완료"></td>
</tr>
</table>
</div>
</div>
</form>
</body>
</html>

