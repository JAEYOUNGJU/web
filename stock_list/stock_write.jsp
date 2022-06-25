<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="javax.servlet.ServletException"%>
<%@ page import = "java.util.Calendar" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쓰기</title>
</head>
<body>
	<%
		String absolutePath = request.getSession().getServletContext().getRealPath("/imageFolder");
	
		int maxSize = 1024 * 1024 * 10; //10MB
		
		MultipartRequest multi = new MultipartRequest(request, absolutePath, maxSize, "UTF-8");
		
	  Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
		Statement stmt = conn.createStatement();
		
		request.setCharacterEncoding("UTF-8"); // 한글 처리
		
		String p_imagePath = "";
		try {
			Enumeration files = multi.getFileNames();
		
			if (files.hasMoreElements()) {
				String fileName = multi.getFilesystemName("img"); // file 원래 이름 가져오기
				int i = fileName.lastIndexOf("."); // 파일 확장자 index 위치 찾기
				String fileExtension = fileName.substring(i); // 확장자명 자르기
	
				File file = multi.getFile("img"); // file 객체 생성
				
				String filePath  = absolutePath + "\\" + fileName; //시스템상의 절대경로를 포함한 파일명
				File f1 = new File(filePath);
				
				if (f1.exists()) {
					File newFile = new File(absolutePath + "\\" + multi.getParameter("id") + fileExtension); // 새로운 파일 객체 생성
					boolean rsltt = f1.renameTo(newFile);  //원하는 파일명으로 변경.
					p_imagePath = multi.getParameter("id") + fileExtension; // DB에 저장될 이미지 이름(id와 확장자명)
				}
			}
		} catch (Exception e) {
				System.out.println("파일 없음" + e.getLocalizedMessage());
		}
		
		stmt.execute("INSERT INTO InventoryStatus (id, product, stockCount, firstDate, finalDate, detail, img) values(" +
		multi.getParameter("id") + ", '" +
		multi.getParameter("product") + "', " +
		multi.getParameter("stockCount") +", date(now()), date(now()), '" +
		multi.getParameter("detail") + "', '" +
		p_imagePath + "');");
		stmt.close();
		conn.close();
		
		response.sendRedirect("stock_view.jsp");
		%>	
</body>
</html>