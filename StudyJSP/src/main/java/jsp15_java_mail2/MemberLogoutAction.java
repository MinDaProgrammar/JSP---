package jsp15_java_mail2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("MemberLogoutAction");
		forward = new ActionForward();
		forward.setPath("Main.auth");
		forward.setRedirect(true);
		return forward;
	}

}
