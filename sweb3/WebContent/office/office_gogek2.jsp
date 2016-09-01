<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<h2><i>강남물산</i></h2>
<hr/>
<h4><b>고객 로그인</b></h4>
<br>
<form action="office_gogek_loginCheck.jsp">
<input type="hidden" name="gogek_no">
<input type="hidden" name="gogek_name">
<%="<b>고객번호 " + session.getAttribute("gogek_no") +", " +session.getAttribute("gogek_name") + " 고객님 환영합니다.</b>" %>
<input type="submit" value="로그아웃!">
<br>
</form>
<a href="office_gajokMy.jsp" target="frame">가족목록보기</a>&nbsp;
<a href="office_gajok_insert.jsp" target="frame">가족 추가하기</a>&nbsp;
<a href="office_main.jsp">첫 화면으로 돌아가기</a>
<br>


<br><br>
</body>
</html>