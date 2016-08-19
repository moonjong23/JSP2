<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
    <jsp:useBean id="fruit" class="pack.fruitBean" />
    <jsp:setProperty property="*" name="fruit" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
과일 <jsp:getProperty property="name" name="fruit"/>의 구매가격은<br/>
정가 <jsp:getProperty property="danga" name="fruit"/>원 에서<br/>
<jsp:getProperty property="discount" name="fruit"/>% 인 <br/>
<jsp:useBean id="fruitpp" class="pack.fruitProcess"/>
<jsp:setProperty property="fruitbean" name="fruitpp" value="<%=fruit %>"/>
<jsp:getProperty property="tot" name="fruitpp"/>원 할인된<br/>
<jsp:getProperty property="last" name="fruitpp"/>원 입니다.
</body>
</html>