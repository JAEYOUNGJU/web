<%@ page contentType = "text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>새 글 추가</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function submitForm(mode){
	fm.action = gongji_wirte.jsp?key=INSERT";
	fm.submit();
}
//-->
</SCRIPT>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt =conn.createStatement();//Statement 객체 생성
	ResultSet rset = stmt.executeQuery("select * from gongji");
%>

</head>
<body>
<FORM METHOD=POST name='fm'>
<table width=650 border=1 cellspacing=0 cellpadding=5>
<tr>
		<td><b>번호</b></td>
		<td>신규(insert)<input type=hidden name=id value='INSERT'></td>
</tr>
<tr>
		<td><b>제목</b></td>
		<td><input type=text name=title size=70 maxlength=70></td>
</tr>
<tr>
		<td><b>일자</b></td>
		<td>2022-06-21</td>
</tr>
<tr>
		<td><b>내용</b></td>
		<td><textarea style='width:500px; height:250px;' name=content cols=70 row=600></textarea></td>
</tr>
</table>
<table width=650>
<tr>
		<td width=600></td>
		<td><input type=button value="취소" OnClick="location.href='gongji_list.jsp'"></td>
		<td><input type=button value="쓰기" OnClick="submitForm('write')"></td>
</tr>
</table>
</FORM>
</body>
</html>
