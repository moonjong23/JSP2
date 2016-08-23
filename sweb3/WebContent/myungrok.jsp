<%@page import="pack.myungrokDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="myungrokdata" class="pack.myungrokData" scope="page"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 만들기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
function funcWrite(){
	//var code = $("#code").text();
	//alert(code);
	location.href="myungrokWritelist.jsp";
}

function funcUp(name){
	alert(name);
	location.href="myungrokUplist.jsp?name=" + name;
}

function funcDel(code){
	//alert(code);
	if(confirm("정말 삭제하시겠습니까?") == true)
	location.href="myungrokDel.jsp?code=" + code;
}

</script>
</head>
<body>
<h1>**방명록 만들기**</h1>
<hr/>
<a href="javascript:funcWrite()"><i style="font-size:30px;">글 쓰기!</i></a>
<br><br>
<table border='1'>
	<tr>
		<th>코드</th><th>작성자</th><th>제목</th><th>내용</th>
	</tr>
<%
	ArrayList<myungrokDto> list= myungrokdata.getDataAll();
	for(myungrokDto d : list){
%>
	<tr>
		<td><a href="javascript:funcDel(<%=d.getCode() %>)"><%=d.getCode() %></a></td>
		<td><a href="javascript:funcUp('<%=d.getName()%>')"><%=d.getName()%></a></td>
		<td><%=d.getSubject() %></td>
		<td><%=d.getContent() %></td>
	</tr>
<%		
	}
%>
</table>
<br>
<b>코드를 클릭하면 삭제, 작성자를 클릭하면 수정합니다.</b>
</body>
</html>