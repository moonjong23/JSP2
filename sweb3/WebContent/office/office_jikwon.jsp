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
사번: <input type="text" name="sawon_no">
이름: <input type="text" name="sawon_name">
<input type=submit name="btnS" value="로그인">
<br><br>
</form>

</body>
</html>