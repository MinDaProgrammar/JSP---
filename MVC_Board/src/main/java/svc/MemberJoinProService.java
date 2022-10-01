package svc;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;
import vo.MemberDTO;

public class MemberJoinProService {

	public boolean joinMember(MemberDTO member) {
		System.out.println("MemberJoinProService-joinMember");
		boolean isJoinSuccess = false;
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		int insertCount = dao.insertMember(member);
		
		if(insertCount>0) {
			commit(con);
			isJoinSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		
		return isJoinSuccess;		
	}

}
