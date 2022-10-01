package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.BoardDAO;

import static db.JdbcUtil.*;

public class BoardDeleteProService {

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

	public boolean removeBoard(int board_num, String board_pass) {
		System.out.println("BoardDeleteProService-removeBoard()");
		boolean isDeleteSuccess = false;
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		boolean isDelete = dao.deleteBoard(board_num,board_pass);
		
		try {
			if(isDelete) {
				con.commit();
				isDeleteSuccess = true;
			}else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(con);
		
		return isDeleteSuccess;
	}

}
