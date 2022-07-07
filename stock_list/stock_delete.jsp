<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>삭제완료</title>
<SCRIPT LANGUAGE="JavaScript">
	
</SCRIPT>
</head>
<body>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement();//Statement 객체생성

	String id = request.getParameter("key");//key에 해당하는 데이터를 가져와 id에 문자열로 할당
	//변수 선언 및 초기화
	String product = "";
	String imgFile = "";
	//해당 테이블의 id를 택하고 ResultSet을 통해 쿼리 실행해 결과값 읽어오기
	ResultSet rset = stmt.executeQuery("select * from twiceStock where id = " + id + ";");
	while (rset.next()) { //한 행씩 반복처리
		product = rset.getString("product"); //rset을 이용해 테이블의 컬럼 product를 String 값으로 가져와 변수 product에 할당 
		imgFile = rset.getString("img"); //rset을 이용해 테이블의 컬럼 img를 String 값으로 가져와 변수 imgFile에 할당
	}//while문 끝
	stmt.execute("delete from twiceStock where id = " + id + ";");//테이블의 특정 id 값을 지우기
	
	//사진 혹은 파일 업로드를 이용할 경우 jsp 를 사용
	//업로드 디렉토리가 웹서비스 디렉토리 하위에 존재할 경우
	String absolutePath = request.getSession().getServletContext().getRealPath("/imgFiles"); // 이미지 경로
	String filePath = absolutePath + "\\" + imgFile;
	File deleteImg = new File(filePath); //디렉토리 삭제하기

	if (deleteImg.exists()) {
		deleteImg.delete(); // 파일이 존재한다면 삭제
	}
	%>
	<h2 text align=center> [<%=product%>] 상품이 삭제되었습니다.</h2>
	<div style="text-align: center">
		<input type='button' value='재고현황' onClick="location.href='stock_list.jsp'">
	</div>
	<%
	stmt.close();
	conn.close();
	%>
</body>
</html>

