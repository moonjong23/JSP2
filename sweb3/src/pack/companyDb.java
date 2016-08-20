package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class companyDb {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String buserName;
	
	public void setBuserName(String buserName) {
		this.buserName = buserName;
	}
	
	
	public companyDb() {try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root" , "123");
		
		} catch (Exception e) {
			System.out.println("db 연결 실패: " + e);
		}
	}
	
	public ArrayList<companyDto> getData(){
		ArrayList<companyDto> list = new ArrayList<>();
		//System.out.println("db까지 간 " + buserName);
		try {
			String sql = "select sawon_no, sawon_name, sawon_jik, sawon_gen from "
					+ "sawon inner join buser on buser_num = buser_no where buser_name=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buserName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				companyDto dto = new companyDto();
				dto.setSawonNo(rs.getString("sawon_no"));
				dto.setSawonName(rs.getString("sawon_name"));
				dto.setSawonJik(rs.getString("sawon_jik"));
				dto.setSawonGen(rs.getString("sawon_gen"));
				list.add(dto);
			}
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
		return list;
	}
}













