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
	<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	out.println("이름: "+name+"<br>");
	out.println("나이: "+age+"<br>");
	
	%>
	
	<%
	String url = "jdbc:mysql://localhost:3306/study_jsp2";
	String user = "root";
	String password = "1234";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql= "DELETE FROM test8_1 WHERE name=?&&age=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(2, age);
	pstmt.setString(1,name);

	int query=pstmt.executeUpdate();
	out.println("<br>Query okay. "+query+"rows affected");
	
	%>
</body>
</html>