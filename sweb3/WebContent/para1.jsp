<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String message = request.getParameter("message"); //<jsp:setProperty 사용 시 이 구문을 사용할 필요 없다.
    %>
    <jsp:useBean id="my" class="pack.Para1Class"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
** 클래스 멤버 필드에 값 설정하고 가공된 결과 읽기 **<br/>
<%
//내가 알고 있는 기술사용
my.setMessage(message);
out.println(my.getMessage());
%>
<br>
<jsp:setProperty property="message" name="my"/> <!--setter-->
<jsp:getProperty property="message" name="my"/> <!--getter-->
</body>
</html>