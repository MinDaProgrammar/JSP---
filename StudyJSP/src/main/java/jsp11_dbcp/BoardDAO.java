package jsp11_dbcp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	
	public int insert(BoardDTO dto) throws Exception {	//입력받은 값을 mysql에 저장하는 메서드
		
		Connection con = JdbcUtil.getConnection();
		String sql = "INSERT INTO board VALUES(null,?,?,?,?,now(),0)";	//mysql 에 들어갈 SQL구문 작성
		PreparedStatement pstmt = con.prepareStatement(sql);	//preparedStatement 객체로 구문을 전달 및 물음표 값 채우기
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getSubject());
		pstmt.setString(4, dto.getContent());
		int insertCount = pstmt.executeUpdate();	//구문 실행 및 영향받은 row의 개수를 insertCount애 저장
		
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		
		return insertCount;	//Insert가 잘 실행됬는지 확인을 위한 insertCount 리턴(0일시 실패, 0초과면 성공)
	}
	
	public void updateReadcount(int idx) throws Exception{
		Connection con = JdbcUtil.getConnection();
		String sql ="UPDATE board SET readcount=readcount+1 WHERE idx=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.executeUpdate();
		
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		
	}
	
	public BoardDTO selectDetail(int idx) throws Exception {	//선택된 제목의 내용을 출력하기 메서드
		BoardDTO dto = null;
		Connection con = JdbcUtil.getConnection();
		
		String sql2 = "SELECT * FROM board WHERE idx=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setInt(1, idx);
		
		
		
		ResultSet rs = pstmt2.executeQuery();
		if(rs.next()) {
			dto = new BoardDTO();
			dto.setName(rs.getString("name"));
			dto.setIdx(rs.getInt("idx"));
//			dto.setPasswd(rs.getString("passwd"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setDate(rs.getDate("date"));
			dto.setReadcount(rs.getInt("readcount"));
		}
		
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt2);
		JdbcUtil.close(con);
		
		return dto;
	}
	
	
	public int selectListCount() throws Exception {
		int count=0;
		Connection con = JdbcUtil.getConnection();
		String sql = "SELECT COUNT(*) FROM board";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			count=rs.getInt(1);
		}
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		return count;
	}

	public ArrayList selectInfo(int pageNum, int listLimit) throws Exception {
		ArrayList list = new ArrayList();
		BoardDTO dto = null;
		int startRow = (pageNum-1)*listLimit;
		Connection con = JdbcUtil.getConnection();
		
		String sql = "SELECT*FROM board ORDER BY idx DESC LIMIT ?,?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, listLimit);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			dto = new BoardDTO();
			dto.setName(rs.getString("name"));
			dto.setIdx(rs.getInt("idx"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setDate(rs.getDate("date"));
			dto.setReadcount(rs.getInt("readcount"));
			
			list.add(dto);
		}
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		return list;
	}
	
}
