<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->
<meta http-equiv="content-Type" cntent= "text/html; charset= utf-8"/>
<%@ page contentType= "text/html; charset=utf-8" %>
<%@ page import= "java.sql.*, javax.sql.*, java.io.* "%>
<html><!--웹 페이지는 <html>로 시작해서 </html>로 끝남-->
<head><!--웹 페이지의 정보, 문서에서 사용할 외부 파일들을 링크할 때 사용, <title>, <meta>등이 들어감-->
</head><!--머릿글을 사용하고 닫기-->
<body><!--웹페이지의 본문내용 기입-->
<h1>조회</h1> <!--h1 크기로 글씨 출력-->
<!--일반적인 JSP 코드임을 알림-->
<%
   Class.forName("com.mysql.jdbc.Driver");// DB에 접근하기 위해 제일 먼저 드라이버 클래스 로드하기
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40"); //JDBC 드라이버 로딩, 데이터베이스와 연결하는 객체 생성
   Statement stmt = conn.createStatement(); //DB로 SQL 문을 요청하기 위해 객체생성
   ResultSet rset = stmt.executeQuery("select * from wifi22;"); //결과값을 rset에 넘겨줌

%>
<!--셀 안의 공간 크기, 가로, 선 굵기 지정-->
<table cellspacing= 1 width= 600 border =1>
<!--일반적인 JSP 코드임을 알림-->
<%
   while (rset.next()){ //넘겨받은 결과값을 db에서 데이터를 불러온 while 문  
      out.println("<tr>"); //테이블의 행을 만들기 
	  //결과값을 문자형 변수 값을 출력하는 테이블의 열을 수치에 맞게 만들기, 가운데 정렬 
      out.println("<td width = 50> <p align= center>" + rset.getString(1) + "</p></td>"); //해당 순서의 열에 있는 데이터를 String 형으로 받아옴
      out.println("<td width = 50> <p align= center>" + Integer.toString(rset.getInt(2)) + "</p></td>");//해당 순서의 열에 있는 데이터를 int형으로 변환
      out.println("<td width = 50> <p align= center>" + Integer.toString(rset.getInt(3))  + "</p></td>");//해당 순서의 열에 있는 데이터를 int형으로 변환
      out.println("<td width = 50> <p align= center>" + Integer.toString(rset.getInt(4))  + "</p></td>");//해당 순서의 열에 있는 데이터를 int형으로 변환
      out.println("<td width = 50> <p align= center>" + Integer.toString(rset.getInt(5))  + "</p></td>");//해당 순서의 열에 있는 데이터를 int형으로 변환
      out.println("</tr>"); //행 만들고 닫기
   }
   //JDBC 드라이버를 사용한 후 닫아주기
   rset.close(); 
   stmt.close(); 
   conn.close(); 

%>
</table><!--테이블 만들고 닫기-->
</body><!--브라우저에 실제 표시되는 내용쓰고 닫기-->
</html><!--웹페이지의 끝-->