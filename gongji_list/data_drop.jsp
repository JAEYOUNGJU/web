<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<html>
<head>
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
</head>
<body>
<h3>Drop table</h3><!--이건 그냥 텍스트 출력-->
<%
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
Statement stmt =conn.createStatement();//자바랑 동일하게 Statement 객체 생성
stmt.execute("drop table gongji;");
stmt.close(); //Statement 함수를 닫는다.
conn.close(); //Connection  함수를 닫는다.
%>
</body><!--body를 닫는다.-->
</html><!--역슬레시 html을 작성하여 html를 닫는다.-->