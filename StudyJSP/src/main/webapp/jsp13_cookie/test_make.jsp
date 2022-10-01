<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("cookieName","cookieValue");
// 	cookie.setMaxAge(60);
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	Cookie cookie2 = new Cookie("cookieName2","cookieValue2");
	cookie2.setMaxAge(60);
	response.addCookie(cookie2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 생성 페이지</h1>
	<h3>쿠키명: <%=cookie.getName() %></h3>
	<h3>쿠키값: <%=cookie.getValue() %></h3>
	<h3>쿠키 유효시간: <%=cookie.getMaxAge() %></h3>
	<h3>쿠키명: <%=cookie2.getName() %></h3>
	<h3>쿠키값: <%=cookie2.getValue() %></h3>
	<h3>쿠키 유효시간: <%=cookie2.getMaxAge() %></h3>
	<button onclick="location.href='test_use.jsp'">쿠키 확인</button>
</body>
</html>