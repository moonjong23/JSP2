<%@page import="pack.companyDto"%>
<%@page import="pack.companyDb"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    //String buserName = request.getParameter("buserName"); //company.html에서 값 받음
    %>
    <jsp:useBean id="CPDB" class="pack.companyDb"/>
    <jsp:setProperty property="buserName" name="CPDB"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<table border='1'>
<tr><td>사번</td><td>직원명</td><td>직급</td><td>성별</td></tr>
<%
	ArrayList<companyDto> list = CPDB.getData();
	for(companyDto s : list){ %>
		<tr>
		<td><%=s.getSawonNo() %></td>
		<td><%=s.getSawonName() %></td>
		<td><%=s.getSawonJik() %></td>
		<% 
		if(s.getSawonGen().equals("남")){
		%>
		<td style="color:blue;"><%=s.getSawonGen() %></td>
		<%
		}else{
		%>
		<td style="color:yellow;"><%=s.getSawonGen() %></td>	
		<%
		}
		%>
		</tr>
		<%
	} 
		%>
</table>
</body>
</html>