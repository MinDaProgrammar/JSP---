<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키를 확인하는 페이지</h1>
	<%
	String cookieHeader = request.getHeader("Cookie");
	
	if(cookieHeader!=null){
		Cookie[] cookies = request.getCookies();
		
		if(cookies !=null){
// 			for(int i=0; i<cookies.length;i++){
// 				out.println("쿠키명 : "+cookies[i].getName()+"<br>");
// 				out.println("쿠키값 : "+cookies[i].getValue()+"<br>");
// 			}
			for(Cookie cookie: cookies){
// 				out.println("쿠키명 : "+cookie.getName()+"<br>");
// 				out.println("쿠키값 : "+cookie.getValue()+"<br>");
				if(cookie.getName().equals("cookieName")){
	 				out.println("쿠키값 : "+cookie.getValue()+"<br>");
				}if(cookie.getName().equals("cookieName2")){
					out.println("쿠키값 : "+cookie.getValue()+"<br>");
				}
			}
		}
	}
	%>
	<button onclick="location.href='test_delete.jsp'">쿠키 삭제</button>
</body>
</html>