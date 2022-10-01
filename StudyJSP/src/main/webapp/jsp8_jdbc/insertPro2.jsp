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
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String jumin = request.getParameter("jumin1")+"-"+request.getParameter("jumin2");
	String email = request.getParameter("email1")+"@"+request.getParameter("email2");
	String job = request.getParameter("job");
	String gender = request.getParameter("gender");
	String content = request.getParameter("content");
	String hobby="";
	for(String item : request.getParameterValues("hobby")){
		hobby+=item+" ";
	}
// 	데이터가 잘 받아졌는지 출력해서 확인
	out.println(name+"<br>"+id+"<br>"+passwd+"<br>"+jumin+"<br>"+
	email+"<br>"+job+"<br>"+gender+"<br>"+hobby+"<br>"+content);
	%>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/study_jsp2";
	String user ="root";
	String password = "1234";
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql = "INSERT INTO test8_2 VALUES(?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, passwd);
	pstmt.setString(4, jumin);
	pstmt.setString(5, email);
	pstmt.setString(6, job);
	pstmt.setString(7, gender);
	pstmt.setString(8, hobby);
	pstmt.setString(9, content);
	
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
	%>
	<h3>실행 완료:)</h3>
</body>
</html>