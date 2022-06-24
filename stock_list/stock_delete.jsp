<%@ page contentType = "text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>삭제완료 페이지</title>
<SCRIPT LANGUAGE="JavaScript">

function submitForm(mode){
	fm.action = "stock_update.jsp";
	fm.submit();
}
</SCRIPT>
</head>
<body>
<%
try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt =conn.createStatement();
	String id = request.getParameter( "key" );
	
	request.setCharacterEncoding("UTF-8"); // 한글 처리
	String sql = "delete from gongji where product=? ";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	
	
	pstmt.setString(2,product); 
	pstmt.executeUpagae();
	
	
%>
<h2 text align=center[<%=product%>] 상품이 삭제 완료하였습니다.</h2>
<div style="text-align:center">
<input type='button' value='재고현황' onClick="submitForm('update')"></td>
</div>
<%
	stmt.close();
	conn.close();
} catch(Exception e) {
 	out.println("오류 페이지");
            
 }  
%>
</body>
</html>

