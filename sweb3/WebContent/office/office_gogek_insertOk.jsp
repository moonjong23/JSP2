<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="pack.office_gogekBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="db" class="pack.office_gogekDb"/>

<%
String gogek_no = (String)session.getAttribute("gogek_no");
String f_irum = request.getParameter("f_irum");
String f_tel = request.getParameter("f_tel");

//System.out.println("gogek_insertOk= gogek_no: " + gogek_no +
//		", f_irum: " + f_irum + ", f_tel: " + f_tel);

bean.setGogek_no(gogek_no);
bean.setF_irum(f_irum);
bean.setF_tel(f_tel);

boolean b = false;
db.insert(bean);
if(b = true){
	out.println("업데이트 성공.");	
}else{
	out.println("업데이트 실패.");
}


%>

