<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="md" class="pack.myungrokDto"/>
<jsp:setProperty property="*" name="md"/>
<jsp:useBean id="myungrokdata" class="pack.myungrokData"/>
<%


boolean b = myungrokdata.write(md);

if(b)
	response.sendRedirect("myungrok.jsp");
else
	response.sendRedirect("myungrok_fail.jsp");
%>