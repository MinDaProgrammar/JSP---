<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attributeScopeTest2.jsp</h1>
	
	<h3>pageContext : <%=pageContext.getAttribute("pageValue") %></h3>
	<h3>request : <%=request.getAttribute("requestValue") %></h3>
	<h3>session : <%=session.getAttribute("sessionValue") %></h3>
	<h3>application : <%=application.getAttribute("applicationValue") %></h3>
</body>
</html>