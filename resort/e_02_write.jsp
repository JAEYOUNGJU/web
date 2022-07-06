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
	String key = request.getParameter("key");
	String id = request.getParameter("id");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String rootid="";
	int relevel = 0;
	int recnt = 0;
	int viewcnt = 0;
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

	if (key.equals("INSERT")) {
	
		
		sql = "insert into gongji_comment (title, viewcnt, date, content, rootid, relevel, recnt) values ('" + title + "', 0 , date(now()), '" + content + "', 0, 0, 0);";
		
		stmt.executeUpdate(sql);
		ResultSet rset = stmt.executeQuery("select max(id) from gongji_comment;");
		
		while (rset.next()) {
			rootid = rset.getString(1);
		}
		rset.close();
		stmt.executeUpdate("update gongji_comment set rootid = " + rootid + " where id = " + rootid + ";");
	} else if (key.equals("REINSERT")) {
		  	
		relevel = 0;
	       relevel = Integer.parseInt(request.getParameter("relevel"));
	       rootid = request.getParameter("rootid");
	         //String recnt = request.getParameter("recnt");
	      
	         recnt = 0;
		
		String query1 = "select g.* from gongji_comment as g, (select recnt from gongji_comment where id=?) as r where rootid=? and r.recnt <=g.recnt order by g.recnt;";
		  	
		  	out.println(id);
		  	out.println(rootid);
		  	
		  	
		  	PreparedStatement pstmt = conn.prepareStatement(query1);
		    pstmt.setInt(1, Integer.parseInt(id));
		    pstmt.setInt(2, Integer.parseInt(rootid)); 
		    ResultSet rset = pstmt.executeQuery();


		    // 첫번째 record는 댓글달고자하는 글
		    rset.next();
		    relevel = rset.getInt("relevel") + 1;   
		    recnt = rset.getInt("recnt");           // 해당 글의 recnt

		    while (rset.next()) {                       // 아래 record를 접근하며 relevel이 같거나 높으면 recnt 갱신, 낮으면 break
		      if (rset.getInt("relevel") >= relevel) {
		        recnt = rset.getInt("recnt");
		      } else {
		        break;
		      }
		    }
		    recnt++;                                    // 그 다음에 와야하므로 +1


		    // 추가할 댓글 아래 위치할 댓글들의 recnt +1 증가
		    String query2 = "update gongji_comment set recnt = recnt + 1 where rootid=? and recnt >= ?;";
		    pstmt = conn.prepareStatement(query2);
		    pstmt.setString(1, rootid);
		    pstmt.setInt(2, recnt);
		    pstmt.executeUpdate();


		    // DB에 저장
		    String query3 = "insert into gongji_comment(title, date, content, rootid, relevel, recnt) values(?, ?, ?, ?, ?, ?);";
		    pstmt = conn.prepareStatement(query3);
		    pstmt.setString(1, title);
		    pstmt.setString(2, today);
		    pstmt.setString(3, content);
		    pstmt.setString(4, rootid);
		    pstmt.setInt(5, relevel);
		    pstmt.setInt(6, recnt);
		    pstmt.executeUpdate();
 

		    // 자동부여된 ID 조회
		    String query4 = "select id from gongji_comment order by id desc limit 1";
		    pstmt = conn.prepareStatement(query4);
		    rset = pstmt.executeQuery();
		    rset.next();
		    int newId = rset.getInt(1); 

	} else {
		
		sql = "update gongji_comment set title ='" + title + "', date='" + today +"', content='"+content+"' where id = " + id + " ;";
	
		 
	 	stmt.executeUpdate(sql);
	}
	stmt.close();
	conn.close();
	%>
	<script>
		   document.location.href = "./e_02.jsp";
	</script>
</body>
<!--body끝-->
</html>
<!--html끝-->