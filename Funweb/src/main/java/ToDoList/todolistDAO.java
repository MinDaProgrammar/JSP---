package ToDoList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;

public class todolistDAO {
	public int insert(todolistDTO dto) {
		int insertCount =0;
		PreparedStatement pstmt = null;
		Connection con = JdbcUtil.getConnection();
		try {
			String sql = "INSERT INTO todolist VALUES(null,?,?,now(),false)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getContent());	
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("INSERT SQL 구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	public List selectAll() {
		List list = new ArrayList();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = JdbcUtil.getConnection();
		try {
			String sql ="SELECT*FROM todolist ORDER BY date DESC";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				todolistDTO dto = new todolistDTO();
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setDate(rs.getDate(4));
				dto.setChecked(rs.getBoolean(5));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("selectAll SQl 구문 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return list;
	}
	
//	public int delete(todolistDTO dto) {	//delete는 아마 필요없을 지도
//		int deleteCount =0;
//		PreparedStatement pstmt = null;
//		Connection con = JdbcUtil.getConnection();
//		String sql="DELETE FROM todolist board WHERE id=? AND list=?";
//		
//		return deleteCount;
//	}
	
	public int update(int idx) {
		int updateCount =0;
		PreparedStatement pstmt = null;
		Connection con = JdbcUtil.getConnection();
		try {
			String sql="UPDATE todolist SET checked = NOT checked WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,idx);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("UPDATE SQL 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return updateCount;
	}
	
	public int delete(int idx) {
		int updateCount =0;
		PreparedStatement pstmt = null;
		Connection con = JdbcUtil.getConnection();
		try {
			String sql="DELETE FROM todolist WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,idx);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("DELETE SQL 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return updateCount;
	}
}




