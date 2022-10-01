package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardDTO;

public class BoardReplyFormService {
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
