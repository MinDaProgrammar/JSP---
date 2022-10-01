<%@page import="jsp9_jdbc.Test8_1DTO"%>
<%@page import="jsp9_jdbc.Test8_1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	Test8_1DAO dao = new Test8_1DAO();
	
	Test8_1DTO dto = new Test8_1DTO();
	dto = dao.selectInfo(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test3_selectInfo.jsp</h1>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=dto.getAge() %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=dto.getGender() %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><%=dto.getHobby() %></td>
		</tr>
	
	</table>
</body>
</html>