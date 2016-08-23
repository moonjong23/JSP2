<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id= request.getParameter("id");
String pwd = request.getParameter("pwd");

if(id.equalsIgnoreCase("aa") && pwd.equals("11")){
	session.setAttribute("id", id);
}else{
	session.removeAttribute("id"); //특정 세션만 삭제,  session.invalidate(); 이건 모든 세션 다삭제함 위험함!
}
response.sendRedirect("login_main.jsp");
%>