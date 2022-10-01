<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	header {
		text-align: right;
	}
	
	body {
		text-align: center;
	}
</style>
</head>
<body>
	<header>
		<!-- 상단 Login, Join 링크 표시 -->
		<%
		// "sId" 세션값을 가져와서 id 변수에 저장
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {	
		%>
		<!-- 세션에 "id" 속성값이 없을 경우 login, join 버튼 표시 -->
		<div id="login">
			<a href="loginForm.jsp">login</a> | 
			<a href="#">join</a>
		</div>
		<%
		} else {
		%>
		<!-- 아니면(세션에 "sId" 속성값이 있을 경우) logout 버튼과 아이디 표시 -->
		<div id="login">
			<%=sId %>님 | <a href="#">logout</a>
		</div>
		<%	
		}
		%>
	</header>
	<h1>메인페이지</h1>
</body>
</html>













