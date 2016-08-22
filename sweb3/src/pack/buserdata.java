package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.xml.ws.Response;

import org.apache.catalina.connector.Request;

public class buserdata {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	private String sawon_name;
	
	public void setSawon_name(String sawon_name) {
		this.sawon_name = sawon_name;
	}
	
	public buserdata() {
		try {
			Context context = new InitialContext();  //java naming;
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria"); //  "java:comp/env/~~" :필수키워드
		} catch (Exception e) {
			System.out.println("DB연결 실패: " + e);
		}
	}
	
	public ArrayList<jikwonDto> getData(){
		ArrayList<jikwonDto> list = new ArrayList<>();
		try {
			String sql = "select buser_no, buser_name, buser_tel, buser_loc "
					+ "from buser inner join sawon on buser_num=buser_no "
					+ "where sawon_name=? "
					+ "order by sawon_no";
			conn= ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			//System.out.println(sawon_name);
			pstmt.setString(1, sawon_name);
			rs = pstmt.executeQuery();
			while(rs.next()){
				jikwonDto dto = new jikwonDto();
				dto.setBuser_no(rs.getString("buser_no"));
				dto.setBuser_name(rs.getString("buser_name"));
				dto.setBuser_tel(rs.getString("buser_tel"));
				dto.setBuser_loc(rs.getString("buser_loc"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getData err: " + e);
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
