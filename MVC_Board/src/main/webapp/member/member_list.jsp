<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_list</title>
</head>
<body>
	<table border="1">
		<c:forEach items="${list }" var="member" >
		<tr>
			<td>${member.name } </td>
			<td>${member.id } </td>
			<td>${member.passwd } </td>
			<td>${member.email } </td>
			<td>${member.post_code } </td>
			<td>${member.address1 } </td>
			<td>${member.address2 } </td>
			<td>${member.hire_date } </td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>