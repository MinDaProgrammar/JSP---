package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.BoardDAO;
import vo.BoardDTO;

import static db.JdbcUtil.*;


public class BoardModifyProService {
	public boolean isBoardWriter(int board_num, String board_pass) {
		System.out.println("BoardDeleteProService-isBoardWriter()");
		
		boolean isBoardWriter = false;
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		isBoardWriter = dao.isBoardWriter(board_num,board_pass);
		
		close(con);
		return isBoardWriter;
	}
	
	public boolean modifyBoard(BoardDTO board) {
		boolean isModifySuccess = false;
		System.out.println("BoardModifyProService-modifyBoard");
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		int modifyCount = dao.modifyBoard(board);
		if(modifyCount>0) {
			isModifySuccess=true;
		}
		
		try {
			if(isModifySuccess) {
				con.commit();
			}else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(con);
		return isModifySuccess;
	}

}
