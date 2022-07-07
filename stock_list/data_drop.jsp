<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<html>
<head>
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
</head>
<body>
	<h3>테이블 지우기 완료</h3>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement();//JDBC를 이용하여 SQL문을 발행하기 위해 Statement 객체 생성
	stmt.execute("drop table twiceStock;");//테이블 삭제을 위한 쿼리문 실행
	//사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제)
	stmt.close(); //Statement 함수를 닫는다.
	conn.close(); //Connection  함수를 닫는다.
	%>
</body>
</html>

