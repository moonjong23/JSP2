package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class office_gogekDb {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public office_gogekDb() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("Db연결실패: " + e);
		}
	}
	
	public ArrayList<office_gogekDto> getdataAll(String gogek_no,String gogek_name){
		ArrayList<office_gogekDto> list = new ArrayList<>();
		try {
			String sql="select * from gajok inner join gogek on gogek_no=f_gogek_no "
						+ "where gogek_no = ? and gogek_name = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gogek_no);
			pstmt.setString(2, gogek_name);
			rs = pstmt.executeQuery();
			while(rs.next()){
				office_gogekDto dto = new office_gogekDto();
				dto.setF_bun(rs.getInt("f_bun"));
				dto.setF_irum(rs.getString("f_irum"));
				dto.setF_tel(rs.getString("f_tel"));
				dto.setF_gogek_no(rs.getInt("f_gogek_no"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getdataAll err: " + e);
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

	public boolean insert(office_gogekBean bean){
		boolean b = false;
		try {
			//System.out.println("db: " +bean.getGogek_no() + bean.getF_irum() +bean.getF_tel());
			String sql="insert into gajok (f_irum, f_tel, f_gogek_no) values(?,?,?)";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getF_irum());
			pstmt.setString(2, bean.getF_tel());
			pstmt.setString(3, bean.getGogek_no());
			int re= pstmt.executeUpdate();
			if(re > 0) b= true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
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
	
	public boolean gogekCheck(office_gogekBean bean){
		boolean b = false;
		try{
			String sql="select gogek_no, gogek_name from gogek "
					+"where gogek_no=? and gogek_name=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getGogek_no());
			pstmt.setString(2, bean.getGogek_name());
			rs = pstmt.executeQuery();
			if(rs.next()){
				b = true;
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
		return b;
	}
}//office_gogekDb 끝
