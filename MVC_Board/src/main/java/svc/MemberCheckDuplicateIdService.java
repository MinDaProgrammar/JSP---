package svc;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;

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

}
