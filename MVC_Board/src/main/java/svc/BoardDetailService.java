package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.BoardDAO;
import vo.BoardDTO;
import static db.JdbcUtil.*;
public class BoardDetailService {
	public void increaseReadcount(int board_num) {
		System.out.println("BoardDetailService-increaseReadcount");
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		dao.updateReadcount(board_num);
		
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("commit 실패!");
		}
		close(con);
	}
	
	public BoardDTO getBoard(int board_num) {
		System.out.println("BoardDetailService-getBoard");
		BoardDTO dto = null;
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		
		dto = dao.selectBoard(board_num);
		
		
		close(con);
		return dto;
	}
}
