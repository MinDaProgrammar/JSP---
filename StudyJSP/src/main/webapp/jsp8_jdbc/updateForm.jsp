<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{
		text-align: right;
		font: bold;
		color:green;
		background-color: yellow;
		
		text-shadow: 3px 3px aqua, 2px 2px gray, 5px 5px fuchsia;
	}
</style>
</head>
<body>
	<h1>updateForm.jsp</h1>
	
<!-- 	<form action="requestPro1.jsp" method="get"> -->
	<form action="updatePro.jsp" method="post">
		<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"><br>
		</tr>

		<tr>
			<th>변경할 나이</th>
			<td><input type="text" name="age"><br>
		</tr>
		
		
		<tr>
			<td colspan="2"><input type="submit" value="전송"></td>
		</tr>
		</table>
	</form> 
	
</body>
</html>