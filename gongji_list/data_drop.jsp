<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<html>
<head>
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정-->
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%> <!-- 자바의 sql package 로드 -->
</head>
<body>
	<h3>Drop table</h3>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.cj.jdbc.Driver 란 클래스를 로드
	//해당 연결을 Connection 객체에 담기
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //연결 객체의 Statement 메소드에 sql 입력하여 Statement 객체 생성
	stmt.execute("drop table gongji;"); //테이블 지우기
	stmt.close(); //Statement 함수를 닫기
	conn.close(); //Connection  함수를 닫기
	%>
</body>
</html>

