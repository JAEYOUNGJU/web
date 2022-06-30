
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import = "java.util.Calendar" %>
<%@page import="java.util.Date"%>
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
  	request.setCharacterEncoding("UTF-8");
  
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	Class.forName("com.mysql.cj.jdbc.Driver"); // 데이터베이스용 jar파일 사용
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	// database에 연결
	Statement stmt = conn.createStatement(); // 연결된 데이터베이스에서 자료 가져오기

    String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
    
    
	
    String id = request.getParameter("key");
    
	String stockCount = request.getParameter("stockCount");

 	String sql = "update twiceStock set stockCount ='" + stockCount + "', firstDate ='" + today + "' where id = " + id + ";";
  	stmt.executeUpdate(sql);
    
    stmt.close();
    conn.close();
  %>
  <table width="650">
    <tr>
      <td align="center"><h1>재고수정완료</h1></td>
    </tr>
    <tr>
      <td align="center"><input type="button" value="재고현황" onclick="location.href='stock_list.jsp'"></td>
    </tr>
  </table>
</body>
</html>