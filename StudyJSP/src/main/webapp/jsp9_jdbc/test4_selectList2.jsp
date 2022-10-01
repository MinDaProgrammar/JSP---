<%@page import="java.util.ArrayList"%>
<%@page import="jsp9_jdbc.Test8_1DTO"%>
<%@page import="jsp9_jdbc.Test8_1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//Test8_1 DAO 객체의 selectList()메서드 호출
Test8_1DAO dao = new Test8_1DAO(); 
ArrayList list = dao.selectList2();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4_selectList2.jsp</h1>
	<h3>ArrayList의 길이: <%=list.size() %></h3>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>취미</th>
		</tr>
	<%
		for(int i=0;i<list.size();i++){ 
		Test8_1DTO dto = (Test8_1DTO)list.get(i);
	%>
		<tr>
			<td><%=dto.getName() %></td>
			<td><%=dto.getAge() %></td>
			<td><%=dto.getGender() %></td>
			<td><%=dto.getHobby() %></td>
		</tr>
	<%} %>
	</table>
</body>
</html>