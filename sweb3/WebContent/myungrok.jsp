<%@page import="pack.myungrokDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myungrokData" class="pack.myungrokData" scope="page"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 만들기</title>
</head>
<body>
<h1>**방명록 만들기**</h1>
<hr/>
<a href="#"><i style="font-size:30px;">글 쓰기!</i></a>
<br><br>
<table border='1'>
	<tr>
		<th>코드</th><th>작성자</th><th>제목</th><th>내용</th>
	</tr>
<%
	ArrayList<myungrokDto> list= myungrokData.getDataAll();
	for(myungrokDto d : list){
%>
	<tr>
		<td><%=d.getCode() %></td>
		<td><%=d.getName() %></td>
		<td><%=d.getSubject() %></td>
		<td><%=d.getContent() %></td>
	</tr>
<%		
	}
%>
</table>
<br>
<b>코드를 클릭하면 삭제, 작성자를 클릭하면 수정합니다.</b>
</body>
</html>