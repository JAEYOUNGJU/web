<%@ page contentType="text/html; charset=UTF-8" %>
<!--글자깨짐을 방지하기 위한 인코딩방식 세팅-->
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*, java.util.Date, java.text.SimpleDateFormat"%>

<html> <!--html시작-->
<head> <!--head시작-->
<% request.setCharacterEncoding("UTF-8"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8" />
<!--글자깨짐을 방지하기 위한 인코딩방식 세팅-->
</head> <!--head끝-->
<body> <!--body시작-->
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
Class.forName("com.mysql.cj.jdbc.Driver"); // 데이터베이스용 jar파일 사용
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
// database에 연결
Statement stmt = conn.createStatement(); // 연결된 데이터베이스에서 자료 가져오기

String key = request.getParameter("key");//update
String id = request.getParameter("id");

String title = request.getParameter("title");

String content = request.getParameter("content");
String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

if (key.equals("INSERT")) {
  String sql = "insert into gongji (title, date, content) "
      + "values ('" + title + "', '"
      + sf.format(nowTime) + "', '"
      + content + "');";
  stmt.executeUpdate(sql);
} else {
	

  String sql = "update gongji set title ='" + title + "', date='" + today +"', content='" +content+"'  where id = " + id + " ;";
  stmt.executeUpdate(sql);
}
out.println(id);
stmt.close();
conn.close();
%>
<script>
  document.location.href="./gongji_list.jsp"; 
</script>
</body> <!--body끝-->
</html> <!--html끝-->