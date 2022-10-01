<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
%>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="right">
		<h5>
		<%if(sId==null){ %>
			<a href="sessionTest3_login_form.jsp">로그인</a>|
			<a href="sessionTest3_join_form.jsp">회원가입</a>
		<%}else{ %>
			<%=sId %>님 |
			<a href="sessionTest3_logout.jsp">로그아웃</a>
		<%} %>
		</h5>
	</div>
	
	
	<h1>메인화면</h1>
	
</body>
</html>