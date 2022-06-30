<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고현황 전체보기</title>
<style type="text/css"> 
   a:link{text-decoration: none; color : black;}
		a:visited{color : black;}
		/* a:hover{text-decoration: none;} */
</head>
<body>
<style>
	#box{
	width:100%;
	height: 100%;
	text-align: center;
	justify-content: center;
/* 		display: flex;
		align-items:center; */
	}
	
</style>
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
		    	
		    	String cPage = request.getParameter("page"); // page로 현재 페이지 받아오기

		        
		        if (cPage == null || "null".equals(cPage)) {
		          cPage = "1";
		        }
		        int totalCount = 0; // 총자료개수
		        ResultSet rset2 = stmt.executeQuery("select count(*) from twiceStock;");
		        while (rset2.next()) {
		          totalCount = rset2.getInt(1);
		        }
		        rset2.close(); // 파일 내용 닫기
		        
		        int cPageInt = Integer.parseInt(cPage); // 현재 페이지 정수형
		        
		        int countPerPage = 20;   //페이지당 출력 자료 개수
		        int pageSize = 10;   //출력될 페이지 개수 
		        
		        //총페이지 계산
		        int totalPage = (int) Math.ceil(totalCount / (double) countPerPage);
		        if (totalPage != Math.ceil(totalCount / (double) countPerPage)) {
		           totalPage++;
		        }
		        
		        // 현재페이지에 불가능한 값을 넣었을 경우 처리
		        if (cPageInt > totalPage) {
		           cPageInt = totalPage;
		        }
		        if (cPageInt < 1) {
		           cPageInt = 1;
		        }
		        
		        //페이지 묶음의 시작과 끝 페이지
		        int startPage;
		        
		        if (cPageInt % pageSize == 0) {
		           startPage = ((cPageInt - 1) / pageSize) * pageSize + 1;
		        } else {
		           startPage = (cPageInt / pageSize) * pageSize + 1;
		        }
		        int lastPage = startPage + pageSize - 1;
		        
		        
		        // 만약 끝 값이 총 페이지보다 크다면 총페이지만 나오도록
		        
		        if (lastPage > totalPage) {
		           lastPage = totalPage;
		        }
		        
		        // 이전 페이지열 계산
		        int pPage;
		        if (startPage == 1) {
		           pPage = 1;
		        } else {
		           pPage = startPage - 1;
		        }
		        
		        
		        // 다음 페이지열 계산
		        int nPage;
		        if (lastPage == totalPage) {
		           nPage = totalPage;
		        } else {
		           nPage = lastPage + 1;
		        }

		        ResultSet rset = stmt.executeQuery("select * from twiceStock limit " + (countPerPage * (cPageInt - 1))  + "," + countPerPage + " ;");
		        while (rset.next()) { // 비어있지 않을 때까지 반복문
		           out.println("<td align=center><a href='stock_view.jsp?key=" + rset.getString(1) + "'>" + rset.getString(1) + "</a></td>");   //상품번호
		           out.println("<td align=center><a href='stock_view.jsp?key=" + rset.getString(1) + "'>" + rset.getString(2) + "</a></td>"); //상품명 (상품번호를 key값으로 받아 링크 연결)
		           out.println("<td><p align=center>" + rset.getString(3) + "</p></td>"); //현재 재고 수
		           out.println("<td><p align=center>" + rset.getString(4) + "</p></td>");   //재고 파악일
		           out.println("<td><p align=center>" + rset.getString(5) + "</p></td></tr>");   //상품 등록일
		        }
		        
		         out.print("</table><table width='650' border=0 align=center>");
		     //      out.print("<tr><td width = 140>현재페이지 " + cPageInt + "p</td>");
		           out.print("<td width = 600 align = center><b><a href = 'stock_list.jsp?page="+pPage+"'> &lt&lt </a></b>");
		           for (int i = startPage; i <= lastPage; i++) {
		                if(i == cPageInt) {
		                   out.print("<b><u><a href = 'stock_list.jsp?page=" + i +"'> " + i + " </a></u></b>");
		                } else {
		                   out.print("<b><a href = 'stock_list.jsp?page=" + i +"'> " + i + " </a></b>");
		                }
		             
		           }
		           out.print("<b><a href = 'stock_list.jsp?page=" + nPage +"'> &gt&gt </a></b>");
		           out.print("</td>");
		           
		           rset.close(); // 파일 내용 닫기
		           stmt.close(); // 파일 닫기
		           conn.close(); // 연결 닫기


		%>	
		</td>
	</tr>
	
		<td width="1050" align="center"><input type=button OnClick="location.href='stock_insert.jsp'" value=신규등록></td>
</table>
</div>
</div>
</html>
</head>
