<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고현황 전체보기</title>
</head>
<body>
<style>
	#box{
		text-align: center;
		justify-content: center;
		display: flex;
		align-items:center;
	}
</style>

<div id="box">
<div class="center">
<h3 align=center>(주)트와이스 재고 현황-전체현황</h3>

<table cellspacing=1 width=800 border=1 align=center>
<tr>
<td width=100><p align=center>번호</p></td>
<td width=500><p align=center>상품명</p></td>
<td width=150><p align=center>현재 재고수</p></td>
<td width=150><p align=center>재고파악일</p></td>
<td width=150><p align=center>상품등록일</p></td> 
</tr>

  <%
			    String sql = "SELECT * FROM twiceStock as a limit 0,20;";
			    Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버 로드
			    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
				Statement stmt = conn.createStatement();
    	
		    	ResultSet rs = stmt.executeQuery(sql);
		    	
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td width=50><a href='stock_view.jsp?key=" + rs.getInt(1) + "'>" + rs.getInt(1) + "</a></td>");
						out.println("<td width=70><a href='stock_view.jsp?key=" + rs.getInt(1) + "'>" + rs.getString(2) + "</a></td>");
						out.println("<td width=70>" + rs.getInt(3) + "</td>");
						out.println("<td width=70>" + rs.getString(4) + "</td>");
						out.println("<td width=70>" + rs.getString(5) + "</td>");
						out.println("</tr>");
					}
		    %>
      </table>
      <table class="regButton">
		    <tr>
		      <td width=550>
		      <%
			      String ckey = "0";
						int calc_key = Integer.parseInt(ckey);
						
						int cnt=0, total_pages=0, posts_perPage=10, current_page=0;
						double page_mod=0; int page_quo=0;
						rs = stmt.executeQuery("select count(*) from twiceStock;");
						while (rs.next()) {
							cnt=rs.getInt(1);
						}
						page_quo = (cnt / posts_perPage);
						page_mod = (cnt % posts_perPage);
						
						int maxKeyValue = (cnt/posts_perPage) * posts_perPage;
						
						if (page_mod == 0) {
							total_pages = (int) page_quo;
							maxKeyValue -= posts_perPage;
						} else {
							total_pages = (int) (page_quo + 1);
						}
						
						 rs.close();
						 stmt.close();
						 conn.close();
						if (calc_key > maxKeyValue) {
							calc_key = maxKeyValue;
						}
						int key_value = (calc_key/100) * 100;
						int key_page = (key_value/100) * 10;
						current_page = (calc_key/posts_perPage)+1;
						
						out.println("<p align=center><a href='stock_list.jsp?key=" + (key_value-posts_perPage) + "'><font size='3'><b>&lt;</b></font></a>");
						
						if (cnt <= posts_perPage) {
							out.println("<a href='stock_list.jsp?key=" + key_value + "'><font size='3'><b>" + 1 +"</b></font></a>");
						} else {
							for (int i=1; i<11; i++) {
								if ((key_page+i) > total_pages) {
									break;
								}
								
								if ((key_page+i) == (current_page)) {
									out.println("<a href='stock_list.jsp?key=" + key_value + "'><font size='3'><b>" + (key_page+i) +"</b></font></a>");
								} else {
									out.println("<a href='stock_list.jsp?key=" + key_value + "'><font size='3'><b>" + (key_page+i) +"</b></font></a>");
								}
								key_value += posts_perPage;
							}
						}
						
						if (key_value >= maxKeyValue) {
							out.println("<a href='stock_list.jsp?key=" + maxKeyValue + "'><font size='3'><b>&gt;</b></font></a>");
						} else {
							out.println("<a href='stock_list.jsp?key=" + (key_value) + "'><font size='3'><b>&gt;</b></font></a>");
						}
		%>	
		</td>
	</tr>
	
		<td width="1050"><input type=button OnClick="location.href='stock_insert.jsp'" value=신규등록></td>
</table>
</div>
</div>
</html>
</head>
