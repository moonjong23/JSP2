<%@page import="pack.office_gogekDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="Db" class="pack.office_gogekDb"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 가족들</title>
</head>
<body>
<table border='1'>
	<tr>
		<th>가족번호</th><th>이름</th><th>전화번호</th><th>담당고객번호</th>
	</tr>
<%
String gogek_no=(String)session.getAttribute("gogek_no");
String gogek_name=(String)session.getAttribute("gogek_name");
ArrayList<office_gogekDto> list = Db.getdataAll(gogek_no,gogek_name);
for(office_gogekDto d : list){
%>
	<tr>
		<td><%=d.getF_bun() %></td>
		<td><%=d.getF_irum() %></td>
		<td><%=d.getF_tel() %></td>
		<td><%=d.getF_gogek_no() %></td>	
	</tr>
<%
}
%>
</table>
</body>
</html>