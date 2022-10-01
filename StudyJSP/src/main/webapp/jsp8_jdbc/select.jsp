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
	table{
		border-color: red;
		border: 10em;
		padding: 5px;
	}
	th{
		background: maroon;
		color: #D1AA84;
		text-shadow: 1px 1px #113355, 2px 2px #002266, 3px 3px #0011AA;
		 
		
		
	}
	td{
		text-align: center;
		background: olive;
		color: orange;
		text-shadow: 1px 1px #553311, 2px 2px #662200, 3px 3px #AA1100;
	}
</style>
</head>
<body>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/study_jsp2";
	String user = "root";
	String password = "1234";
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql = "SELECT*FROM test8_1";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	%>
		<table>
		<tr>
			<th>이름</th><th>나이</th><th>성별</th><th>취미</th>
		</tr>
	<%
	while(rs.next()){
		String name = rs.getString(1);
		int age = rs.getInt(2);
		String gender = rs.getString(3);
		String hobby =rs.getString(4);
		%>
		<tr>
			<td><%=name %></td><td><%=age %></td><td><%=gender %></td><td><%=hobby %></td>
		</tr>
		<%
	}
	
	rs.close();
	pstmt.close();
	con.close();
	%>
	</table>
</body>
</html>