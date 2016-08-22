package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class myungrokData {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public myungrokData() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("Db연걸실패: " + e);
		}
	}
	public ArrayList<myungrokDto> getDataAll(){
		ArrayList<myungrokDto> list = new ArrayList<>();
		try {
			String sql= "select code, name, subject, content from guest";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				myungrokDto dto = new myungrokDto();
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getDataAll 실패: " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
		
	}
	
}
