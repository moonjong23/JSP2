<%@page import="pack.myungrokDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnIns").click(function(){
		//alert("추가");
		if($("#name").val()=== ""){
			alert("이름을 입력하세요");
			return;
		}
		if($("#subject").val()=== ""){
			alert("제목을 입력하세요");
			return;
		}
		if($("#content").val()=== ""){
			alert("내용을 입력하세요");
			return;
		}
		$("#frm").submit();
	});
});

	function funcWrite(){
		location.href="myungrok.jsp";
	}
</script>
</head>
<body>
<h1><b>내용을 입력하세요.</b></h1>
<br>
<form name="frm" id="frm" method="post" action="myungrokWrite.jsp">
	코드: <input type="hidden" name="code" id="code">
<table border='1'>
	<tr><td>작성자: <input type="text" name="name" id="name"></td></tr>
	<tr><td>제목: <input type="text" name="subject" id="subject"></td></tr>
	<tr><td width="50" height="100">내용: <input type="text" name="content" id="content"></td></tr>
</table>
<br><hr/>
<input type="submit" value="자료추가" id="btnIns">&nbsp;&nbsp;
<input type="reset" value="다시입력">&nbsp;&nbsp;
<input type="button" onclick="javascript:funcWrite()" value="목록으로 돌아가기" id="btnList">
</form>
</body>
</html>