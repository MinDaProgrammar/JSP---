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
	String[] hobby = request.getParameterValues("hobby");
	String gender = request.getParameter("gender");
	out.println("이름: "+name+"<br>");
	out.println("나이: "+age+"<br>");
	out.println("성별: "+gender+"<br>");
	out.println("취미: ");
	for(int i=0;i<hobby.length;i++){
		if(hobby[i]!=null){
		out.println(hobby[i]+"\t");
		}
	}
	String hob="";
	for(String item : hobby){
		hob +=item+"/";
	}
	%>
	
	<%
	String url = "jdbc:mysql://localhost:3306/study_jsp2";
	String user = "root";
	String password = "1234";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql= "INSERT INTO test8_1 VALUES(?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(2, age);
	pstmt.setString(1,name);
	pstmt.setString(3,gender);
	pstmt.setString(4,hob);
	pstmt.executeUpdate();
	
	%>
</body>
</html>