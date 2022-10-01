package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;

public class BoardDAO {
	public int insert(BoardDTO dto) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1=null;
		ResultSet rs = null;
		Connection con = JdbcUtil.getConnection();
		int idx=1;
		String sql1= "SELECT Max(idx) FROM board";
		try {
			pstmt=con.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idx=rs.getInt(1)+1;
			}
		} catch (SQLException e1) {
			System.out.println("SQL 구문1 오류!");
			e1.printStackTrace();
		}
		
		String sql = "INSERT INTO board VALUES(?,?,?,?,?,now(),0)";
		try {
			pstmt1=con.prepareStatement(sql);
				pstmt1.setInt(1, idx);
				pstmt1.setString(2, dto.getName());
				pstmt1.setString(3, dto.getPass());
				pstmt1.setString(4, dto.getSubject());
				pstmt1.setString(5, dto.getContent());
				
				insertCount = pstmt1.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt); JdbcUtil.close(pstmt1);
			JdbcUtil.close(con);
		}
				
		return insertCount;
	}
	public int selectListCount() {	//전체 목록 개수 반환
		int ListCount = 0;
		Connection con = JdbcUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt =null;
		String sql = "SELECT COUNT(*) FROM board";
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
	
	public int selectListCount(String keyword) {	//메서드 오버라이딩 for search 키워드에 해당하는 개수
		int ListCount = 0;
		Connection con = JdbcUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt =null;
		String sql = "SELECT COUNT(*) FROM board WHERE subject LIKE ?";
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
	
	public List<BoardDTO> selectInfo(int pageNum,int listLimit) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		int startPage = (pageNum-1)*listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql = "SELECT*FROM board ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startPage);
			pstmt.setInt(2, listLimit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
				
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
	
	//메서드 오버라이딩 for search 제목으로 검색
	public List<BoardDTO> selectInfo(int pageNum,int listLimit, String keyword) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		int startPage = (pageNum-1)*listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection con = JdbcUtil.getConnection();
		String kw = "%"+keyword+"%";
		try {
			String sql = "SELECT*FROM board WHERE subject LIKE ? ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kw);
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
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
	
	public List<BoardDTO> selectInfo(String keyword, int pageNum,int listLimit) { //메서드 오버라이딩 2 제목으로 검색
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		int startPage = (pageNum-1)*listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection con = JdbcUtil.getConnection();
		String kw = "%"+keyword+"%";
		try {
			String sql = "SELECT*FROM board WHERE name LIKE ? ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kw);
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
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
	
	public List<BoardDTO> selectInfo(int pageNum,String keyword, int listLimit) { //메서드 오버라이딩 3 내용
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		int startPage = (pageNum-1)*listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Connection con = JdbcUtil.getConnection();
		String kw = "%"+keyword+"%";
		try {
			String sql = "SELECT*FROM board WHERE content LIKE ? ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kw);
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setReadcount(rs.getInt("readcount"));
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
	public void updateReadcount(int idx) {	//notice_content.jsp 조회수 증가
		PreparedStatement pstmt2 = null;
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql2 = "UPDATE board SET readcount=readcount+1 WHERE idx=?";
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, idx);
			pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!");
			e.printStackTrace();
		}
		
	}
	public BoardDTO selectBoard(int idx) {	// notice.jsp 에 있는 목록에서 1개 글 가져오기
		BoardDTO dto = new BoardDTO();
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		Connection con = JdbcUtil.getConnection();
		
		
		try {
			String sql = "SELECT*FROM board WHERE idx=?";
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
	
	public boolean checkPass(BoardDTO dto) {
		boolean passCheck = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql = "SELECT*FROM board WHERE idx=? AND pass=?";
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
	
	
	public int updateBoard(BoardDTO dto) {
		int updateCount = 0;
		PreparedStatement pstmt =null;
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql ="UPDATE board SET content=?, subject=?,name=? WHERE idx=?";
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
	
	public int deleteBoard(BoardDTO dto) {
		int deleteCount =0;
		PreparedStatement pstmt = null;
		Connection con = JdbcUtil.getConnection();
		
		try {
			String sql="DELETE FROM board WHERE idx=? AND pass=?";
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




