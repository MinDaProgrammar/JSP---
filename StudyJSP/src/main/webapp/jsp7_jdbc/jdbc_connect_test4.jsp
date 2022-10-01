<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_connect_test3.jsp</h1>
	<%
	String driver="com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp2";
	String username = "root";
	String password ="1234";
	
	Class.forName(driver);
	Connection con = DriverManager.getConnection(url,username,password);
	out.println("성공!");
	
	//1.sql 구문작성
	//String sql = "CREATE TABLE test2(idx INT)";
	int num=15;
// 	String sql = "INSERT INTO test VALUES("+num+")";

	String name ="홍길동";
	String sql = "INSERT INTO test2 VALUES('"+name+"')";
	
	//2. Connection 객체의 preparedStatement 호출 하여 구문 전달
	PreparedStatement pstmt = con.prepareStatement(sql);
	out.println("<br>sql 구문 전달 성공!");
	
	//4단계. SQL 구문 작성 및 실행
	pstmt.executeUpdate();
	out.println("<br>sql구문 실행 성공!");
	%>
</body>
</html>