package jsp15_java_mail2;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginProAction");
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		String pass = request.getParameter("passwd");
		
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setPasswd(pass);
		
		MemberLoginProService service = new MemberLoginProService();
		boolean isAuthenticateuser = service.isAuthenticatedUser(member);
		
		if(!isAuthenticateuser) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이메일 인증을 먼저 수행하세요!'); history.back(); </script>");
		}else {
		
			boolean isLoginSuccess = service.memberLogin(member);
			if(!isLoginSuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 실패'); history.back(); </script>");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("sId", id);
				forward = new ActionForward();
				forward.setPath("Main.auth");
				forward.setRedirect(true);
			}
		}
		return forward;
	}

}
