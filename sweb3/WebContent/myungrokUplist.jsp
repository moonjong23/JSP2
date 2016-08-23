<%@page import="pack.myungrokDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String code = request.getParameter("code");
%>
<jsp:useBean id="myungrokdata" class="pack.myungrokData" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정하기</title>
</head>
<body>
<%
myungrokDto dto = myungrokdata.updateList(name);
if(dto == null){
%>
	<script>
		alert("등록된 이름이 아닙니다. \n확인 바람");
		location.href="myungrok.jsp";
	</script>
<%
return;
}
%>
<h1>***방명록 수정하기***</h1>
<hr/>
<form action="myungrokUp.jsp" method="post">
<h3>코드:<%=code%></h3>
<input type="hidden" name="code" value="<%=dto.getCode() %>">
이름: <input type="text" name="name" value="<%=dto.getName() %>"><br>
제목: <input type="text" name="subject" value="<%=dto.getSubject() %>"><br>
내용: <input type="text" name="content" value="<%=dto.getContent() %>"><br>
<input type="submit" value="자료 수정 확인">
<input type="reset" value="다시 쓰기">
<input type="button" value="목록보기로 이동" 
	onclick="javascript:location.href='myungrok.jsp'">
	</form>
</body>
</html>