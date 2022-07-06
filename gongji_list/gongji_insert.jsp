<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<%@ page import = "java.util.Calendar" %>


<html>
<head>
<title>새 글 추가</title>
<style type = "text/css">

  textarea {
  	width:100%;
    text-align: left;
    resize: none;
  }
</style>
<SCRIPT LANGUAGE="JavaScript">

function submitForm(){
	fm.action = "gongji_write.jsp?key=INSERT";
	fm.submit();
}
//특수문자 금지 (이름)
function characterCheck(obj){
var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
   if( regExp.test(obj.value) ){
    alert("특수문자는 입력하실 수 없으셔요.");
    obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
   }
}

/* function koreanCheck(obj){
	var korExp = /[ㄱ-ㅎ|ㅏ-ㅣ]/; 
	   if( korExp.test(obj.value) ){
	    alert("다시 입력해주셔요.");
	    obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
	   }
	} */
</SCRIPT>
</head>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //객체생성
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	
	String id = request.getParameter("key");
	ResultSet rset = stmt.executeQuery("select * from gongji where id = " +id+ ";");
	
	
%>
<body>


<FORM METHOD=POST name='fm'>
<table width=650 border=1 cellspacing=0 cellpadding=5>
<tr>
		<td><b>번호</b></td>
		<td>신규(insert)<input type=hidden name=id value=<%=id%>></td><!--hidden 은 사용자가 변경해선 안되는 데이터를 보낼 때 사용-->
</tr>
<tr>
		<td><b>제목</b></td>
		<td><input type="text" name=title size=70 maxlength=70 onkeyup="koreanCheck(this)" onkeydown="characterCheck(this)" required></td> <!-- onkeydown 은 텍스트가  입력되기 전에 이벤트 실행-->
</tr>
<tr>
		<td><b>일자</b></td>
		<td><%=today%></td>
</tr>
<tr>
		<td><b>내용</b></td>
		<td><textarea style='width:500px; height:250px;  overflow-y:scroll' name=content cols=70 row=600 required></textarea></td>
</tr>
</table>
<table width=650>
<tr>
		<td width=600></td>
		<td><input type=button value="취소" onClick="window.location='gongji_list.jsp'"></td>
		<td><input type=button value="쓰기" onClick="submitForm()"></td>
</tr>
<%
stmt.close();
conn.close();
%>
</table>
</FORM>
</body>
</html>
