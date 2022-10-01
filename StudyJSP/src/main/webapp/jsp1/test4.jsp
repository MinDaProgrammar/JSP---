<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int hour = 11;
int min = 59;
int sec = 20;
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4.jsp - 스크립틀릿과 표현식 연습</h1>
	
	<h3>현재 시각: <%=hour %>시 <%=min %>분 <%=sec %>초</h3>
	<%
	if(hour<12){
		out.println("<h3>오전입니다.</h3>");
	}else{
		out.println("<h3>오후입니다.</h3>");
	}
	%>
	<%if(hour<12){ %>
	<h3>오전 입니다.</h3>
	<%} else{ %>
	<h3>오후 입니다.</h3>
	<%} %>
</body>
</html>