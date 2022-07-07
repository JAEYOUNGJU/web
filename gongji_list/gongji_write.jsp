<%@ page contentType="text/html; charset=UTF-8"%>
<!--글자깨짐을 방지하기 위한 인코딩방식 세팅-->
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.net.*, java.util.Date, java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8" />
</head>
<body>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	// database에 연결
	Statement stmt = conn.createStatement(); //Statement 객체생성
	request.setCharacterEncoding("UTF-8");// 한글 처리
	
	String key = request.getParameter("key"); //key에 해당하는 데이터를 가져와 변수 key에 문자열로 할당
	String id = request.getParameter("id"); //id(번호)에 해당하는 데이터를 가져와 변수 id에 문자열로 할당
	String title = request.getParameter("title"); //title(제목)에 해당하는 데이터를 가져와 변수 title에 문자열로 할당
	String content = request.getParameter("content"); //content(내용)에 해당하는 데이터를 가져와 변수 content에 문자열로 할당
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); //날짜

	if (key.equals("INSERT")) { /* key의 객체가 INSERT와 같다는 조건을 만족하면 아래 수행 */
		String sql = "insert into gongji (title, date, content) " + "values ('" + title + "', '" + today + "', '" + content + "');";
		stmt.executeUpdate(sql);//sql문 실행
	} else { /* key의 객체가 위의 조건을 만족하지 않는다면(key=UPDATE) 아래 수행 */
		/* UPDATE [테이블] SET [열] = '변경할 값' WHERE [조건] */
		String sql = "update gongji set title ='" + title + "', date='" + today + "', content='" + content + "'  where id = " + id + " ;";
		stmt.executeUpdate(sql);//sql문 실행
	}
	//사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제)
	stmt.close();
	conn.close();
	response.sendRedirect("gongji_list.jsp");//특정페이지로의 이동(서버가 이동경로를 결정함)
	%>
</body>
</html>

