
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import = "java.util.Calendar" %>
<%@page import="java.util.Date"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <%
  	request.setCharacterEncoding("UTF-8");
  
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	Class.forName("com.mysql.cj.jdbc.Driver"); // 데이터베이스용 jar파일 사용
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	// database에 연결
	Statement stmt = conn.createStatement(); // 연결된 데이터베이스에서 자료 가져오기
	
	String id = "";
	String product = "";
	String stockCount = "";
	String detail = "";
	String imageAdd = "";

   	int size = 1024 * 1024 * 20; // 20MB
    String filename, original_filename;
    String path = request.getRealPath("./image");
    
    MultipartRequest multiRequest = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
    
    id = multiRequest.getParameter("id");
    stockCount = multiRequest.getParameter("stockCount");
    product = multiRequest.getParameter("product");
    detail = multiRequest.getParameter("detail");
    
    imageAdd = "";
    Enumeration files = multiRequest.getFileNames();
    String str = (String)files.nextElement();
    filename = multiRequest.getFilesystemName(str);
    original_filename = multiRequest.getOriginalFileName(str);
    imageAdd = "image/" + filename;
	
    ResultSet rset = stmt.executeQuery("select id from twiceStock where id = '" +id+ "';");
   
    
	if(rset.next()){
		 if(id.equals(rset.getString("id"))){ 
			out.println("<script>alert('이미 등록된 번호입니다.'); location.href='stock_insert.jsp';</script>");
			out.flush();//백단 작업이 시작되기 전 화면 출력 내용이 8KB가 되지 않을 경우 out,flush() 함수를 사용해 로딩중이라는 표시를 하기위함
		} else {
			out.println("새로 발급할 번호입니다.");
		}
		
	  }
    String sql = "INSERT INTO twiceStock (id, product, stockCount, firstDate, finalDate, detail, img) VALUES (" + id + ", '" + product + "', " + multiRequest.getParameter("stockCount") + ", '"
    + sf.format(nowTime) + "', '" + sf.format(nowTime) + "', '" + detail + "', '" + imageAdd + "');";
    
  /*   String sql = "INSERT INTO twiceStock VALUES (" + id + ", '" + product + "', " + stockCount + ", '" + sf.format(nowTime).replace("-","") + "', '" + sf.format(nowTime).replace("-","") + "', '" + detail + "', '" + imageAdd + "');"; */
    
    stmt.executeUpdate(sql); 
    
    stmt.close();
    conn.close();
  %>
  <table width="650">
    <tr>
      <td align="center"><h1>재고등록완료</h1></td>
    </tr>
    <tr>
      <td align="center"><input type="button" value="재고현황" onclick="location.href='stock_list.jsp'"></td>
    </tr>
  </table>
</body>
</html>