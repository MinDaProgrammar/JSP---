<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet">
<link href="../css/subpage.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<h1>회원 가입 완료</h1>
	<input type="button" value="홈으로" onclick="location.href='../main/main.jsp'">
	<input type="button" value="로그인" onclick="location.href='login.jsp'">
	
	
	
	
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</body>
</html>