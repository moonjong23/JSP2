<%@page import="pack.office_Dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="Db" class="pack.office_Db"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
전체고객&nbsp;
<a href="office_jikwon_view.jsp" target="frame">돌아가기</a>
<table border='1'>
	<tr>
		<th>고객번호</th><th>고객명</th><th>주민번호</th><th>고객전화</th>
	</tr>
<%
ArrayList<office_Dto> list = Db.getdataAll(); 
for(office_Dto d : list){
%>
	<tr>
		<td><%=d.getGogek_no()%></td>
		<td><%=d.getGogek_name() %></td>
		<td><%=d.getGogek_jumin() %></td>
		<td><%=d.getGogek_tel() %></td>
	</tr>
<%
}
%>
</table>
<br>

</body>
</html>