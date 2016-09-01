<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String gogek_no = request.getParameter("gogek_no") ; 
	String gogek_name = request.getParameter("gogek_name");
%>
	<jsp:useBean id="gogekDb" class="pack.office_gogekDb"/>
	<jsp:useBean id="bean" class="pack.office_gogekBean"/>
	<jsp:setProperty property="*" name="bean"/>
<%
	boolean b = gogekDb.gogekCheck(bean);
	
if(b){
session.setAttribute("gogek_no", gogek_no);
session.setAttribute("gogek_name", gogek_name);
}else{
session.removeAttribute("gogek_no"); //특정 세션만 삭제
session.removeAttribute("gogek_name");
}
%>
 response.sendRedirect("office_gogek_login.jsp");





