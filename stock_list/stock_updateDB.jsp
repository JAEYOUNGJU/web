<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import = "java.util.Calendar" %>
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); //한글 처리

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");

	Statement stmt = conn.createStatement(); // 연결된 데이터베이스에서 자료 가져오기

	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); //오늘 날짜 받기

	String id = request.getParameter("key");//key에 해당하는 데이터를 가져와 변수 id에 문자열로 할당

	String stockCount = request.getParameter("stockCount"); //stockCount에 해당하는 데이터를 가져와 변수 stockCount에 문자열로 할당
	//데이터를 수정할 쿼리문을 작성한 결과값을 변수 sql에 문자열로 저장
	String sql = "update twiceStock set stockCount ='" + stockCount + "', finalDate ='" + today + "' where id = " + id + ";";
	stmt.executeUpdate(sql);//sql 실행
	/* 사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제) */
	stmt.close();
	conn.close();
	%>
	<table width=650>
		<tr>
			<td align="center"><h1>재고수정완료</h1></td>
		</tr>
		<tr>
			<td align="center"><input type="button" value="재고현황"
				onclick="location.href='stock_list.jsp'"></td>
		</tr>
	</table>
</body>
</html>

