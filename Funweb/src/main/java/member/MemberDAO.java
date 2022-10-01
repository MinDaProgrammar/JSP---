package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;

public class MemberDAO {
	public int insert(MemberDTO dto){
		int insertCount =0;
		Connection con = JdbcUtil.getConnection();
		String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,now())";
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getPhone());
			pstmt.setString(7, dto.getMobile());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return insertCount;
	}
	
	public boolean login(MemberDTO dto) {
		boolean isLoginSuccess = false;
		Connection con = JdbcUtil.getConnection();
		String sql = "SELECT*FROM member WHERE id=? AND pass=?";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생!");
			e.printStackTrace();
		}
		try {
			if(rs.next()) {
				isLoginSuccess = true;
			}else {
				isLoginSuccess = false;
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생!");
			e.printStackTrace();
		}finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		}
		return isLoginSuccess;
	}
	
	public boolean checkDup(MemberDTO dto){
		boolean overlap = false;
		Connection con = JdbcUtil.getConnection();
		String sql = "SELECT*FROM member WHERE id=?";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				overlap=true;
			}else {
				overlap = false;
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류"+e.getMessage());
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return overlap;
	}
	
	public MemberDTO select(String id) {
		MemberDTO dto = new MemberDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = JdbcUtil.getConnection();
		String sql = "SELECT*FROM member WHERE id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setAddress(rs.getString(5));
				dto.setPhone(rs.getString(6));
				dto.setMobile(rs.getString(7));
				dto.setDate(rs.getDate(8));
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return dto;
	}
}
