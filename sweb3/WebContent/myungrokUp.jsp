<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="myungrokDto" class="pack.myungrokDto"/>
<jsp:setProperty property="*" name="myungrokDto"/>
<jsp:useBean id="myungrokdata" class="pack.myungrokData"/>
<%
boolean b = myungrokdata.updateOk(myungrokDto);

if(b)
	response.sendRedirect("myungrok.jsp");
else
	response.sendRedirect("myungrok_fail.html");
%>