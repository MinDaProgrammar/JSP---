<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestForm1.jsp</h1>
	
<!-- 	<form action="requestPro1.jsp" method="get"> -->
	<form action="requestPro1.jsp" method="post">
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
			<th>성별</th>
			<td><input type="radio" name="gender" value="male">남
			<input type="radio" name="gender" value="female">여<br></td>
		</tr>
		
		<tr>
			<th>취미</th>
			<td>
			<input type="checkbox" name="hobby" value="여행">여행
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="게임">게임
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><input type="submit" value="전송"></td>
		</tr>
		</table>
	</form> 
	
</body>
</html>