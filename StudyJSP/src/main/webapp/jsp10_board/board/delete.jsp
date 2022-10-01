<%@page import="jsp10_board.BoardDTO"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
<style>
#deleteForm{
		width: 300px;
		margin: auto;
		border: 1px solid orange;
	}
	
	h1{
		text-align: center;
	}
	
	table{
		width:300px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	if(session.getAttribute("sId")==null){	//세션에 값이 없으면, 즉 로그인이 안되어 있다면 자바 스크립트 사용하여 로그인 필수 출력 후 로그인 페이지로 이동
		%>
		<script>
		alert("로그인 필수!");
		location.href="../member/login_form.jsp";
		</script>
		<%
	}
	
%>
	<h1>글 삭제</h1>
	<section id="deleteForm">
		<form action="delete_pro.jsp" method="post">
			<input type="hidden" value="<%=idx %>" name="idx">
			<table>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" name="passwd" required="required">
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="삭제">
						<input type="button" value="돌아가기" onclick="history.back()">
					</td>
				</tr>
				
			</table>
		</form>
	</section>

</body>
</html>