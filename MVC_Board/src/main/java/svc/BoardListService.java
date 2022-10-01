package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardDTO;
import static db.JdbcUtil.*;

public class BoardListService {
	//게시물 개수 조회
	public int getListCout() {
		System.out.println("BoardListService - getListCount");
		int listCount = 0;							//0. 리턴할 데이터 선언 및 초기화
		Connection con = getConnection();	//1. Connection 객체 받아오기
		BoardDAO dao = BoardDAO.getInstance();	//2. DAO 객체 받아오기
		dao.setConnection(con);					//3. Connection 객체 dao 에 전달
		listCount = dao.selectListCount();		//4.메서드 호출
		
		close(con);			//5. 자원반환
		return listCount;
	}
	
	//게시물 목록 조회
	public ArrayList<BoardDTO> getBoardList(int pageNum, int listLimit) {
		System.out.println("BoardListService - getBoardList");
		ArrayList<BoardDTO> articleList = null;
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		articleList = dao.selectBoardList(pageNum, listLimit);
		
		System.out.println(articleList);
		
		close(con);
		return articleList;
	}

}
