package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;

public class FileBoardDAO {
	public int insertFileBoard(FileBoardDTO dto) {
		int insertCount =0;
		int idx=1;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 =null;
		ResultSet rs = null;
		Connection con  =JdbcUtil.getConnection();
		try {
			String sql = "SELECT MAX(idx) FROM file_board";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idx=rs.getInt(1)+1;
			}
			
			String sql2 = "INSERT INTO file_board VALUES(?,?,?,?,?,?,?,now(),0)";
			pstmt2=con.prepareStatement(sql2);
			pstmt2.setInt(1, idx);
			pstmt2.setString(2, dto.getName());
			pstmt2.setString(3, dto.getPass());
			pstmt2.setString(4, dto.getSubject());
			pstmt2.setString(5, dto.getContent());
			pstmt2.setString(6, dto.getRealFile());
			pstmt2.setString(7, dto.getOriginalFile());
			insertCount = pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertFileBoard SQL 구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);JdbcUtil.close(pstmt2);
			JdbcUtil.close(rs);
		}
		return insertCount;
	}
	
	public int selectFileListCount() {	//전체 목록 개수 반환
		int ListCount = 0;
		Connection con = JdbcUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt =null;
		String sql = "SELECT COUNT(*) FROM file_board";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
	
		return ListCount;
	}
	
	public int selectFileListCount(String keyword) {	//메서드 오버라이딩 for search 키워드에 해당하는 개수
		int ListCount = 0;
		Connection con = JdbcUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt =null;
		String sql = "SELECT COUNT(*) FROM file_board WHERE subject LIKE ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, '%'+keyword+'%');
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
	
		return ListCount;
	}
	
	public List selectFileInfo(int pageNum,int listLimit) {
		List list = new ArrayList();
		int startPage = (pageNum-1)*listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql = "SELECT*FROM file_board ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startPage);
			pstmt.setInt(2, listLimit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FileBoardDTO dto = new FileBoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRealFile(rs.getString("real_file"));
				dto.setOriginalFile(rs.getString("original_file"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return list;
	}
	
	//메서드 오버라이딩 for search
	public List selectFileInfo(int pageNum,int listLimit, String keyword) {
		List list = new ArrayList();
		int startPage = (pageNum-1)*listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection con = JdbcUtil.getConnection();
		String kw = "%"+keyword+"%";
		try {
			String sql = "SELECT*FROM file_board WHERE subject LIKE ? ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kw);
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FileBoardDTO dto = new FileBoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRealFile(rs.getString("real_file"));
				dto.setOriginalFile(rs.getString("original_file"));
				System.out.println(dto.getSubject());
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return list;
	}
	
	public List selectFileInfo(String keyword, int pageNum,int listLimit) {	//메서드 오버라이딩 2 작성자로 검색
		List list = new ArrayList();
		int startPage = (pageNum-1)*listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection con = JdbcUtil.getConnection();
		String kw = "%"+keyword+"%";
		try {
			String sql = "SELECT*FROM file_board WHERE name LIKE ? ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kw);
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FileBoardDTO dto = new FileBoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRealFile(rs.getString("real_file"));
				dto.setOriginalFile(rs.getString("original_file"));
				System.out.println(dto.getSubject());
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return list;
	}
	
	public List selectFileInfo(int pageNum,String keyword, int listLimit) { //메서드 오버라이딩3 내용으로 검색
		List list = new ArrayList();
		int startPage = (pageNum-1)*listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection con = JdbcUtil.getConnection();
		String kw = "%"+keyword+"%";
		try {
			String sql = "SELECT*FROM file_board WHERE content LIKE ? ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kw);
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FileBoardDTO dto = new FileBoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRealFile(rs.getString("real_file"));
				dto.setOriginalFile(rs.getString("original_file"));
				System.out.println(dto.getSubject());
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return list;
	}
	
	public void updateFileReadcount(int idx) {	//notice_content.jsp 조회수 증가
		PreparedStatement pstmt2 = null;
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql2 = "UPDATE file_board SET readcount=readcount+1 WHERE idx=?";
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, idx);
			pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!");
			e.printStackTrace();
		}
		
	}
	public FileBoardDTO selectFileBoard(int idx) {	// driver.jsp 에 있는 목록에서 1개 글 가져오기
		FileBoardDTO dto = new FileBoardDTO();
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		Connection con = JdbcUtil.getConnection();
		
		
		try {
			String sql = "SELECT*FROM file_board WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRealFile(rs.getString("real_file"));
				dto.setOriginalFile(rs.getString("original_file"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		
		return dto;
	}
	
	public boolean checkPass(FileBoardDTO dto) {
		boolean passCheck = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql = "SELECT*FROM file_board WHERE idx=? AND pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getIdx());
			pstmt.setString(2, dto.getPass());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				passCheck= true;
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return passCheck;
	}
	
	
	public int updateFileBoard(FileBoardDTO dto) {
		int updateCount = 0;
		PreparedStatement pstmt =null;
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql ="UPDATE file_board SET content=?, subject=?,name=? WHERE idx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getName());
			pstmt.setInt(4, dto.getIdx());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL UPDATE 구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return updateCount;
	}
	
	public int deleteFileBoard(FileBoardDTO dto) {
		int deleteCount =0;
		PreparedStatement pstmt = null;
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql="DELETE FROM file_board WHERE idx=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getIdx());
			pstmt.setString(2, dto.getPass());
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!");
			e.printStackTrace();
		}
		
		return deleteCount;		
	}
}




