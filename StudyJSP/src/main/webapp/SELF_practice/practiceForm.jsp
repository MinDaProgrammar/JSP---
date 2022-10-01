<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>practiceForm.jsp</h1>
	
	<form action="practicePro.jsp" method="post">
		<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name">
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" name="age">
		</tr>
		<tr>
			<th>성별</th>
			<td>
			Hello
			<input type="radio" name="gender" value="남">남
			<input type="radio" name="gender" value="여">여
			</td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="기타">기타
			<input type="checkbox" name="hobby" value="피아노">피아노
			<input type="checkbox" name="게임" value="게임">게임
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="전송"></td>
		</tr>
		</table>
	</form>
</body>
</html>