package jsp15_java_mail2;

import static jsp15_java_mail2.JdbcUtil.*;

import java.sql.Connection;

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
