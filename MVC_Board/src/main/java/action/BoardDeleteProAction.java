package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("BoardDeleteProAction");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_pass = request.getParameter("board_pass");
		
		System.out.println("글번호: "+board_num);
		System.out.println("패스워드: "+board_pass);
		
		//글번호와 패스워드로 유저 확인
		BoardDeleteProService service = new BoardDeleteProService();
		boolean isBoardWriter = service.isBoardWriter(board_num,board_pass);
		
		if(!isBoardWriter) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('삭제 권한이 없습니다'); history.back(); </script>");
		}else {
			//삭제 후 리다이렉트 방식으로 글목록으로 감
			boolean isDeleteSuccess = service.removeBoard(board_num,board_pass);
			if(!isDeleteSuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('삭제 실패!'); history.back(); </script>");
			}else {
				forward = new ActionForward();
				forward.setPath("BoardList.bo?pageNum="+request.getParameter("pageNum"));
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}

}
