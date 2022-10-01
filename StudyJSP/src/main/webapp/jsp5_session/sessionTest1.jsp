<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>현재 세션 유지 시간: <%=session.getMaxInactiveInterval() %>초</h3>
<%-- 	<%session.setMaxInactiveInterval(10); %> --%>
	<h3>현재 세션 유지 시간: <%=session.getMaxInactiveInterval() %>초</h3>
	
	<hr>
	
	<h3>새 세션 여부 : <%=session.isNew()%></h3>
	<h3>세션 ID : <%=session.getId()%></h3>
	<h3>세션 생성 시각 : <%=new Date(session.getCreationTime())%></h3>
	<h3>마지막 세션 접근 시각 : <%=new Date(session.getLastAccessedTime())%></h3>
	
	<hr>
	<%session.invalidate(); %>
<%-- 	<h3>새 세션 여부 : <%=session.isNew()%></h3> --%>
	<!-- 세션 객체 무효화 후 새로운 세션이 생성 되기 전 까지 세션객체 사용 불가 -->
	
</body>
</html>