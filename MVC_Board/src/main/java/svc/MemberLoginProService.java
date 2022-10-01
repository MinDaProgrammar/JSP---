package svc;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;

public class MemberLoginProService {

	public boolean memberLogin(String id, String pass) {
		boolean isLoginSuccess = false;
		System.out.println("MemberLoginProService-memberLogin");
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		isLoginSuccess = dao.memberLogin(id,pass);
				
		close(con);
		return isLoginSuccess;
	}

}
