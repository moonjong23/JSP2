package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class office_Db {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;


	public office_Db() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("Db연걸실패: " + e);
		}
	}
	
	public ArrayList<office_Dto> getdataAll(){
		ArrayList<office_Dto> list = new ArrayList<>();
		try {
			String sql="select gogek_no, gogek_name, gogek_jumin, gogek_tel "
					+ "from sawon inner join gogek on sawon_no=gogek_damsano "
					+ "order by gogek_no";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				office_Dto dto = new office_Dto();
				dto.setGogek_no(rs.getString("gogek_no"));
				dto.setGogek_name(rs.getString("gogek_name"));
				dto.setGogek_jumin(rs.getString("gogek_jumin"));
				dto.setGogek_tel(rs.getString("gogek_tel"));
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
	
	public ArrayList<office_Dto> getdataMy(String sabun, String name){
		ArrayList<office_Dto> list = new ArrayList<>();
		try {
			String sql="select sawon_no, sawon_name, "
					+ "gogek_no, gogek_name, gogek_jumin, gogek_tel "
					+ "from sawon inner join gogek on sawon_no=gogek_damsano "
					+ "where sawon_no=? and sawon_name=? order by gogek_no ";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sabun);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			while(rs.next()){
				office_Dto dto = new office_Dto();
				dto.setSawon_no(rs.getString("sawon_no"));
				dto.setSawon_name(rs.getString("sawon_name"));
				dto.setGogek_no(rs.getString("gogek_no"));
				dto.setGogek_name(rs.getString("gogek_name"));
				dto.setGogek_jumin(rs.getString("gogek_jumin"));
				dto.setGogek_tel(rs.getString("gogek_tel"));
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
