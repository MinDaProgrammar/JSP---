package jsp10_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MemberDAO {
	Connection con;
	//싱글톤 DAO 생성하기
	private static MemberDAO dao = new MemberDAO();
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		return dao;
	}
	
	public void setConnection(Connection con) {
		this.con=con;
	}
	public int insertMember(MemberDTO dto) throws Exception{
		
		String sql = "INSERT INTO member VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getId());
		pstmt.setString(3, dto.getPasswd());
		pstmt.setString(4, dto.getEmail());
		pstmt.setString(5, dto.getGender());
		int count = pstmt.executeUpdate();
		
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		
		return count;
	}
	public boolean checkUser(MemberDTO dto) throws Exception {
		boolean isLoginSuccess = false;
		Connection con = JdbcUtil.getConnection();
		
		String sql = "SELECT * FROM member WHERE id=? AND passwd=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			isLoginSuccess = true;
		}
		
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		return isLoginSuccess;
	}
	
	public String getWriter(String id) throws Exception{
		String name="";
		Connection con = JdbcUtil.getConnection();
		String sql = "SELECT*FROM member WHERE id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		name = rs.getString("name");
		
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		return name;
	}
}
