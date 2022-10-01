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
	h1{
		color: white;
		font-size: 1em;
		background: #222;
		margin:0;
		padding:10px;
	}
	th{
		color:#f030f5;
		font-size: 1.5em;
	}
	td{
		line-height: 2em;
		text-align:center;
		font-weight: bold;
	}
	
	
</style>
</head>
<body>
	<h1>SelectPro2.jsp</h1>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/study_jsp2";
	String user = "root";
	String password ="1234";
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql = "SELECT*FROM test8_2";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	%>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>주민번호</th>
			<th>이메일</th>
			<th>직업</th>
			<th>성별</th>
			<th>취미</th>
			<th>컨텐츠</th>
		</tr>
	<%
	while(rs.next()){
		%>
		<tr>
<%-- 		<%for(int i=1;i<=9;i++){%> --%>
<%-- 			<td><%=rs.getString(i) %></td> --%>
<%-- 		<%}%> --%>
			<td><%=rs.getString("name") %></td>
			<td><a href="select3.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("id") %></a>
			<td><%=rs.getString("passwd") %></td>
			<td><%=rs.getString("jumin") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("job") %></td>
			<td><%=rs.getString("gender") %></td>
			<td><%=rs.getString("hobby") %></td>
			<td><%=rs.getString("content") %></td>
		</tr>
		<%
		
	}
	%>
	</table>
	<p>
	 심심해서 만드는 CSS 연습 style sheet!!
	</p>
	
	<%
	rs.close();
	pstmt.close();
	con.close();
	%>
	
</body>
</html>