<%@page import="jsp10_board.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sId = (String)session.getAttribute("sId");
%>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	a:link, a:visited{
		color: #364;
		text-decoration: none;
	}
	a:hover, a:active{
		color:#bd2;
		text-decoration: none;
	}
</style>

<title>Insert title here</title>
</head>
<body>
	<div align="right">
		<h5>
			<%if(sId==null){ %>
			<a href="MemberLoginForm.auth">로그인</a>|
			<a href="MemberJoinForm.auth">회원가입</a>
			<%}else if(sId.equals("admin")){ %>
			<%=sId %>님 | <a href="MemberLogout.auth">로그아웃</a>
			<a href="member/member_management.jsp">| 회원관리</a>
			<%}else{ MemberDAO mdao = MemberDAO.getInstance();
	String user = mdao.getWriter(sId);%>
			<%=user %>님 | <a href="MemberLogout.auth">로그아웃</a>
			<%} %>
		</h5>
	</div>
	
	
	<h1 align="center">메인화면</h1>
	<hr>
	<h3 align="center"><a href="board/write_form.jsp">글쓰기</a></h3>
	<h3 align="center"><a href="board/list.jsp">글목록</a></h3>
</body>
</html>