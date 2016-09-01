<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String sawon_no= request.getParameter("sawon_no");
String sawon_name = request.getParameter("sawon_name");
System.out.println(sawon_no+" "+sawon_name);

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
DataSource ds = null;
boolean result = false;

		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("Db연걸실패: " + e);
		}
		
		try{
			String sql="select sawon_no, sawon_name from sawon "
					+"where sawon_no=? and sawon_name=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sawon_no);
			pstmt.setString(2, sawon_name);
			rs = pstmt.executeQuery();
			while(rs.next()){
				result = true;
				System.out.println("sql 데이터 확인");
			}
		}catch(Exception e){
			System.out.println("sql접속 Err: " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	

if(result){
	session.setAttribute("sawon_no", sawon_no);
	session.setAttribute("sawon_name", sawon_name);
	System.out.println("로그인 성공");
}else{
	session.removeAttribute("sawon_no"); //특정 세션만 삭제
	session.removeAttribute("sawon_name");
}
response.sendRedirect("office_jikwon_login.jsp");
%>