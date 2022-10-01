package jsp9_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Test8_1DAO {
	
	public int insert(Test8_1DTO dto) throws Exception {
		
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		
		String sql = "INSERT INTO test8_1 VALUES(?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getAge());
		pstmt.setString(3, dto.getGender());
		pstmt.setString(4, dto.getHobby());
		
		int insertCount = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return insertCount;
	}
	
	public Test8_1DTO selectInfo(String name) throws Exception {
		Test8_1DTO dto = null;
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		
		String sql = "SELECT*FROM test8_1 WHERE name=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		System.out.println("sql 구문 전달");
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		System.out.println("sql 구문 실행");
		while(rs.next()) {
			dto = new Test8_1DTO();
			dto.setName(rs.getString(1));
			dto.setAge(rs.getInt(2));
			dto.setGender(rs.getString(3));
			dto.setHobby(rs.getNString(4));
		}
		rs.close();
		pstmt.close();
		con.close();
		return dto;
	}
	
	//회원 목록 조회 메서드
	public Test8_1DTO[] selectList() throws Exception {
		Test8_1DTO[] arrDto = null;
		Test8_1DTO dto = null;
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		
		//test8_1 테이블의 모든 레코드 갯수 조회하는 COUNT() 함수 활용
		String sql= "SELECT COUNT(*) FROM test8_1";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
//		System.out.println("레코드의 개수: "+ rs.getInt("COUNT(*)"));
		arrDto = new Test8_1DTO[rs.getInt("COUNT(*)")];
		//----------------------------------------------------------------
		String sql2 = "SELECT*FROM test8_1";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		ResultSet rs2 = pstmt2.executeQuery();
		int index = 0;
		while(rs2.next()) {
//			System.out.println("☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆");
//			System.out.println(rs2.getString(1));
//			System.out.println(rs2.getInt(2));
//			System.out.println(rs2.getString(3));
//			System.out.println(rs2.getString(4));
//			System.out.println("☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆");
			dto = new Test8_1DTO();
			dto.setName(rs2.getString(1));
			dto.setAge(rs2.getInt(2));
			dto.setGender(rs2.getString(3));
			dto.setHobby(rs2.getNString(4));
			
			arrDto[index]=dto;
			index++;
		}
		
		rs.close(); rs2.close();
		pstmt.close(); pstmt2.close();
		con.close();
		
		return arrDto;
	}
	
	public ArrayList selectList2() throws Exception{	//오류 발생을 방지하는 Exception 만들기
		//dto를 저장하는 arraylist 생성 및 각 레코드를 저장하는 dto를 생성 
		ArrayList list= new ArrayList();
		Test8_1DTO dto = null;
		
		//드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		//Connection 객체로 드라이버 연결
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user="root";
		String password="1234";
		Connection con = DriverManager.getConnection(url, user, password);
		
		//Sql 구문 작성 (test8_1의 레코드 전체선택) 및 전달
		String sql="SELECT*FROM test8_1";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//ResultSet 객체를 반복문을 통해 각 레코드의 값 조회 및 dto 에 저장후 arrayList에 저장
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			dto = new Test8_1DTO();
			//dto에 값 저장
			dto.setName(rs.getString(1));
			dto.setAge(rs.getInt(2));
			dto.setGender(rs.getString(3));
			dto.setHobby(rs.getString(4));
			
			//arrayList의 각 인덱스에 dto를 반복하여 저장
			list.add(dto);
		}
		
		//자원반환
		rs.close();
		pstmt.close();
		con.close();
		
		//arrayList 반환
		return list;
	}
}











