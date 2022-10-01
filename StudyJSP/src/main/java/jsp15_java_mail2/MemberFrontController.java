package jsp15_java_mail2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.auth")
public class MemberFrontController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("MemberFrontController");
		String command = request.getServletPath();
		System.out.println("command: "+command);
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/Main.auth")) {
			System.out.println("메인 요청!");
			forward = new ActionForward();
			forward.setPath("jsp15_java_mail2/main.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberJoinForm.auth")) {
			System.out.println("회원가입창 요청!");
			forward = new ActionForward();
			forward.setPath("jsp15_java_mail2/join_form.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberCheckIdForm.auth")){
			System.out.println("아이디 중복확인 창 요청!");
			forward = new ActionForward();
			forward.setPath("jsp15_java_mail2/check_id.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/CheckDuplicateId.auth")) {
			System.out.println("Id 중복확인 요청");
			try {
				action = new MemberCheckDuplicateIdAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/MemberJoinPro.auth")) {
			System.out.println("회원가입 정보 입력 요청!");
			try {
				action = new MemberJoinProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberList.auth")) {
			try {
				action = new MemberListAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLoginForm.auth")) {
			forward = new ActionForward();
			forward.setPath("jsp15_java_mail2/login_form.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberLoginPro.auth")) {
			try {
				action = new MemberLoginProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogout.auth")) {
			try {
				action = new MemberLogoutAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/Admin.auth")) {
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/SendAuthMail.auth")) {
			action = new MemberSendAuthMailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberAuth.auth")) {
			action = new MemberAuthAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
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
