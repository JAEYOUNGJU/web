<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
</head>
<body>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt = conn.createStatement(); // 연결된 데이터베이스에서 자료 가져오기
	
	//key 값을 integer로 변형해 변수 id에 저장
	int id = Integer.parseInt(request.getParameter("key"));
	//삭제하려는 글의 아래 달린 글 조회하기
	String sql = "select g.rootid, g.id, g.relevel, g.recnt from gongji_comment as g, (select rootid, recnt from gongji_comment where id=?) as r where g.recnt >= r.recnt and g.rootid = r.rootid order by g.recnt;";
	//집어넣을 데이터가 많을 땐 PreparedStatement 클래스를 통해 가독성과 효율성을 높인다.
	PreparedStatement pstmt = conn.prepareStatement(sql);
		
	/* 	String sql = "delete from gongji_comment where id= " +id+";";*/
	/*stmt.executeUpdate( sql );  */
	
	pstmt.setInt(1, id);
    ResultSet rset = pstmt.executeQuery();

    rset.next();
 	//삭제하고자하는 글의 relevel 저장
    int relevel = rset.getInt("relevel");

    //하위 댓글들 삭제
    int count = 0;
 	//아래로 순차적으로 접근, 삭제하고자하는 글보다 relevel이 낮으면 해당 글의 하위 댓글이라고 판단. 삭제
    while (rset.next()) {
      if (rset.getInt("relevel") > relevel) {
        String sql2 = "delete from gongji_comment where id=?";
        pstmt = conn.prepareStatement(sql2);
        pstmt.setInt(1, rset.getInt("id"));
        pstmt.executeUpdate();
        count++;
        
      } else {       
    	// relevel이 같거나 크면 해당 댓글과 무관한 글이므로 break
    	  break;
      }
    }


    // 지워질 글의 아래 댓글을의 recnt를 삭제한 글의 개수만큼 감소
    String sql3 = "update gongji_comment, (select g.rootid, g.recnt from gongji_comment as g, (select rootid, recnt from gongji_comment where id=?) as r where g.recnt > r.recnt and r.rootid=g.rootid) as l set gongji_comment.recnt = gongji_comment.recnt - ? where l.rootid = gongji_comment.rootid and l.recnt = gongji_comment.recnt;";
    pstmt = conn.prepareStatement(sql3);
    pstmt.setInt(1, id);
    pstmt.setInt(2, count + 1); // 아래 삭제될 본글도 개수에 포함
    pstmt.executeUpdate();


    // 글 삭제
    String sql4 = "delete from gongji_comment where id=?";
    pstmt = conn.prepareStatement(sql4);
    pstmt.setInt(1, id);
    pstmt.executeUpdate();
	
	
	
	
	
	pstmt.close();
	conn.close();
	response.sendRedirect("e_02.jsp");//특정페이지로의 이동
%>
</body>
</html>