package pack;

import java.sql.*;
import java.util.ArrayList;
public class MemberDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
		} catch (Exception e) {
			System.out.println("db 연결 실패: " + e);
		}
	}
	
	public boolean loginCheck(String no, String name) {
		boolean b = false;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root" , "123");
			//수정 전
			/*String sql = "select * from sawon where sawon_no=" + no  +" and sawon_name='"+ name + "'";
			pstmt = conn.prepareStatement(sql);*/
			//수정 후
			String sql = "select * from sawon where sawon_no=? and sawon_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			b=rs.next();
					
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
}
