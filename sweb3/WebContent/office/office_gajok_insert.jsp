<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가족 추가하기</title>
</head>
<body>
<%
String gogek_no = (String)session.getAttribute("gogek_no");
String gogek_name = (String)session.getAttribute("gogek_name");
%>
<%=gogek_name+"고객님의 가족등록하기!" %>
<form action="office_gogek_insertOk.jsp" name="frm">
이름 : <input type="text" name="f_irum">
전화번호 : <input type="text" name="f_tel">&nbsp;
<input type="submit" value="가족등록하기">
<input type="reset" value="다시쓰기">
</form>
</body>
</html>