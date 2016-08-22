<%@page import="pack.ConnBeanPooling"%>
<%@page import="pack.SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="connBeanPooling" class="pack.ConnBeanPooling" scope="page" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function funcUp(){
	//alert("Up");
	var code=prompt("수정할 코드 입력");
	//alert(code);
	if(code != "" && code !=null){
		location.href="dbtest2_up.jsp?code=" + code;
	}
}
function funcDel(){
	//alert("Del");
	var code=prompt("수정할 코드 입력");
	if(code != "" && code !=null){
		if(confirm("정말 삭제할까요?") == true){
		location.href="dbtest2_del.jsp?code=" + code;
		}
	}
}
</script>
</head>
<body>
<h2>** 상품 자료(beans + pooling사용) **</h2>
<a href="dbtest2_ins.html">추가</a>&nbsp;&nbsp;
<a href="javascript:funcUp()">수정</a>&nbsp;&nbsp;
<a href="javascript:funcDel()">삭제</a><br/>
<table border='1'>
	<tr><th>코드</th><th>상품명</th><th>수량</th><th>단가</th></tr>
	<%
	ArrayList<SangpumDto> list = connBeanPooling.getDataAll();
	for(SangpumDto s : list){
		%>
	<tr>
		<td><%=s.getCode() %></td>
		<td><%=s.getSang() %></td>
		<td><%=s.getSu() %></td>
		<td><%=s.getDan() %></td>
	</tr>	
	<%
	}
	%>
</table>
</body>
</html>