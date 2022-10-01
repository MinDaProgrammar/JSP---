<%@page import="java.sql.ResultSet"%>
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
<style>
	
	td,th{
		text-align: center;
		color: lime;
		background: maroon;
		text-shadow: 2px 2px blue;
		border: thick;
		border-color: fuchsia; 
	}

</style>
</head>
<body>
	<h1>jdbc_test6_select.jsp</h1>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/study_jsp2";
	String user = "root";
	String password = "1234";
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql = "SELECT*FROM test3";
	PreparedStatement pstmt = con.prepareStatement(sql);
	System.out.println("완료!");
	
	ResultSet rs = pstmt.executeQuery();
	%>
	
	<table border="1">
		<tr>
			<th>idx</th><th>name</th>
		</tr>
	<%
	while(rs.next()){
		int idx = rs.getInt(1);
		String name = rs.getString(2);
		
// 		out.println("<tr><h3><td>"+idx+"</td> <td>"+name+"</td></h3></tr>");

	%>
		<tr>
			<td><%=idx %></td><td><%=name %></td>
		</tr>
	<%
	}
	
	//자원반환
	rs.close();
	pstmt.close();
	con.close();
	%>
	
	</table>
</body>
</html>