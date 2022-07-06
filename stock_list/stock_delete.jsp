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

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt =conn.createStatement();

	String id = request.getParameter( "key" );	
	String product = "";
	String imgFile= "";
	
	ResultSet rset = stmt.executeQuery("select * from twiceStock where id = " +id+ ";");
	while(rset.next()){
		product = rset.getString("product");
		imgFile = rset.getString("img");
	}
	stmt.execute("delete from twiceStock where id = " +id+ ";");
	
	String absolutePath = request.getSession().getServletContext().getRealPath("/imgFiles"); // 이미지 경로
	String filePath  = absolutePath + "\\" + imgFile;
	File deleteImg = new File(filePath); 
	
	if (deleteImg.exists()) {
		deleteImg.delete(); // 파일이 존재한다면 삭제
	}
		
%>
<h2 text align=center> [<%=product%>] 상품이 삭제되었습니다.</h2>
<div style="text-align:center">
<input type='button' value='재고현황' onClick="location.href='stock_list.jsp'">
</div>
<%
	stmt.close();
	conn.close();

%>
</body>
</html>

