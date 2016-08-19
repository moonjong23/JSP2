<%@page import="pack.Gugudan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
** 방법1 : 현재 내 기술로 처리하기 **<br/>
<%
int dan = Integer.parseInt(request.getParameter("dan"));
out.println(dan + "출력<p>");

//Gugudan gugudan = new Gugudan(); //클레스의 포함관계 : 클라이언트의 요청만큼 객체가 생성된다.
Gugudan gugudan = Gugudan.getInstance();  //클레스의 포함관계 : singleton
int re[] = gugudan.compute(dan);
for(int a =0; a<9; a++){
	out.println(dan + "*" + (a+1) + "=" + re[a] + "&nbsp;");
}
%>
<hr>
** 방법2 : 빈즈로 처리하기 **<br/>

<jsp:useBean id="gugu" class="pack.Gugudan"/> <!--자바의클래스를 사용 싱글톤 처리함-->
<%
System.out.println(gugu.toString());
int re2[] = gugu.compute(dan);
for(int a =0; a<9; a++){
	out.println(dan + "*" + (a+1) + "=" + re2[a] + "&nbsp;");
}
%>

</body>
</html>