<%@page import="pack.jikwonDto"%>
<%@page import="pack.buserdata"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="Bdata" class="pack.buserdata"/>
<jsp:setProperty property="sawon_name" name="Bdata" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 직원의 부서 정보</title>
</head>
<body>
<h2>해당 직원의 부서 정보</h2>
<%
	ArrayList<jikwonDto> list = Bdata.getData(); 
	for(jikwonDto D : list){
%>
부서번호:<%= D.getBuser_no()%>
<br/>
부서명:<%=D.getBuser_name()%>
<br/>
전화:<%=D.getBuser_tel()%>
<br/>
위치:<%=D.getBuser_loc()%>
<br/>
<%
	}
%>
</body>
</html>