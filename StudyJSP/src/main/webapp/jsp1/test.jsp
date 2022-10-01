<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  HTML 주석 = 웹브라우저 소스보기로 확인가능 -->
	<h1>test.jsp</h1>
	<%-- JSP 주석. 웹브라우저의 소스보기로 확인불가 --%>
	<%--  --%>
	<%
	Timestamp now = new Timestamp(System.currentTimeMillis());
	%>
	
	<h3>현재 시각 : <%=now %></h3>
	
	<!--  <h3>현재 시각2 : <%=now %></h3>-->
	
	<%-- <h3>현재 시각 : <%=now %></h3> --%>
</body>
</html>