<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import = "java.util.Calendar" %>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //객체생성
	String id = request.getParameter("key");

	ResultSet rset = stmt.executeQuery("select * from twiceStock where id = " +id+ ";");
	rset.next();

	int id_stock2 = rset.getInt(1);
	String product = rset.getString(2);
	Integer stockCount = rset.getInt(3);
	String firstDate = rset.getString(4);
	String finalDate = rset.getString(5);
	String detail = rset.getString(6);
	String img = rset.getString(7);

%>

<html>
<head>
<title>상품상세</title>
<SCRIPT LANGUAGE="JavaScript">
</SCRIPT>
</head>
<body>

<div>
<div>
<h3 align=center>(주)트와이스 재고 현황-상품상세</h3>

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
<td width=480 colspan=3 align=left><input type='hidden' name="stockCount" value=<%=stockCount%>><%=stockCount%></td>
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
<img src=<%=img%> width="300px" height="220px"></td>
</tr>
</div>
</div>


<%
rset.close();	
stmt.close();
conn.close();
%>


</table>

<table width=590 align=center>

<tr>
		<td width=590></td>
		<td><input type=button value="재고 수정" OnClick="location.href='stock_update.jsp?key=<%=id%>'"></td>
		<td><input type=button value="상품 삭제" OnClick="location.href='stock_delete.jsp?key=<%=id%>'"></td>
</tr>
</table>

</body>
</html>
