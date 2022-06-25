<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고현황/수정</title>
</head>
<body>
	<%
	  Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
		Statement stmt = conn.createStatement();
		
		request.setCharacterEncoding("UTF-8"); // 한글 처리
		stmt.execute("insert into twiceStock (product, stockCount, firstDate, finalDate, detail, img) values('" + request.getParameter("product") + request.getParameter("stockCount") + request.getParameter("firstDate") + "')");
		String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	  
		String id = request.getParameter("id");
		String stockCount = request.getParameter("stockCount");
		
		stmt.executeUpdate("update twiceStock set stockCount = " + stockCount + 
				", firstDate = '" + today + "' where id = " + id);
		
		response.sendRedirect("stock_view.jsp?key=" + id);
		
		
		stmt.close();
		conn.close();
		
		%>
</body>
</html>