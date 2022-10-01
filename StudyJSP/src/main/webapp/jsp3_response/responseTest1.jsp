<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>responseTest1.jsp</h1>
<!-- 	페이지이동(포워딩) 처리 -->
	
	<a href="responseTest1_result.jsp">responseTest1_result.jsp로 이동</a>
	<br>
	<a href="https://www.naver.com">Naver로 이동</a>
	
	<script>
// 	location.href="responseTest1_result.jsp";
	</script>
	
	<%
	response.sendRedirect("responseTest1_result.jsp");
	%>
</body>
</html>