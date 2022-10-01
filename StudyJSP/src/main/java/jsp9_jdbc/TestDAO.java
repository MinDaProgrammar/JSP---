package jsp9_jdbc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestDAO {

	public int insert(TestDTO dto) throws Exception{
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		
		String sql= "INSERT INTO test3 VALUES(?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getIdx());
		pstmt.setString(2, dto.getName());
	
		int insertCount = pstmt.executeUpdate();
		System.out.println("INSERT 작업 성공! - "+insertCount+"개 레코드");
		
		pstmt.close();
		con.close();
		
		return insertCount;
	}
	
	public TestDTO selectInfo(int idx) throws Exception {
		TestDTO dto = null;
		System.out.println("selectInfo() 메서드 호출됨");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url ="jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Connection con = DriverManager.getConnection(url,user,password);
		
		String sql = "SELECT*FROM test3 WHERE idx = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			dto = new TestDTO();
//			System.out.println("컬럼1: "+rs.getInt(1));
			dto.setIdx(rs.getInt(1)); 
//			System.out.println("컬럼2: "+rs.getString(2));
			dto.setName(rs.getString(2));
		}
		
		
		rs.close();
		pstmt.close();
		con.close();
		return dto;
	}
}
