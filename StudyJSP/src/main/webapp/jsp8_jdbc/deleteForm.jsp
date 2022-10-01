<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.td{
		text-align: right;
		font: bold;
		color:green;
	}
</style>
</head>
<body>
	<h1>deleteForm.jsp</h1>
	

	<form action="deletePro.jsp" method="post">
		<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"><br>
		</tr>

		<tr>
			<th>나이</th>
			<td><input type="text" name="age"><br>
		</tr>
		
		
		<tr>
			<td colspan="2"><input type="submit" value="전송"></td>
		</tr>
		</table>
	</form> 
	
</body>
</html>