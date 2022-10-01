package jsp15_java_mail2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static jsp15_java_mail2.JdbcUtil.*;

public class MemberDAO {
	//Service에서 넘겨받을 con 객체 생성
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
	public int insertMember(MemberDTO dto){

		PreparedStatement pstmt = null;
		int count = 0;
		try {
			String sql = "INSERT INTO auth_member VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, "N");
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return count;
	}
	public boolean checkUser(MemberDTO dto) {
		boolean isLoginSuccess = false;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql = "SELECT * FROM auth_member WHERE id=? AND passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isLoginSuccess = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return isLoginSuccess;
	}
	
	public String getWriter(String id) throws Exception{
		String name="";
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql = "SELECT*FROM auth_member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			name = rs.getString("name");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return name;
	}
	public int registAuthCode(String id, String authCode) {
		int registCount = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT *FROM auth_info WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sql = "UPDATE auth_info SET auth_code=? WHERE id=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, authCode);
				pstmt2.setString(2, id);
				registCount = pstmt2.executeUpdate();
				System.out.println("인증코드 갱신 성공!");
			}else {
				sql = "INSERT INTO auth_info VALUES(?,?)";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, id);
				pstmt2.setString(2, authCode);
				registCount = pstmt2.executeUpdate();
				System.out.println("인증코드 등록 성공!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("registAuthCode - SQL 구문 오류!");
		}finally {
			close(rs);
			close(pstmt);close(pstmt2);
		}
		
		return registCount;
	}
	public boolean isAuthentication(AuthInfoDTO authInfo) {
		System.out.println("DAO - isAuthentication");
		boolean isAuthenticationSuccess = false;
		PreparedStatement pstmt = null, pstmt2=null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM auth_info WHERE id=? AND auth_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authInfo.getId());
			pstmt.setString(1, authInfo.getAuthCode());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isAuthenticationSuccess = true;
				int deleteCount=0;
				int updateCount=0;
				try {
					sql = "DELETE FROM auth_info WHERE id=?";
					pstmt2=con.prepareStatement(sql);
					pstmt2.setString(1, authInfo.getId());
					deleteCount = pstmt.executeUpdate();
					
					sql = "UPDATE auth_member SET auth_status=Y WHERE id=?";
					pstmt2=con.prepareStatement(sql);
					pstmt2.setString(1, authInfo.getId());
					updateCount = pstmt2.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("SQL 구문 오류!");
				}
				if(updateCount>0 &&deleteCount > 0) {
					isAuthenticationSuccess = true;
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("isAuthentication - SQL 구문 오류!");
		}finally {
			close(rs);
			close(pstmt);
		}
		return isAuthenticationSuccess;
	}
	public boolean isAuthenticatedUser(MemberDTO member) {
		System.out.println("DAO - isAuthenticatedUser");
		boolean isAuthenticatedUser = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM auth_member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("auth_status").equals("Y")) {
					isAuthenticatedUser = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("isAuthenticatedUser - SQL 구문 오류!");
		}
		
		return isAuthenticatedUser;
	}
	public boolean selectDuplicateId(String id) {
		// TODO Auto-generated method stub
		return false;
	}
	public ArrayList<MemberDTO> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
