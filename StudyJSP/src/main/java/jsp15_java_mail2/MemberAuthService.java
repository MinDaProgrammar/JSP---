package jsp15_java_mail2;

import java.sql.Connection;
import static jsp15_java_mail2.JdbcUtil.*;

public class MemberAuthService {

	public boolean isAuthentication(AuthInfoDTO authInfo) {
		System.out.println("MemberAuthService-selectAuthInfo");
		boolean isAuthenticationSuccess = false;
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		isAuthenticationSuccess = dao.isAuthentication(authInfo);
		
		if(isAuthenticationSuccess) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);		
		return isAuthenticationSuccess;
	}

}
