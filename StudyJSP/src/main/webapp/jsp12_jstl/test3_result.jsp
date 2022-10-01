<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL - test3_result.jsp</h1>
	<c:set var="num2" value="10" />
	<h3> num2 = ${num2 }</h3>
	<h3> name = ${param.name }</h3>
	<h3> num = ${param.num }</h3>
	
	<hr>
	
	<c:if test="${param.num gt 0}">
		<h3>\${param.num }이 0보다 크다!</h3>
		<h3>그러므로 이 태그는 현재 페이지에서 출력된다!</h3>
	</c:if>
	<hr>
	<c:set var="num2" value="0"></c:set>
	<c:choose>
		<c:when test="${num2 gt 0 }">
			<h3>num2(${num2 }) : 양수!</h3>
		</c:when>
		<c:when test="${num2 lt 0 }">
			<h3>num2(${num2 }) : 음수!</h3>
		</c:when>
		<c:otherwise>
			<h3>num2(${num2 }) : 양수도 아니고 음수도 아니다!</h3>
		</c:otherwise>
	</c:choose>
	
	<hr>
	<h3>\${param.name } = ${param.name }</h3>
	<c:choose>
		<c:when test="${empty param.name}">
			<h3>이름 입력 필수!!</h3>
			<script> alert("이름 입력 필수!"); history.back();</script>
		</c:when>
		<c:when test="${param.name eq '홍길동' }">
			<h3>홍길동입니다~~</h3>
		</c:when>
		<c:when test="${param.name eq '거북2' }">
			<h3>거부기 입니다~~</h3>
		</c:when>
		<c:otherwise>
			<h3>홍길동도 거부기도 아닙니다~~^^</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>