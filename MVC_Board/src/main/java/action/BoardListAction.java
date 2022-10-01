package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardListService;
import vo.ActionForward;
import vo.BoardDTO;
import vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardListAction");
		ActionForward forward = null;
		
		//페이징 처리를 위한 변수 선언
		int pageNum=1;
		int listLimit = 10 ;
		int pageLimit = 10;
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum")); // String -> int 변환
		}
		BoardListService service = new BoardListService();
		int listCount = service.getListCout();	//service 클래스에서 글 개수 가져오기
		System.out.println("전체 게시물 수 : "+listCount);
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		int startPage = ((int)((double)pageNum / pageLimit+0.9) - 1) * pageLimit +1;
		
		int endPage = startPage + pageLimit - 1;
		if(maxPage<endPage){
			endPage=maxPage;
		}	
		
		PageInfo info = new PageInfo(pageNum, maxPage, startPage, endPage, listCount);
		
		//게시물 목록 가져오기
		ArrayList<BoardDTO> boardList = service.getBoardList(pageNum,listLimit); //service 클래스에서 글 목록 가져오기
		
		request.setAttribute("pageInfo", info);
		request.setAttribute("boardList", boardList);
		
		forward = new ActionForward();
		forward.setPath("board/qna_board_list.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
