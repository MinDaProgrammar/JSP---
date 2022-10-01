<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_set.jsp</h1>
	<%
	session.setAttribute("sessionValue1", "첫번째 세션값");
	session.setAttribute("sessionValue2", "두번째 세션값");
	%>
	
	<h1>세션값 생성 완료!</h1>
	<h3><a href="sessionTest2_get.jsp">세션값 확인</a></h3>
	
	<h3>세션에 저장된 값 : <%=session.getAttribute("sessionValue1") %></h3>
	<h3>세션2에 저장된 값 : <%=session.getAttribute("sessionValue2") %></h3>
</body>
</html>