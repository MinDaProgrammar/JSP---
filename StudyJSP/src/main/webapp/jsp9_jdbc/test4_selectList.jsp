<%@page import="jsp9_jdbc.Test8_1DTO"%>
<%@page import="jsp9_jdbc.Test8_1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//Test8_1 DAO 객체의 selectList()메서드 호출
Test8_1DAO dao = new Test8_1DAO();
Test8_1DTO[] arrDto = dao.selectList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4_selectList.jsp</h1>
	<h3>배열의 길이 : <%=arrDto.length %></h3>
	<table border="1">
	 <tr>
	 	<th>이름</th>
	 	<th>나이</th>
	 	<th>성별</th>
	 	<th>취미</th>
	 </tr>
	<% for(int i=0;i<arrDto.length;i++){ %>
	<tr>
		<td><%=arrDto[i].getName() %> </td>
		<td><%=arrDto[i].getAge() %> </td>
		<td><%=arrDto[i].getGender() %> </td>
		<td><%=arrDto[i].getHobby() %> </td>
	</tr>
	<%} %>
	</table>
</body>
</html>