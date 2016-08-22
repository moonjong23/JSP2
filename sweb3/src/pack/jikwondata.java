package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class jikwondata {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public jikwondata() {
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
			String sql = "select sawon_no, sawon_name, sawon_jik "
					+ "from sawon order by sawon_no";
			conn= ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				jikwonDto dto = new jikwonDto();
				dto.setSawon_no(rs.getString("sawon_no"));
				dto.setSawon_name(rs.getString("sawon_name"));
				dto.setSawon_jik(rs.getString("sawon_jik"));
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
