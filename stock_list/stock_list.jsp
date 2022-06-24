<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import = "java.util.Calendar" %>
<html>
<head>
<title>리스트</title>
</head>
<body>

<h3 align=center>(주)트와이스 재고 현황-전체현황</h3>
<table cellspacing=1 width=800 border=1 align=center>
<tr>
<td width=100><p align=center>번호</p></td>
<td width=500><p align=center>상품명</p></td>
<td width=150><p align=center>현재 재고수</p></td>
<td width=150><p align=center>재고파악일</p></td>
<td width=150><p align=center>상품등록일</p></td> 
</tr>

<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo40");
	Statement stmt =conn.createStatement();//Statement 객체 생성
	ResultSet rset = stmt.executeQuery("select * from twiceStock order by id;");
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	while(rset.next()){
		int id = rset.getInt(1);
	// select 문을 이용해서 총 데이터 개수 출력
	String QueryTxt2;
	QueryTxt2 = String.format(" select count(*) from twiceStock limit 5 offset ;");
	ResultSet rset2 = stmt.executeQuery(QueryTxt2);
	int total=0;
	while (rset2.next()) {
		total = rset2.getInt(1);
	}
	String cpagemove = request.getParameter("pagemove");
	int inpagemove = (Integer.parseInt(cpagemove));		
	int pageprintnum = 10;
	int lastpage = 10;
	// 1페이지 이하에선 1로 출력
	if (inpagemove < 1) {
		inpagemove = 1;
	}
	//마지막 페이지에선 마지막페이지만 출력
	if(inpagemove>=((total/100)*10 + 1)){
		pageprintnum = (total/10)%10 + 1;
		inpagemove = (total/100)*10 + 1;
		lastpage = (total/10)%10;
	} else {
		pageprintnum = 10;
		lastpage = 10;
	}
		
		
%>

<tr text align=center>
<td><a href='stock_view.jsp?key=<%=id%>'><%=id%></a></td>
<td><a href='stock_view.jsp?key=<%=id%>'><%=rset.getString(2)%></a></td>
<td><%=rset.getInt(3) %></td>
<td><%=today%></td>
<td><%=rset.getString(5) %></td>
</tr>
<%
	}
%>
</table><br>
<table align=center>
<tr><td width=730></td><td><input align=center type=submit OnClick=location.href='stock_insert.jsp' value=신규등록></input></td></tr>
</table>

<table cellspacing=3 cellpadding=20>

<%
rset.close();
stmt.close();
conn.close();
%>


</table>
</html>
</head>
