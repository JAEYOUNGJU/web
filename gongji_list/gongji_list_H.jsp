<%@ page contentType = "text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>리스트</title>
</head>
<body>
<table cellspacing=1 width=600 border=1>
<tr>
<td width=50><p align=center>번호</p></td>
<td width=500><p align=center>제목</p></td>
<td width=100><p  align=center>등록일</p></td>
</tr>
<tr>
<td width=50><p align=center>1</p></td>
<td width=500><p align=center><a href=gingji_view.jsp?key=1'> 공지사항</a></p></td>
<td width=100><p align=center>2022-06-20</p></td>
</tr>
<tr>
<td width=50><p align=center>1</p></td>
<td width=500><p align=center><a href=gingji_view.jsp?key=2'>공지사항2</a></p></td>
<td width=100><p align=center>2022-06-20</p></td>
</tr>
</table>
<table width=650>
<tr>
<td width=550></td>
<td><input type=button value="신규" OnClick="window.location='gongji_insert.jsp'"></td>
</tr>
</table>
</body>
</html>


