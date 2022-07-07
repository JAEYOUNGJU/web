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
	Statement stmt = conn.createStatement();//JDBC를 이용하여 SQL문을 발행하기 위해 Statement 객체 생성
	//테이블 생성을 위한 쿼리문 작성해 실행
	stmt.execute(
			"create table twiceStock (id int not null primary key, product varchar(20), stockCount int, finalDate date, firstDate date, detail text, img text)DEFAULT CHARSET = utf8");
	//변수 선언 및 초기화
	String sql = "";
	//데이터 삽입을 위한 쿼리문 작성하여 변수 sql에 문자열로 저장
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122122, '바나나', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql); //쿼리문 실행
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122123, '따알기', 10 , '2022-06-10', '2022-06-01', '알래스카산 따알기로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122124, '사아과', 12 , '2022-06-10', '2022-06-01', '알래스카산 사아과로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122125, '배애애', 14 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122126, '참외애', 15 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122127, '바나나', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122128, '따알기', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122129, '사아과', 12 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122130, '배애애', 14 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122131, '참외애', 15 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122132, '바나나', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122133, '따알기', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122134, '사아과', 12 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122135, '배애애', 14 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122136, '참외애', 15 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122137, '바나나', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122138, '따알기', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122139, '사아과', 12 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122140, '배애애', 14 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122141, '참외애', 15 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122142, '바나나', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122143, '따알기', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122144, '사아과', 12 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122145, '배애애', 14 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122146, '참외애', 15 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122147, '바나나', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122148, '따알기', 10 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122149, '사아과', 12 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122150, '배애애', 14 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);
	sql = "insert into twiceStock(id, product, stockCount, finalDate, firstDate, detail, img) values(122151, '참외애', 15 , '2022-06-10', '2022-06-01', '알래스카산 바나나로 맘모스의 아침식사', '사진')";
	stmt.execute(sql);

	stmt.close();
	conn.close();
	%>

</body>
</html>

