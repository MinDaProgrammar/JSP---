<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest3_login_form.jsp</h1>
	
	<form action="sessionTest3_login_pro.jsp" method="GET">
	<table border="1">
	<tr>
	<th>아이디:</th> <td><input type="text" name="id"></td>
	</tr>
	
	<tr>
	<th>패스워드:</th> <td> <input type="password" name="passwd"></td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" value="로그인"></td>
	</tr>
	</table>
	</form>
	
	
</body>
</html>