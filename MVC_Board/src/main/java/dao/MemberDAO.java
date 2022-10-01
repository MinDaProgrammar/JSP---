package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import vo.MemberDTO;

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
	public int insertMember(MemberDTO member) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPasswd());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPost_code());
			pstmt.setString(6, member.getAddress1());
			pstmt.setString(7, member.getAddress2());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insertMember - SQL 구문 오류!");
		}finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	public boolean selectDuplicateId(String id) {
		boolean isDuplicate = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("MemberDAO - checkId");
		try {
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isDuplicate = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("CheckId() - SQL 구문 오류!");			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return isDuplicate;
	}
	public boolean memberLogin(String id, String pass) {
		boolean isLoginSuccess = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("DAO - memberLogin");
		
		try {
			String sql = "SELECT*FROM member WHERE id=? AND passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isLoginSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO memberLogin() - SQL 구문 오류!!");
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return isLoginSuccess;
	}
	public ArrayList<MemberDTO> selectMemberList() {
		System.out.println("DAO selectMemberList()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			String sql = "SELECT*FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setEmail(rs.getString("email"));
				dto.setPost_code(rs.getString("post_code"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setHire_date(rs.getDate("hire_date"));
				System.out.println(dto);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO selectMemberList - SQL 구문 오류!");
		}finally {
			close(rs);
			close(pstmt);
		}
	
		return list;
	}
	
}
