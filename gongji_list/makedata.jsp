<%@ page contentType = "text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<%@ page import="java.sql.*,javax.sql.*,java.net.*,java.io.*" %>
</head>
<body>
<h3>Create table</h3>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40"); //해당 연결을 Connection 객체에 담기
	Statement stmt = conn.createStatement(); //JDBC를 이용하여 SQL문을 발행하기 위해 Statement 객체 생성
	//테이블 생성을 위한 쿼리문 작성
	 stmt.execute("create table gongji (id int not null primary key auto_increment,title varchar(70), date date, content text)DEFAULT CHARSET = utf8");
	 String sql=""; //변수 선언 및 초기화
		sql="insert into gongji(title, date, content) values('공지사항1',date(now()),'공지사항내용1')"; 
		stmt.execute(sql); //sql 문 실행
		sql="insert into gongji(title, date, content) values('공지사항2',date(now()),'공지사항내용2')"; 
		stmt.execute(sql); //sql 문 실행
		sql="insert into gongji(title, date, content) values('공지사항3',date(now()),'공지사항내용3')"; 
		stmt.execute(sql); //sql 문 실행
		sql="insert into gongji(title, date, content) values('공지사항4',date(now()),'공지사항내용4')"; 
		stmt.execute(sql); //sql 문 실행
		sql="insert into gongji(title, date, content) values('공지사항5',date(now()),'공지사항내용5')"; 
		stmt.execute(sql); //sql 문 실행
	//사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제)
	stmt.close();
	conn.close();
%>

</body>
</html>

