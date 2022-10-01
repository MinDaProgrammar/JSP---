package svc;

import java.sql.Connection;

import dao.BoardDAO;
//import db.JdbcUtil;
import vo.BoardDTO;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.*;

public class BoardWriteProService {

	public boolean registBoard(BoardDTO board) {
		System.out.println("BoardWriteProService - registBoard");
		boolean isWriteSuccess = false;
//		Connection con = JdbcUtil.getConnection();
		//static import로 포함시킨 getConnection 메서드 호출
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		
		int insertCount = dao.insertBoard(board);
		if(insertCount>0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return isWriteSuccess;
	}

}
