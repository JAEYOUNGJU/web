<%@ page contentType="text/html; charset=UTF-8"%>
<!--글자깨짐을 방지하기 위한 인코딩방식 세팅-->
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.net.*, java.util.Date, java.text.SimpleDateFormat"%>

<html>
<!--html시작-->
<head>
<!--head시작-->
<%
request.setCharacterEncoding("UTF-8");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8" />
<!--글자깨짐을 방지하기 위한 인코딩방식 세팅-->
</head>
<!--head끝-->
<body>
	<!--body시작-->
	<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	Class.forName("com.mysql.cj.jdbc.Driver"); // 데이터베이스용 jar파일 사용
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	// database에 연결
	Statement stmt = conn.createStatement(); // 연결된 데이터베이스에서 자료 가져오기
	String sql = "";
	String key = request.getParameter("key");//update
	String id = request.getParameter("id");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	int viewcnt = 0;
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

	if (key.equals("INSERT")) {
	
		
		sql = "insert into gongji_comment (title, viewcnt, date, content, rootid, relevel, recnt) values ('" + title + "', 0 , date(now()), '" + content + "', 0, 0, 0);";
		
		stmt.executeUpdate(sql);
		ResultSet rset = stmt.executeQuery("select max(id) from gongji_comment;");
		int rootid = 0;
		while (rset.next()) {
			rootid = rset.getInt(1);
		}
		rset.close();
		stmt.executeUpdate("update gongji_comment set rootid = " + rootid + " where id = " + rootid + ";");
	} else if (key.equals("REINSERT")) {
		String relevel = request.getParameter("relevel");
		String rootid = request.getParameter("rootid");
		String recnt = request.getParameter("recnt");
		sql = "insert into gongji_comment(title, viewcnt, date, content, rootid, relevel, recnt) values ('" + title
		+ "', " + viewcnt + ", '" + today + "', '" + content + "', " + rootid + ", " + relevel + ", " + recnt + ");";
		stmt.executeUpdate(sql);
	} else {
		
		sql = "update gongji_comment set title ='" + title + "', date='" + today +"', content='"+content+"' where id = " + id + " ;";
	 /* 	out.println(title);
		out.println(content);
		out.println(id); */
		 
	 	stmt.executeUpdate(sql);
	}
	stmt.close();
	conn.close();
	%>
	<script>
		  document.location.href = "./comment_list.jsp";
	</script>
</body>
<!--body끝-->
</html>
<!--html끝-->