<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2.jsp</h1>
	<a href="sessionTest2_set.jsp">세션값 생성</a>
	<br>
	<a href="sessionTest2_remove.jsp">세션값 삭제</a>
	
	<br>
	<input type="button" value="세션값 생성" onclick="location.href='sessionTest2_set.jsp'"><br>
	<input type="button" value="세션값 삭제" onclick="location.href='sessionTest2_remove.jsp'"><br>
	
	<hr>
	<img src="sea.jpg" width="200"><br>
	<input type="button" value="장바구니 담기" onclick="location.href='sessionTest2_set2.jsp?product_id=sea.jpg'">
	
</body>
</html>