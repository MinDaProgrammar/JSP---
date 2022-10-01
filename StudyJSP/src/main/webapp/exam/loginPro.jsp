<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 아이디, 패스워드 파라미터 가져와서 변수에 저장
String id = request.getParameter("id");
String password = request.getParameter("password");

// DB 연결에 필요한 문자열 변수 선언
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/mvc_board";
String dbUser = "root";
String dbPassword = "1234";

Class.forName(driver);
Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

// 아이디(id) 와 패스워드(password) 가 일치하는 레코드 검색
String sql = "SELECT * FROM member WHERE id=? AND passwd = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, password);
ResultSet rs = pstmt.executeQuery();

if(rs.next()) { // 아이디 있을 경우
	session.setAttribute("sessionId", rs.getString("id")); // 세션에 아이디 저장
	response.sendRedirect("index.jsp");
} else { // 아이디 또는 패스워드 틀린 경우
	out.println("로그인 실패!");
}
%>









