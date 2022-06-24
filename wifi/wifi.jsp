<meta http-equiv="Content=Type" content="text/html; charset-utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
</head>
<body>
<td align = center width= 20%><h1>와이파이</h1></td>

<%//DB연결 ,원격연결이 아닌 로컬 호스트로 연결 원격보다 더 빠르다
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
   Statement stmt = conn.createStatement();
   String key1 = request.getParameter("from");
   String key2 = request.getParameter("cnt");

   ResultSet rset = stmt.executeQuery("select * from wifi LIMIT " +key1+ "," +key2+ ";");  
   
%>
<center>
<table cellspacing=1 width=1300 border=1>
   <tr>
   <td align = center valign=middle width= 5%><h3>번호</h3></td>
   <td align = center valign=middle width= 50%><h3>주소</h3></td>
   <td align = center valign=middle width= 10%><h3>위도</h3></td>
   <td align = center valign=middle width= 10%><h3>경로</h3></td>
   <td align = center valign=middle width= 10%><h3>거리</h3></td>

   </tr>
<%
   while (rset.next()){
      out.println("<tr>");
      out.println("<td align= center> <p><h3>" + rset.getString(1) + "</h3></p></td>"); 
      out.println("<td align= center> <p><h3>" + rset.getString(2) + "</h3></p></td>");
      out.println("<td align= center> <p><h3>" + rset.getString(3) + "</h3></p></td>");
      out.println("<td align= center> <p><h3>" + rset.getString(4) + "</h3></p></td>");
      out.println("<td align= center> <p><h3>" + rset.getString(5) + "</h3></p></td>");
      out.println("</tr>");
   }

   rset.close();//rset닫기
   stmt.close();//stmt닫기
   conn.close();//conn닫기
%>
</table><!--테이블 종료-->
</center>
</body><!--body종료-->
</html><!--html종료-->
