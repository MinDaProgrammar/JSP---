package jsp15_java_mail2;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberAuthAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("MemberAuthAction");
		AuthInfoDTO authInfo = new AuthInfoDTO();
		authInfo.setId(request.getParameter("id"));
		authInfo.setAuthCode(request.getParameter("authCode"));
		System.out.println(authInfo.getId());
		System.out.println(authInfo.getAuthCode());
		
		MemberAuthService memberAuthService = new MemberAuthService();
		boolean isAuthenticationSuccess = memberAuthService.isAuthentication(authInfo);
		
		if(!isAuthenticationSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증 실패'); history.back(); </script>");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증 성공' - 로그인 페이지로 이동합니다.);"
					+ "location.href='MemberLoginForm.auth' </script>");
		}
		
		return forward;
	}

}
