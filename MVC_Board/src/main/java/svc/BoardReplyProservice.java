package svc;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardDTO;
import static db.JdbcUtil.*;

public class BoardReplyProservice {

	public boolean replyBoard(BoardDTO board) {
		boolean isReplySuccess = false;
		System.out.println("BoardReplyProservice-isReplySuccess");
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		int insertCount = dao.insertReplyBoard(board);
		
		if(insertCount>0) {
			commit(con);
			isReplySuccess=true;
		}else {
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
	}

}
