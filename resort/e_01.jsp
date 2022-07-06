<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
<title>리조트</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>

.table-hover>tbody>tr:hover {
	background-color: #aaebaa;
}

    table{
      margin-left:auto; 
      margin-right:auto;
    }
   p{
      margin : 3px;
   }
   
   tr{
      height : 10px;

   }
   td{
      height : 10px;
   }

</style>
</head>
<body>
<div align=center>
<br>
	<h6><b>리조트 소식</b></h6>
	<table  cellspacing=1 width=600 border=1>
		<tr>
			<td width=100><p align=center>번호</p></td>
			<td width=300><p align=center>제목</p></td>
			<td width=200><p align=center>등록일</p></td>
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
		
		ResultSet rset = stmt.executeQuery("select * from gongji order by id desc limit " + (countPerPage * (cPageInt - 1))  + "," + countPerPage + " ;");
		while (rset.next()) {
			int id = rset.getInt(1);
			
			
		%>

		<tr>
			<td align=center><%=id%></td>
			<td><a href='gongji_view.jsp?key=<%=id%>'><%=rset.getString(2)%></a></td>
			<td align=center><%=rset.getString(3)%></td>
		</tr>
		<%
		}
		
		%>
	</table>
	<%
	   out.print("<table width='150' border=0 align=center>");
		     //      out.print("<tr><td width = 140>현재페이지 " + cPageInt + "p</td>");
		           out.print("<td width = 100 align = center><b><a href = 'e_01.jsp?page="+pPage+"'> &lt&lt </a></b>");
		           for (int i = startPage; i <= lastPage; i++) {
		                if(i == cPageInt) {
		                   out.print("<b><u><a href = 'e_01.jsp?page=" + i +"'> " + i + " </a></u></b>");
		                } else {
		                   out.print("<b><a href = 'e_01.jsp?page=" + i +"'> " + i + " </a></b>");
		                }
		             
		           }
		           out.print("<b><a href = 'e_01.jsp?page=" + nPage +"'> &gt&gt </a></b>");
		           out.print("</td>");
		           out.println("</table>");
		           %>
	<br>
	<!-- <table class="btn">
		<tr>
			<td width=550></td>
			<td><input align=right class="btn btn-success btn float-right" type=submit OnClick=location.href=
				'gongji_insert.jsp' value=신규></input></td>
		</tr>
	</table>

	<table cellspacing=3 cellpadding=20> -->

		<%
		rset.close();
		stmt.close();
		conn.close();
		%>

<!-- 		</tr>
	</table> -->
	</div>
	</body>
	
</html>
</head>
