<%@page import="java.util.Date"%>
<%@ page import = "java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ page errorPage="errorPage.jsp" %> --%>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신규등록</title>
<style type = "text/css">

  textarea {
    resize: none;
  }
</style>
<SCRIPT LANGUAGE="JavaScript">

function submitForm(){
	document.fm.action ="stock_write.jsp";
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
function checkDouble(num) {
var dotcheck = num;
var isTrue = !dotcheck.includes(".");
return Boolean(isTrue);
}

</SCRIPT>

</head>
<body>
<div>
<h3 align=center>(주)트와이스 재고 현황-상품등록</h3>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopo40");
	Statement stmt = conn.createStatement(); //객체생성
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	
	String id = request.getParameter("key"); //http 요청의 파라미터 값을 얻기 위해 request.getParameter() 사용

	
%>
<div>
<!-- 파일 업로드 시 enctype 설정해야함 -->
<form method="post" name="fm" enctype="multipart/form-data">
<table  border=1 cellspacing=0 cellpadding=5 align=center>

<tr>
<td><b>상품 번호</b></td>
<td width=480 colspan=3 align=left><input type='number' name="id" required></td>
</tr>

<tr>
<td><b>상품명</b></td>
<td width=480 colspan=3 align=left><input type='text' maxlength='3' name="product" required></td>
</tr>

<tr>
<td><b>재고 현황</b></td>
<td width=480 colspan=3 align=left><input type='number' min='0' onkeydown="characterCheck(this)" name="stockCount" required></td>
</tr>

<tr>
<td><b>상품등록일</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="firstDate" value=<%=today%>><%=today%></td>
</tr>

<tr>
<td><b>재고등록일</b></td>
<td width=480 colspan=3 align=left><input type='hidden' name="finalDate" value=<%=today%>><%=today%></td>
</tr>

<tr>
<td><b>상품설명</b></td>
<%-- <td><textarea style="width:100%" name=detail required><%=detail%></textarea></td> --%>
<td width=480 colspan=3 align=left><input type='text' maxlength="1000"name="detail" required></td>

<tr>
<td><b>상품사진</b></td>
<td width=480 height=200 colspan=3><input type="file" required name="photo" size="70" maxlength="70" accept="images"></td>
</tr>
</table>
</form>

</div>
<%
stmt.close();
conn.close();
%>

<table width=700 align=center>
<tr>
		<td width=600></td>
		<td><input type=submit value="완료" OnClick="submitForm()"></td>
</tr>
</table>

</div>
</body>
</html>

