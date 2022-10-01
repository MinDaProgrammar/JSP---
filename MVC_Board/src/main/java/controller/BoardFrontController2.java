package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

@WebServlet("*.do")
public class BoardFrontController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("command: "+command);
		
		ActionForward forward = null;
		if(command.equals("/BoardWriteForm.do")) {
			System.out.println("글쓰기 폼2!");
			forward = new ActionForward();
			forward.setPath("board/qna_board_write.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/BoardWritePro.do")) {
			System.out.println("글 쓰기 실행 2");
			forward = new ActionForward();
			forward.setPath("BoardList.do");
			forward.setRedirect(true);
		}else if(command.equals("/BoardList.do")) {
			forward = new ActionForward();
			forward.setPath("board/qna_board_list.jsp");
			forward.setRedirect(false);
		}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}

}
