package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberLoginProService;
import vo.ActionForward;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginProAction");
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		String pass = request.getParameter("passwd");
		
		MemberLoginProService service = new MemberLoginProService();
		boolean isLoginSuccess = service.memberLogin(id,pass);
		if(!isLoginSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 실패'); history.back(); </script>");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("sId", id);
			forward = new ActionForward();
			forward.setPath("./index.jsp");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
