<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>responseTest2_result.jsp</h1>
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	%>
<%-- 	<h3> 아이디 : <%=id %></h3> --%>
<%-- 	<h3> 패스워드: <%=passwd %></h3> --%>

	<%
	if(id.equals("admin")&&passwd.equals("1234")){
		response.sendRedirect("responseTest2_result_success.jsp");
	%>
		<script>
// 			alert("로그인 성공");
// 			location.href="responseTest2_result_success.jsp";
		</script>
	<%
	}else{
		response.sendRedirect("responseTest2_result_fail.jsp");
	%>
		<script>
// 			alert("로그인 실패!");
// 			history.back();
		</script>
	<%} %>
	
</body>
</html>