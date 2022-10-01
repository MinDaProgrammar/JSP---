package jsp15_java_mail2;

import static jsp15_java_mail2.JdbcUtil.*;

import java.sql.Connection;

public class MemberLoginProService {

	public boolean memberLogin(MemberDTO member) {
		boolean isLoginSuccess = false;
		System.out.println("MemberLoginProService-memberLogin");
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		isLoginSuccess = dao.checkUser(member);
				
		close(con);
		return isLoginSuccess;
	}

	public boolean isAuthenticatedUser(MemberDTO member) {
		boolean isAuthenticateduser = false;
		System.out.println("MemberLoginProService - isAuthenticatedUser");
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		isAuthenticateduser = dao.isAuthenticatedUser(member);
				
		close(con);
		
		return isAuthenticateduser;
	}

}
