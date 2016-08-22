<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String code = request.getParameter("code"); %>
<jsp:useBean id="myungrokdata" class="pack.myungrokData"/>
<%
boolean b = myungrokdata.delete(code);

if(b)
	response.sendRedirect("myungrok.jsp");
else
	response.sendRedirect("myungrok_fail.html");
%>