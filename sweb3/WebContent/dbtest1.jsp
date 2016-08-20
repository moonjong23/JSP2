<%@page import="pack.SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="connBean" class="pack.ConnBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>** 상품 자료(bean사용) **</h2>
<table border='1'>
	<tr><th>코드</th><th>상품명</th><th>수량</th><th>단가</th>
	<%
	ArrayList<SangpumDto> list = connBean.getData();
	for(SangpumDto s : list){
		%>
	<tr>
		<td><%=s.getCode() %></td>
		<td><%=s.getSang() %></td>
		<td><%=s.getSu() %></td>
		<td><%=s.getDan() %></td>
	</tr>	
	<%
	}
	%>
</table>
</body>
</html>