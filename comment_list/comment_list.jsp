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
.table {
	border: 1px solid #66b4d6;
	width: 100%;
}

#container {
	width: 100%;
	height: 100%;
	justify-content: center;
}

.table>thead {
	background-color: white;
	border: 1px solid #66b4d6;
}

.table>thead>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #aaebaa;
}

.table>tbody>tr>td {
	 /* text-align: center;  */
}

.table>tbody>tr>#title {
	text-align: left;
}
</style>
</head>
<body>

	<nav class="navbar navbar-dark bg-dark">

		<span class="navbar-brand mb-0 h1"><b>★ 공지사항 리스트</b></span>

	</nav>

	<div id="container" style="display: block">

		<table table class="table table-striped table-bordered table-hover"
			cellspacing=1 width=300 border=3>
			<thead>
				<tr>
					<td width=10><p align=center><b>번호</b></p></td>
					<td width=300><p align=center><b>제목</b></p></td>
					<td width=50><p align=center><b>조회수</b></p></td>
					<td width=50><p align=center><b>등록일</b></p></td>
				</tr>
			</thead>
			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
			Statement stmt = conn.createStatement();//Statement 객체 생성

			int id = 0, viewcnt = 0, relevel = 0;
			String title = "", date = "", today="";
			/* String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); */
			
			// ResultSet을 사용해 데이터 검색
			ResultSet rset2 = stmt.executeQuery("select date(now());"); //mysql에서 현재시간 가져오기
			while (rset2.next()) {
				today = rset2.getString(1);
			}
			rset2.close(); //사용 후 닫기				
			// ResultSet을 사용해 데이터 검색
			ResultSet rset = stmt.executeQuery("select * from gongji_comment order by rootid desc, recnt asc;");
			while (rset.next()) {
				id = rset.getInt(1);
				title = rset.getString(2);
				viewcnt = rset.getInt(3);
				date = rset.getString(4);
				relevel = rset.getInt(7);
				String sql1="";
				String sql2="";
				
				for (int i = 0; i < relevel; i++) {
					sql1 += " "+" <img src=arrow.png width=15px>"+" ";
				}
				if (today.equals(date) && relevel >= 1) {
					sql2 = " "+"<img src=newIcon.png width=15px>";
				}
				title = sql1 + title + sql2;
				%>
			<tr>
				<td align=center><%=id%></td>
				<!-- 번호 -->
				<td><a href='comment_view.jsp?key=<%=id%>'><%=title%></a></td>
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
<table class="btn">
<tr><td width=700></td><td><input class="btn btn-success btn float-right" align=right type="button" OnClick=location.href='comment_insert.jsp' value=신규 style="position: absolute; right: 10;"></input></td></tr>
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
