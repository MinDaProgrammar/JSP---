package jsp10_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	
	public int insertReply(BoardReplyDTO dto) throws Exception {	//board_reply 테이블에 댓글 저장
		int insertCount = 0;
		Connection con = JdbcUtil.getConnection();
		String sql = "INSERT INTO board_reply VALUES(null,?,?,now(),?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getContent());
		pstmt.setInt(3, dto.getRef());
		insertCount = pstmt.executeUpdate();
		
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		
		return insertCount;
	}
	
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
	
	public int modify(BoardDTO dto) throws Exception {
		int updateCount = 0;
		Connection con = JdbcUtil.getConnection();
		
		String sql2= "SELECT passwd FROM board WHERE idx=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setInt(1, dto.getIdx());
		ResultSet rs = pstmt2.executeQuery();
		if(rs.next()) {
			if(rs.getString("passwd").equals(dto.getPasswd())){
//				System.out.println("패스워드 일치!");
				String sql = "UPDATE board SET content=?,subject=? WHERE idx=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getContent());
				pstmt.setString(2, dto.getSubject());
				pstmt.setInt(3, dto.getIdx());
				updateCount = pstmt.executeUpdate();
				JdbcUtil.close(pstmt);
			}
		}
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt2);
		JdbcUtil.close(con);		
		
		return updateCount;
	}
	
	public int delete(BoardDTO dto) throws Exception {
		int deleteCount = 0;
		Connection con = JdbcUtil.getConnection();
		
		String sql = "DELETE FROM board WHERE idx=? AND passwd=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getIdx());
		pstmt.setString(2, dto.getPasswd());
		
		deleteCount =pstmt.executeUpdate();
		
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		return deleteCount;
		
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
	
	public ArrayList selectReplyList(int idx) throws Exception{	//댓글 불러오기
		ArrayList list = new ArrayList();
		BoardReplyDTO dto = null;
		
		Connection con = JdbcUtil.getConnection();
		String sql = "SELECT * FROM board_reply WHERE ref=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			dto = new BoardReplyDTO();
			dto.setIdx(rs.getInt(1));
			dto.setId(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setDate(rs.getTimestamp(4));
			dto.setRef(rs.getInt(5));
			
			list.add(dto);
		}
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		return list;
	}
	
}

