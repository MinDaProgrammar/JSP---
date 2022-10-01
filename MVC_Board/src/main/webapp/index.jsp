<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function confirmLogout(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="MemberLogout.me";
		}
	}
</script>
<style>
	header{
		text-align: right;
		margin-right: 2em;
	}	
	header a:link, header a:visited{
		text-decoration: none;
		color: green;
		font-weight: bold;
	}
	header a:hover, header a:active{
		text-decoration: none;
		color: orange;
		font-weight: bold;
	}
</style>
</head>
<body>
	<header>
	<c:choose>
		<c:when test="${ not empty sId}">
			${sId }님 | <a href="javascript:void(0)"  onclick="confirmLogout()" >로그아웃</a> | 
			<c:if test="${sId eq 'turtle123' }">
				<a href="Admin.me">관리자 페이지</a>
			</c:if>
		</c:when>
		<c:otherwise>
			<a href="MemberLoginForm.me">로그인</a> | <a href="MemberJoinForm.me" >회원가입</a>
		</c:otherwise>
	</c:choose>
	</header>
	<h1>MVC 게시판 프로젝트</h1>
	<h3><a href="BoardWriteForm.bo">글쓰기</a></h3>
	<h3><a href="BoardList.bo">글목록</a></h3>
	
</body>
</html>