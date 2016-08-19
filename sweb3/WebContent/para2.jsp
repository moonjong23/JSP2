<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    //String name= request.getParameter("name"); //이런 식 안함.
    %>
    <jsp:useBean id="bean" class="pack.ExamBean" />
    <!--
    <jsp:setProperty property="name" name="bean" />
    -->
<jsp:setProperty property="*" name="bean" />
<%
//System.out.println(bean.getName()+" "+bean.getKor());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
폼빈에 등록된 사용자의 자료 출력<br/>
이름은 <jsp:getProperty property="name" name="bean"/><br/>
국어는 <jsp:getProperty property="kor" name="bean"/><br/>
영어는 <jsp:getProperty property="eng" name="bean"/><br/>
<jsp:useBean id="examProcess" class="pack.ExamProcess" /> <!--pack.ExamProcess examProcess = new  pack.ExamProcess();-->
<jsp:setProperty property="examBean" name="examProcess" value="<%=bean%>"/>
총점은 <jsp:getProperty property="tot" name="examProcess" /><br/>
평균은 <jsp:getProperty property="avg" name="examProcess" /><br/>

</body>
</html>