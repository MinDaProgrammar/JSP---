package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.BoardDTO;
import static db.JdbcUtil.*;
//싱글톤 디자인 패턴
public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {	///Singleton 
		return instance;
	}
	
	private Connection con;	//Connection 

	public void setConnection(Connection con) {	//service 클래스로부터 connection 객체를 받아옴
		this.con = con;
	}

	//글쓰기 입력
	public int insertBoard(BoardDTO board) {	//글쓰기 작업
		System.out.println("BoardDAO - insertBoard()");
		int insertCount = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		int num = 1;
		try {
			String sql2= "SELECT MAX(board_num) FROM board";
			pstmt2 = con.prepareStatement(sql2);
			rs = pstmt2.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}
		} catch (SQLException e) {
			System.out.println("Max(board_num) 받아오기 실패");
			e.printStackTrace();
		}
		
		try {
			String sql = "INSERT INTO board VALUES(?,?,?,?,?,?,?,?,0,0,0,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2,board.getBoard_name());
			pstmt.setString(3, board.getBoard_pass());
			pstmt.setString(4, board.getBoard_subject());
			pstmt.setString(5, board.getBoard_content());
			pstmt.setString(6, board.getBoard_file());
			pstmt.setString(7, board.getBoard_real_file());
			pstmt.setInt(8, num);
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("INSERT SQL 실패");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt2);
			close(pstmt);
		}
		
		
		return insertCount;
	}

	//글 개수 불러오기
	public int selectListCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("selectListCount() sql 구문 실패!");
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return listCount;
	}

	//글전체 목록 불러오기(1페이지)
	public ArrayList<BoardDTO> selectBoardList(int pageNum, int listLimit) {
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startRow = (pageNum-1)*listLimit;
		String sql="SELECT*FROM board ORDER BY board_re_ref DESC, board_re_seq ASC LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimit);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_num(rs.getInt(1));
				dto.setBoard_name(rs.getString(2));
				dto.setBoard_pass(rs.getString(3));
				dto.setBoard_subject(rs.getString(4));
				dto.setBoard_content(rs.getString(5));
				dto.setBoard_file(rs.getString(6));
				dto.setBoard_real_file(rs.getString(7));
				dto.setBoard_re_ref(rs.getInt(8));
				dto.setBoard_re_lev(rs.getInt(9));
				dto.setBoard_re_seq(rs.getInt(10));
				dto.setBoard_readcount(rs.getInt(11));
				dto.setBoard_date(rs.getDate(12));
				
//				System.out.println(dto.getBoard_content());
//				System.out.println(dto.getBoard_name());
//				System.out.println("확인중");
				boardList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("selectBoardList SQL 구문 오류!");
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardList;
	}

	//조회수 1개 증가
	public void updateReadcount(int board_num) {
		PreparedStatement pstmt = null;
		String sql="UPDATE board SET board_readcount=board_readcount+1 WHERE board_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("UPDATE Readcount 실패!");
		}finally {
			close(pstmt);
		}
	}

	//글 상세보기
	public BoardDTO selectBoard(int board_num) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT*FROM board WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_name(rs.getString("board_name"));
				dto.setBoard_pass(rs.getString("board_pass"));
				dto.setBoard_subject(rs.getString("board_subject"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_file(rs.getString("board_file"));
				dto.setBoard_real_file(rs.getString("board_real_file"));
				dto.setBoard_re_ref(rs.getInt("board_re_ref"));
				dto.setBoard_re_lev(rs.getInt("board_re_lev"));
				dto.setBoard_re_seq(rs.getInt("board_re_seq"));
				dto.setBoard_readcount(rs.getInt("board_readcount"));
				dto.setBoard_date(rs.getDate("board_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SELECT BOARD SQL 구문 오류!");
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return dto;
	}

	//글 수정 및 삭제 전 사용자 비밀번호 확인 작업
	public boolean isBoardWriter(int board_num, String board_pass) {	
		boolean isBoardWriter = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql="SELECT*FROM board WHERE board_num=? AND board_pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, board_pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isBoardWriter = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("isBoardWriter SQL 구문 오류!");
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return isBoardWriter;
	}

	//글삭제
	public boolean deleteBoard(int board_num, String board_pass) {
		boolean isDelete = false;
		PreparedStatement pstmt = null;
		
		int deleted=0;
		try {
			String sql = "DELETE FROM board WHERE board_num=? AND board_pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, board_pass);
			deleted = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteBoard SQL 구문 오류!");
		}finally {
			close(pstmt);
		}
		
		if(deleted>0) {
			isDelete = true; 
		}
		
		return isDelete;
	}

	//글 수정 작업
	public int modifyBoard(BoardDTO board) {
		System.out.println("DAO - modifyBoard");
		int isModifySuccess = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE board SET board_name=?,board_subject=?,board_content=? WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getBoard_name());
			pstmt.setString(2, board.getBoard_subject());
			pstmt.setString(3, board.getBoard_content());
			pstmt.setInt(4, board.getBoard_num());
			isModifySuccess =pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("modifyBoard - SQL 구문 오류!");
		}finally {
			close(pstmt);
		}
		
		return isModifySuccess;
	}

	
	//답글 작성 수행
	public int insertReplyBoard(BoardDTO board) {
		System.out.println("DAO - insertReplyBoard");
		int insertCount = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		int num = 1;
		
		
		try {
			String sql= "SELECT MAX(board_num) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}
						
			sql = "UPDATE board SET board_re_seq=board_re_seq+1 WHERE board_re_ref=? AND board_re_seq>?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, board.getBoard_re_ref());
			pstmt2.setInt(2, board.getBoard_re_seq());
			pstmt2.executeUpdate();
			System.out.println("Update 구문 실행됨");
			
			sql = "INSERT INTO board VALUES(?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt3 = con.prepareStatement(sql);
			pstmt3.setInt(1, num);
			pstmt3.setString(2,board.getBoard_name());
			pstmt3.setString(3, board.getBoard_pass());
			pstmt3.setString(4, board.getBoard_subject());
			pstmt3.setString(5, board.getBoard_content());
			pstmt3.setString(6,"");
			pstmt3.setString(7, "");
			pstmt3.setInt(8, board.getBoard_re_ref());
			pstmt3.setInt(9, board.getBoard_re_lev()+1);
			pstmt3.setInt(10, board.getBoard_re_seq()+1);
			pstmt3.setInt(11, 0);
			insertCount = pstmt3.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO - insertReplyBoard SQL 구문오류!");
		}finally {
			close(rs);
			close(pstmt); 
			close(pstmt2);
			close(pstmt3);
			
		}
		
		return insertCount;
	}
	
}














