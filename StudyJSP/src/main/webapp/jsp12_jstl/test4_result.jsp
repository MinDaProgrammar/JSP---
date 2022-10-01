<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL - test4_result.jsp</h1>
	<h3>번호: ${idx }</h3>
	<h3>이름: ${name }</h3>
	<hr>
	<%for(int i=1;i<=10;i++){ %>
		<%=i %>&nbsp;
	<%} %>
	<hr>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;
	</c:forEach>
	
	<hr>
	<c:forEach var="item" items="${names }" varStatus="status"> 
		${status.index }번 데이터 : ${item } &nbsp;
	</c:forEach>
	
	<hr>
	<c:forEach var="member" items="${memberList }">
		${member.name }, ${member.passwd }, ${member.id }, ${member.age }<br>
	</c:forEach>
</body>
</html>