<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 로그인</title>
</head>
<body>
<table border='1' style="width:80%;  margin-left: auto; margin-right: auto; ">
	<tr>
		<td>
		<% if(session.getAttribute("gogek_no") == null && session.getAttribute("gogek_name")==null ){%>
		<%@include file="office_gogek.jsp" %>
		<%}else{ %>
		<%@include file="office_gogek2.jsp" %>
		<%} %>
		</td>
	</tr>
	<tr>
		<td>
		<iframe name="frame" width="100%" height="500"  style="border-style:none;"></iframe>
		</td>
	</tr>
</table>
</body>
</html>