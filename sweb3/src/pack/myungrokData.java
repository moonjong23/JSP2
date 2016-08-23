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
	public boolean write(myungrokDto md){
		boolean b = false;
		String sql = "";
		try {
			sql = "select max(code) from guest";
			conn= ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int maxCode=0;
			//System.out.println(maxCode);
			if(rs.next()){
				maxCode=rs.getInt(1);
			}
			maxCode++;
			
			sql="insert into guest values(?,?,?,?)";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxCode);
			pstmt.setString(2, md.getName());
			pstmt.setString(3, md.getSubject());
			pstmt.setString(4, md.getContent());
			//System.out.println(maxCode + " " + md.getName() + " " + md.getSubject() + " " + md.getContent());
			int re = pstmt.executeUpdate();
			if(re == 1)b =true;
			
		} catch (Exception e) {
			System.out.println("write Err: " + e);
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
	
	public myungrokDto updateList(String name){
		myungrokDto dto = null;
		String sql = "select * from guest where name = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  name);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new myungrokDto();
				dto.setCode(rs.getString("code"));
				dto.setName(name);
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			System.out.println("updateList err: " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dto;
	}
	
	public boolean updateOk(myungrokDto bean){
		boolean b = false;
		String sql ="update guest set name=?, subject=?, content=? where code=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getCode());
			if(pstmt.executeUpdate() > 0) b = true; //성공 1 ,실패 0
		} catch (Exception e) {
			System.out.println("updateData err : " + e);
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
	
	public boolean delete(String code){
		boolean b = false;
		String sql="delete from guest where code=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			if(pstmt.executeUpdate() >= 1) b=true;
		} catch (Exception e) {
			System.out.println("updateData err : " + e);
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
