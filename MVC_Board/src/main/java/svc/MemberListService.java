package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;

import static db.JdbcUtil.*;
import vo.MemberDTO;

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
