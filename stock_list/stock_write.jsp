<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.Calendar"%>

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

	Class.forName("com.mysql.cj.jdbc.Driver"); // 데이터베이스용 jar파일 사용
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	// database에 연결
	Statement stmt = conn.createStatement(); // 연결된 데이터베이스에서 자료 가져오기
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());//현재 날짜 받아오기
	//변수 선언 및 초기화
	String id = "";
	String product = "";
	String stockCount = "";
	String detail = "";
	String imageAdd = "";

   	int size = 1024 * 1024 * 20; // 20MB
    String filename, original_filename;
    String path = request.getRealPath("./image");
    //웹페이지에서 MultipartRequest 객체를 이용한 파일 업로드 진행
    MultipartRequest multiRequest = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
    //MultipartRequest 로 전송받은 데이터를 불러옴
    id = multiRequest.getParameter("id");
    stockCount = multiRequest.getParameter("stockCount");
    product = multiRequest.getParameter("product");
    detail = multiRequest.getParameter("detail");
    
    imageAdd = "";
    //전송받은 데이터가 파일일 경우 getFilesystemName() 으로 파일명 받아옴 
    Enumeration files = multiRequest.getFileNames();
    String str = (String)files.nextElement();
    filename = multiRequest.getFilesystemName(str);
    original_filename = multiRequest.getOriginalFileName(str);
    imageAdd = "image/" + filename;
	
    ResultSet rset = stmt.executeQuery("select id from twiceStock where id = '" +id+ "';");//sql 문 실행
   
	if(rset.next()){ //한줄씩 읽어내려가는 경우
		 if(id.equals(rset.getString("id"))){ //id가 받아온 id와 동일하다면 
			out.println("<script>alert('이미 등록된 번호입니다.'); location.href='stock_insert.jsp';</script>"); //알림창 띄워 해당 문장 출력
		} else { //위의 조건이 아니라면
			out.println("새로 발급할 번호입니다."); //해당 문장 출력
		}
		
	  }//if문 끝
	//테이블에 삽입할 데이터를 쿼리문으로 작성하여 변수 sql에 문자열로 할당
    String sql = "INSERT INTO twiceStock (id, product, stockCount, finalDate, firstDate, detail, img) VALUES (" + id + ", '" 
	  + product + "', " + multiRequest.getParameter("stockCount") + ", '"
    + today + "', '" + today + "', '" + detail + "', '" + imageAdd + "');";
  
    stmt.executeUpdate(sql); //sql 실행
    /* 사용했던 객체들을 메모리에서 해제(최근에 사용했던 객체부터 거꾸로 올라가며 해제) */
    stmt.close();
    conn.close();
  %>
	<table width="650"> <!-- 버튼 표 정의 -->
		<tr>
			<td align="center"><h1>재고등록완료</h1></td>
		</tr>
		<tr>
			<td align="center"><input type="button" value="재고현황" onclick="location.href='stock_list.jsp'"></td>
		</tr>
	</table>
</body>
</html>