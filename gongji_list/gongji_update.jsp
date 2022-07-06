<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<%@ page import = "java.util.Calendar" %>
<html>
<head>
<title>글 수정</title>
<style type = "text/css">

  textarea {
  	width:100%;
    text-align: left;
    resize: none;
  }
</style>
<SCRIPT LANGUAGE="JavaScript">

function submitForm(){
	fm.action = "gongji_write.jsp?key=UPDATE";
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
</SCRIPT>
</head>


<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //객체생성
	String id_gongji = request.getParameter("key");
	ResultSet rset = stmt.executeQuery("select * from gongji where id='"+id_gongji+"';");
	
	request.setCharacterEncoding("UTF-8"); // 한글 처리
	rset.next();
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	
	int id = rset.getInt(1);
	String title = rset.getString(2);
	String content = rset.getString(4);
	rset.close();
	stmt.close();
	conn.close();
	
	//response.Redirection("gongji_list.jsp");
%>
<FORM METHOD=POST name='fm'>
<table width=650 border=1 cellspacing=0 cellpadding=5>
<tr>
		<td><b>번호</b></td>
		<td><%=id%><input type=hidden name=id value=<%=id %>></td><!--hidden 은 사용자가 변경해선 안되는 데이터를 보낼 때 사용-->
</tr>
<tr>
		<td><b>제목</b></td>
		<td><input type=text name=title size=70 maxlength=70 value =<%=title%> onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" required></td>
</tr>
<tr>
		<td><b>일자</b></td>
		<td><%=today%></td>
</tr>
<tr>
		<td><b>내용</b></td>
		<td><textarea style='width:500px; height:250px; overflow-y:scroll' name=content cols=70 row=600 required><%=content%></textarea></td>
</tr>
</table>

<table width=650>
<tr>
		<td width=600></td>
		<td><input type=button value="취소" OnClick="window.location='gongji_list.jsp'"></td>
		<td><input type=button value="쓰기" onClick="submitForm()"></td>
		<td><input type=button value="삭제" OnClick="location.href='gongji_delete.jsp?key=<%=id%>'"></td>
</tr>
</table>
</FORM>

</body>
</html>
