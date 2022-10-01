package jsp15_java_mail2;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

public class MemberListService {

	public ArrayList<MemberDTO> getMemberList() {
		System.out.println("MemberListService-getMemberList");
		ArrayList<MemberDTO> list = null;
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		list = dao.selectMemberList();
		
		close(con);
		return list;
	}
	
}
