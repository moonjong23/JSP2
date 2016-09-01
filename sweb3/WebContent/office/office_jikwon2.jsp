<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 로그인</title>
</head>
<body>
<h2><i>강남물산</i></h2>
<hr/>
<h4><b>직원 로그인</b></h4>
<br>
<form action="office_jikwon_loginCheck.jsp" name="frm" method="post">
<%="사번 "+session.getAttribute("sawon_no")+"번의 "+ session.getAttribute("sawon_name") + "님이 로그인 중" %>
<input type="hidden" name="sawon_no">
<input type="hidden" name="sawon_name">
<input type="submit" name="btnS" value="로그아웃">
<br>
<a href="office_jikwon_view.jsp" target="frame">고객정보 보기</a>&nbsp;
<a href="office_main.jsp">첫 화면으로 이동</a>
</form>

</body>
</html>