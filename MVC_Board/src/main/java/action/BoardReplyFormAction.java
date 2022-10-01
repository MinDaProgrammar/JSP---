package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardReplyFormService;
import vo.ActionForward;
import vo.BoardDTO;

public class BoardReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyFormAction");
		ActionForward forward = null;
		BoardReplyFormService service = new BoardReplyFormService();
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		service.getBoard(board_num);
		
		BoardDTO board = service.getBoard(Integer.parseInt(request.getParameter("board_num")));
		
		request.setAttribute("board", board);
		forward= new ActionForward();
		forward.setPath("board/qna_board_reply.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
