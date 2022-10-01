package jsp10_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO_Backup {
	public int insert(BoardDTO dto) throws Exception {	//입력받은 값을 mysql에 저장하는 메서드
		Class.forName("com.mysql.cj.jdbc.Driver");	//드라이버 로드
		String url = "jdbc:mysql://localhost:3306/study_jsp2";	//자바와 데이터베이스 연결 url
		String user = "root";	//데이터베이스 관리 계정
		String passwd = "1234";	//데이터베이스 관리 패스워드
		Connection con = DriverManager.getConnection(url, user, passwd);	//자바 & DB 연결
		
		String sql = "INSERT INTO board VALUES(null,?,?,?,?,now(),0)";	//mysql 에 들어갈 SQL구문 작성
		PreparedStatement pstmt = con.prepareStatement(sql);	//preparedStatement 객체로 구문을 전달 및 물음표 값 채우기
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getSubject());
		pstmt.setString(4, dto.getContent());
		int insertCount = pstmt.executeUpdate();	//구문 실행 및 영향받은 row의 개수를 insertCount애 저장
		
		pstmt.close();	//자원 반환
		con.close();
		return insertCount;	//Insert가 잘 실행됬는지 확인을 위한 insertCount 리턴(0일시 실패, 0초과면 성공)
	}
	
	public void updateReadcount(int idx) throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");	//드라이버 로드
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Connection con = DriverManager.getConnection(url, user, password);
		String sql ="UPDATE board SET readcount=readcount+1 WHERE idx=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList selectInfo() throws Exception{	//DB의 전체 목록 출력 메서드
		ArrayList list = new ArrayList();	//여러 레코드를 받기위한 ArrayList 생성
		BoardDTO dto = null;	//각 arrayList의 인덱스에 들어갈 dto 임시 생성
		
		Class.forName("com.mysql.cj.jdbc.Driver");	//드라이버 로드
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Connection con = DriverManager.getConnection(url, user, password);	//자바와 DB 연결
		String sql = "SELECT*FROM board ORDER BY idx DESC LIMIT 10";	//SQL SELECT구문 작성 내림차순, LIMIT를 사용하여 개수 제한
		PreparedStatement pstmt = con.prepareStatement(sql);	//pstmt객체를 통해 구문을 전달 및 ? 채우기
		ResultSet rs = pstmt.executeQuery();	//구문 실행 후 rs객체를 통해 각 row 에 접근 가능
		while(rs.next()) {	//반복문을 통해 dto의 값을 채워서 dto를 Arraylist의 각 인덱스에 저장
			dto = new BoardDTO();
			dto.setName(rs.getString("name"));
			dto.setIdx(rs.getInt("idx"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setDate(rs.getDate("date"));
			dto.setReadcount(rs.getInt("readcount"));
			
			list.add(dto);
		}
		rs.close();	//자원반환
		pstmt.close();
		con.close();
		
		return list;	//테이블의 전체 정보가 저장된 리스트를 list.jsp로 다시 리턴
	}
	
	public BoardDTO selectDetail(int idx) throws Exception {	//선택된 제목의 내용을 출력하기 메서드
		BoardDTO dto = null;
		Class.forName("com.mysql.cj.jdbc.Driver");	//드라이버 로드
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Connection con = DriverManager.getConnection(url, user, password);
		
//		String sql = "UPDATE board SET readcount=readcount+1 WHERE idx=?";
//		PreparedStatement pstmt = con.prepareStatement(sql);
//		pstmt.setInt(1, idx);
//		pstmt.executeUpdate();
		//게시물 상세정보 작업수행 시 게시물 수정 작업에서도 조회수가 증가하기에 별도의 메서드로 분리함
		
		String sql2 = "SELECT * FROM board WHERE idx=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setInt(1, idx);
		
		
		
		ResultSet rs = pstmt2.executeQuery();
		if(rs.next()) {
			dto = new BoardDTO();
			dto.setName(rs.getString("name"));
			dto.setIdx(rs.getInt("idx"));
//			dto.setPasswd(rs.getString("passwd"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setDate(rs.getDate("date"));
			dto.setReadcount(rs.getInt("readcount"));
		}
		
		rs.close();
		pstmt2.close();
		con.close();
		
		return dto;
	}
	
	public int modify(BoardDTO dto) throws Exception {
		int updateCount = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");	//드라이버 로드
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Connection con = DriverManager.getConnection(url, user, password);
		
		String sql2= "SELECT passwd FROM board WHERE idx=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setInt(1, dto.getIdx());
		ResultSet rs = pstmt2.executeQuery();
		if(rs.next()) {
			if(rs.getString("passwd").equals(dto.getPasswd())){
//				System.out.println("패스워드 일치!");
				String sql = "UPDATE board SET content=?,subject=? WHERE idx=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getContent());
				pstmt.setString(2, dto.getSubject());
				pstmt.setInt(3, dto.getIdx());
				updateCount = pstmt.executeUpdate();
				pstmt.close();
			}
		}
		rs.close(); pstmt2.close();
		
		con.close();
		
		
		return updateCount;
	}
	
	public int delete(BoardDTO dto) throws Exception {
		int deleteCount = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");	//드라이버 로드
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Connection con = DriverManager.getConnection(url, user, password);
		
		String sql = "DELETE FROM board WHERE idx=? AND passwd=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getIdx());
		pstmt.setString(2, dto.getPasswd());
		
		deleteCount =pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return deleteCount;
		
	}
	
}

