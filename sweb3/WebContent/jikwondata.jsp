<%@page import="pack.jikwonDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Jdata" class="pack.jikwondata"/>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 자료</title>
</head>
<body>
<h2>직원 자료</h2>

<table border='1'>
	<tr>
		<th>사번</th><th>이름</th><th>직급</th>
	</tr>
<%
	ArrayList<jikwonDto> list = Jdata.getData();
	for(jikwonDto D : list){
%>
	<tr>
		<td><%=D.getSawon_no() %></td>
		<td>
		<a href="buserdata.jsp?sawon_name=
		<%=D.getSawon_name() %>" target="ifrm">
		<%=D.getSawon_name() %></a>
		</td>
		<td><%=D.getSawon_jik() %></td>
	<tr>
<%		
	}
%>
</table>
<iframe  name="ifrm" width='500' height='300' ></iframe>
</body>
</html>