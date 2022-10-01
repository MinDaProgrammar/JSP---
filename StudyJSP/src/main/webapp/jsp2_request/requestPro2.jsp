<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro2.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String strId= request.getParameter("id");
	String strPasswd = request.getParameter("passwd");
	%>
	<h3>아이디: <%=strId %></h3>
	<h3>패스워드: <%=strPasswd %></h3>
	
<%-- 	<%if(strId=="admin" && strPasswd=="1234"){ %> --%>
	<% if(strId.equals("admin") && strPasswd.equals("1234")){ %>
	<script>
		alert("로그인 성공!");
	</script>
	<%}else{ %>
	<script>
		alert("로그인 실패!");
		history.back();
	</script>
	<%}		%>
</body>
</html>