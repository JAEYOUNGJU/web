<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.util.Calendar"%>
<html>
<head>
<title>공지사항 리스트</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>


#container {
/* 	width: 100%; */
	height: 100%;
	justify-content: center;
}


</style>
</head>
<body>
<div align=center>
<br>
	<h6><b>이용후기</b></h6>
	<table cellspacing=1 width=700 border=1>
		<tr>
					<td width=50><p align=center><b>번호</b></p></td>
					<td width=400><p align=center><b>제목</b></p></td>
					<td width=100><p align=center><b>조회수</b></p></td>
					<td width=100><p align=center><b>등록일</b></p></td>
				</tr>
			
			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
			Statement stmt = conn.createStatement();//Statement 객체 생성

			
			String cPage = request.getParameter("page"); // page로 현재 페이지 받아오기

	        
	        if (cPage == null || "null".equals(cPage)) {
	          cPage = "1";
	        }
	        int totalCount = 0; // 총자료개수
	        ResultSet rset2 = stmt.executeQuery("select count(*) from gongji;");
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
			
			
			
			int id = 0, viewcnt = 0, relevel = 0;
			String title = "", date = "", today="";
			/* String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); */
			
			
			
			
			// ResultSet을 사용해 데이터 검색
			ResultSet rset3 = stmt.executeQuery("select date(now());"); //mysql에서 현재시간 가져오기
			while (rset3.next()) {
				today = rset3.getString(1);
			}
			rset2.close(); //사용 후 닫기				
			// ResultSet을 사용해 데이터 검색
			ResultSet rset = stmt.executeQuery("select * from gongji_comment order by rootid desc, recnt asc limit " + (countPerPage * (cPageInt - 1))  + "," + countPerPage + " ;");
			while (rset.next()) {
				id = rset.getInt(1);
				title = rset.getString(2);
				viewcnt = rset.getInt(3);
				date = rset.getString(4);
				relevel = rset.getInt(7);
				String sql1="";
				String sql2="";
				
				for (int i = 0; i < relevel; i++) {
					sql1 += " "+" <img src=image/arrow.png width=15px>"+" ";
				}
				if (today.equals(date) && relevel >= 1) {
					sql2 = " "+"<img src=image/newIcon.png width=15px>";
				}
				title = sql1 + title + sql2;
				%>
			<tr>
				<td align=center><%=id%></td>
				<!-- 번호 -->
				<td><a href='e_02_view.jsp?key=<%=id%>'><%=title%></a></td>
				<!-- 제목 -->
				<td align=center><%=viewcnt%></td>
				<!-- 조회수 -->
				<td align=center><%=date%></td>
				<!-- 날짜 -->
			</tr>
			<%
			}
			%>
</table><br>
	<%
	   out.print("<table width='150' border=0 align=center>");
		     //      out.print("<tr><td width = 140>현재페이지 " + cPageInt + "p</td>");
		           out.print("<td width = 100 align = center><b><a href = 'e_02.jsp?page="+pPage+"'> &lt&lt </a></b>");
		           for (int i = startPage; i <= lastPage; i++) {
		                if(i == cPageInt) {
		                   out.print("<b><u><a href = 'e_02.jsp?page=" + i +"'> " + i + " </a></u></b>");
		                } else {
		                   out.print("<b><a href = 'e_02.jsp?page=" + i +"'> " + i + " </a></b>");
		                }
		             
		           }
		           out.print("<b><a href = 'e_02.jsp?page=" + nPage +"'> &gt&gt </a></b>");
		           out.print("</td>");
		           out.println("</table>");
		           %>

<table width=600>
<tr><td width=600></td><td><input type="button" OnClick=location.href='e_02_insert.jsp' value=신규 style="position: absolute;"></td></tr>
</table>



	
<%
			rset.close();
			stmt.close();
			conn.close();
			%>
	</div>
	</nav>
	
</body>
</html>
</head>
