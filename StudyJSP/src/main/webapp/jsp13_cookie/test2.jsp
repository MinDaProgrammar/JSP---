<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String language = "ko-kr";

	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("language")){
				language=cookie.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 활용한 설정 정보 관리</title>
</head>
<body>
	<%if(language.equals("ko-kr")){ %>
	<h1>글로벌 웹사이트</h1>
	<h1>안녕하세요. 쿠키 예제입니다.</h1>
	<%}else if(language.equals("en-us")){ %>
	<h1>Global Website</h1>
	<h1>Hi, This is Cookie example.</h1>
	<%} %>
	
	<h3>현재 설정 언어: <%=language %></h3>
	<button onclick="location.href='test2_set.jsp?lang=ko-kr'">한국어</button>
	<button onclick="location.href='test2_set.jsp?lang=en-us'">영어</button>
</body>
</html>