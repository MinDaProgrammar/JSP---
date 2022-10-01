<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String testValue = (String)session.getAttribute("testValue");
	String name = request.getParameter("name");
	out.println(name+"<br>"+testValue);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이름: ${param.name } (\${param.name })</h3>
	<h3>세션값: ${sessionScope.testValue }(\${sessionScope.testValue })</h3>
	<h3> \${10 + 20 } = ${10+20 }</h3>
	<h3>값: \${param.num + 20} = ${param.num + 20 }</h3>
	<h3>\${10 >= 20 } = ${10 >= 20 }</h3>
	<h3>\${10 ge 20 } = ${10 ge 20 }</h3>
	<h3>\${empty param.name } = ${empty param.name }</h3>
	<h3>\${not empty param.name } = ${not empty param.name }</h3>
</body>
</html>