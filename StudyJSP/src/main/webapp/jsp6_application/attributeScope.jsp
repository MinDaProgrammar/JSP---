<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내장 객체 중 영역 객체의 속성 및 범위(Scope)</h1>
	<%
	pageContext.setAttribute("pageValue","pageContext value");
	request.setAttribute("requestValue","request value");
	session.setAttribute("sessionValue","session value");
	application.setAttribute("applicationValue","application value");
	%>
	
	<h3>pageContext : <%=pageContext.getAttribute("pageValue") %></h3>
	<h3>request : <%=request.getAttribute("requestValue") %></h3>
	<h3>session : <%=session.getAttribute("sessionValue") %></h3>
	<h3>application : <%=application.getAttribute("applicationValue") %></h3>
	
	<%
// 	pageContext.forward("attributeScopeTest2.jsp");
	response.sendRedirect("attributeScopeTest2.jsp");
	%>
</body>
</html>