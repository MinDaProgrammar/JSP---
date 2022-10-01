<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest3_login_pro.jsp</h1>
	<h3>아이디 : <%=request.getParameter("id") %></h3>
	<h3>패스워드 : <%=request.getParameter("passwd") %></h3>
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String dbId= "admin";
	String dbPasswd = "1234";
	
	if(id.equals(dbId)){
		if(!passwd.equals(dbPasswd)){
			%>
				<script>
				alert("패스워드 틀림");
				history.back();
				</script>
			<%
		}else{
			session.setAttribute("sId", id);
			response.sendRedirect("sessionTest3_main.jsp");
		}
	}else{
	%>
	<script>
	 alert("존재하지 않는 아이디!");
	 history.back();
	</script>
	
	<%}	%>
</body>
</html>