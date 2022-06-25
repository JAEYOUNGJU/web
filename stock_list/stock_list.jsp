<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
<style>
	#box{
		text-align: center;
		position: absolute;
	}
/*	#btn{
		margin: 100px;
		position: fixed;
	}
	*/
	
	.btn{
	float:right;

	}
</style>

<div id="box">

<div>
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
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt =conn.createStatement();//Statement 객체 생성

	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	
	ResultSet rset = stmt.executeQuery("select * from twiceStock as a limit 0,20;");
	
	while (rset.next()) {
		out.println("<tr>");
		out.println("<td width=50><a href='stock_view.jsp?key=" + rset.getInt(1) + "'>" + rset.getInt(1) + "</a></td>");
		out.println("<td width=70><a href='stock_view.jsp?key=" + rset.getInt(1) + "'>" + rset.getString(2) + "</a></td>");
		out.println("<td width=70>" + rset.getInt(3) + "</td>");
		out.println("<td width=70>" + rset.getString(4) + "</td>");
		out.println("<td width=70>" + rset.getString(5) + "</td>");
		out.println("</tr>");
	}
%>
</table>

<table>

</table>

<table>
	<tr>
		
		<%
		int count=0; //전체게시글 개수 세기
		int totalPage=0;
		int onePage=20; //한 페이지당 게시글  수-->
		int currentPage=0; //현재 페이지 위치
		double pageDiv=0; //몇 개의 페이지로 구성할 것인가
		int page2=0;
		
		String ckey = "0";
		int calc_key = Integer.parseInt(ckey);
		
		//select 문을 이용한 총 데이터 개수 출력
		rset = stmt.executeQuery("select count(*) from twiceStock;");
		while(rset.next()) {
			count=rset.getInt(1);
		}
		pageDiv = (count/onePage); 
		page2 = (count%onePage);

		int max = (count/onePage)*onePage;

		if(page2 == 0){
			totalPage = (int) pageDiv;
			max -= onePage;
		}else{
			totalPage = (int) (pageDiv+1);
		}
		
		if (calc_key > max) {
			calc_key = max;
		}
		int key_value = (calc_key/200) * 200;
		int key_page = (key_value/200) * 10;
		currentPage = (calc_key/onePage)+1;
		
		out.println("<p align=center><a href='stock_view.jsp?key=" + (key_value-onePage) + "'><font size='4'><b>&lt;</b></font></a>");
		
		if (count <= onePage) {
			out.println("<a href='stock_view.jsp?key=" + key_value + "'><font size='3'><b>" + 1 +"</b></font></a>");
		} else {
			for (int i=1; i<11; i++) {
				if ((key_page+i) > totalPage) {
					break;
				}
				
				if ((key_page+i) == (currentPage)) {
					out.println("<a href='stock_view.jsp?key=" + key_value + "'><font size='4'><b>" + (key_page+i) +"</b></font></a>");
				} else {
					out.println("<a href='stock_view.jsp?key=" + key_value + "'><font size='4'><b>" + (key_page+i) +"</b></font></a>");
				}
				key_value += onePage;
			}
		}
		
		if (key_value >= max) {
			out.println("<a href='stock_view.jsp?key=" + max + "'><font size='4'><b>&gt;</b></font></a>");
		} else {
			out.println("<a href='stock_view.jsp?key=" + (key_value) + "'><font size='4'><b>&gt;</b></font></a>");
		}
		%>	
		</td>
<!-- <div id="btn" align="right">-->
<div class="btn">
<td width="1050"><input align=center type=button OnClick="location.href='stock_insert.jsp'" value=신규등록></input></td>
</tr>
</div>
</table>
</div>
</div>
<%
rset.close();
stmt.close();
conn.close();
%>


</table>
</html>
</head>
