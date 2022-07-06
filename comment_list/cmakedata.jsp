<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<%@ page import="java.sql.*,javax.sql.*,java.net.*,java.io.*"%>
</head>
<body>
	<h1>Make table</h1>
	<%
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40"); 
   Statement stmt = conn.createStatement(); 
%>
	<%
try {
   //stmt.execute("drop table gongji");
   out.println("drop table gongji_comment OK<br>");
} catch(Exception e) {
   out.println("drop table gongji_comment NOT OK<br>");
   out.println(e.toString());
}
%>

	<% 

	stmt.execute("create table gongji_comment(id int not null primary key auto_increment, title varchar(70), viewcnt int, date date, content text, rootid int, relevel int, recnt int) DEFAULT CHARSET = utf8"); 
  
%>

	<%
   String sql="";
   



sql = "insert into gongji_comment(title, viewcnt, date, content, rootid, relevel, recnt) values('이용후기1', 0 , '2022-07-01', '내용1', 1 , 0, 0);";
stmt.execute(sql);
sql = "insert into gongji_comment(title, viewcnt, date, content, rootid, relevel, recnt) values('이용후기2', 0 , date(now()), '내용2', 2 , 0, 0);";
stmt.execute(sql);
sql = "insert into gongji_comment(title, viewcnt, date, content, rootid, relevel, recnt) values('이용후기3', 0 , date(now()), '내용3', 3 , 0, 0);";
stmt.execute(sql);
sql = "insert into gongji_comment(title, viewcnt, date, content, rootid, relevel, recnt) values('이용후기4', 0 , date(now()), '내용4', 4 , 0, 0);";
stmt.execute(sql);
sql = "insert into gongji_comment(title, viewcnt, date, content, rootid, relevel, recnt) values('이용후기5', 0 , date(now()), '내용5', 5 , 0, 0);";
stmt.execute(sql);

stmt.close();
conn.close();
%>

</body>
</html>