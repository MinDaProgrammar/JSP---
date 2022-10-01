package jsp15_java_mail2;

import static db.JdbcUtil.*;

import java.sql.Connection;

public class MemberCheckDuplicateIdService {

	public boolean checkId(String id) {
		System.out.println("MemberCheckDuplicateIdService-checkId");
		boolean isDuplicate=true;
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		isDuplicate = dao.selectDuplicateId(id);
		
		close(con);
		return isDuplicate;
	}

	private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}

}
