package jsp15_java_mail2;

import static jsp15_java_mail2.JdbcUtil.*;

import java.sql.Connection;

public class MemberSendAuthMailService {

	public boolean registAuthCode(String id, String authCode) {
		System.out.println("MemberSendAuthMailService-registAuthCode");
		boolean isRegistSuccess = false;
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		int registCount = dao.registAuthCode(id, authCode);
		
		if(registCount>0) {
			commit(con);
			isRegistSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isRegistSuccess;
	}
	
}
