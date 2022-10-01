package jsp15_java_mail2;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinProAction");
		ActionForward forward = null;
		MemberJoinProService service = new MemberJoinProService(); 
		MemberDTO member = new MemberDTO();
		member.setName(request.getParameter("name"));
		member.setPasswd(request.getParameter("passwd"));
		member.setId(request.getParameter("id"));
		member.setEmail(request.getParameter("email1")+'@'+request.getParameter("email2"));
		member.setGender(request.getParameter("gender"));
		boolean isMemberJoin = service.joinMember(member);
		if(!isMemberJoin) {
			// 자바스크립트로 회원 가입 실패 및 되돌아가기
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('회원가입 실패!'); history.back(); </script>");
		}else {
			forward = new ActionForward();
			forward.setPath("SendAuthMail.auth?id="+member.getId()+"&email="+member.getEmail());
			forward.setRedirect(true);
		}
		
		
		return forward;
	}

}
