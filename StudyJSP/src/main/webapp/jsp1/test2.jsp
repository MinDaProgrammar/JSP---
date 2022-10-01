<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 지시어(Directive)</title>
</head>
<body>
	<%@include file="test2_header.jsp" %>
	
	
	<h1>test2.jsp</h1>
	<a href="test2_2.jsp">test2_2로 이동</a>
	<hr>
	
	<%@include file="test2_footer.jsp" %>

</body>
</html>