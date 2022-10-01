<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// URL 파라미터로 전달받은 id 값 가져오기
 	String id = request.getParameter("id");

// 가져온 id 값에 해당하는 레코드 조회하여 각 입력창에 출력(비밀번호 제외하고 출력)
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/study_jsp2";
	String user = "root";
	String password = "1234";
	Connection con = DriverManager.getConnection(url, user, password);
	String sql = "SELECT * FROM test8_2 WHERE id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String name = rs.getString("name");
	String jumin = rs.getString("jumin");
	String email = rs.getString("email");
	String job = rs.getString("job");
	String gender = rs.getString("gender");
	String content = rs.getString("content");
	String hobby = rs.getString("hobby");


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		background-color:#82F9B7; 
	}
	h1{
		text-align: left;
		font: bold;
		font-weight:500;
		color: #3254FF;
		background-color: #46D2D2;
		
		text-shadow: 3px 3px #32B2B2, 2px 2px #d2d2d2, 4px 4px #A814E7;
	}
	
	td{
		text-align: center;
		font: bold;
		font-weight: bolder;
		color:silver;
	}
	
	input, textarea{
		background-color: beige;
		font-family: sans-serif;
	}
</style>
</head>
<body>
	<!-- id 중복확인 버튼 클릭 시 새 창 띄우기(check_id.html 파일 열기)  -->
	<h1>회원상세정보</h1>
	<form action="insertPro2.jsp" method="post" name="fr">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=<%=rs.getString(1) %>></td></tr>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="id" placeholder="4 ~ 8글자 사이 입력" value=<%=id %>>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passwd" placeholder="8 ~ 16글자 사이 입력">
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" name="passwd2">
				</td>
			</tr>
			<tr>
				<% String[] arrJumin = jumin.split("-"); %>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" value=<%=arrJumin[0] %>>-<input type="text" name="jumin2" value=<%=arrJumin[1] %>>
				</td>
			</tr>
			<tr>
				<% String[] arrEmail = email.split("@"); %>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" value=<%=arrEmail[0] %>>@<input type="text" name="email2" value=<%=arrEmail[1] %>>
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="job">
						<option value="" <%if(job.equals("")){ %>selected="selected"<%} %>>항목을 선택하세요</option>
						<option value="개발자" <%if(job.equals("개발자")){ %>selected="selected"<%} %>>개발자</option>
						<option value="DB엔지니어" <%if(job.equals("DB엔지니어")){ %>selected="selected"<%} %>>DB엔지니어</option>
						<option value="관리자" <%if(job.equals("관리자")){ %>selected="selected"<%}else{ %>>관리자</option>
						<option value="기타"selected="selected"<%} %>>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남" <%if(gender.equals("남")){ %>checked="checked"<%} %>>남
					<input type="radio" name="gender" value="여" <%if(gender.equals("여")){ %>checked="checked"<%} %>>여
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="여행" <%if(hobby.contains("여행")){ %>checked="checked"<%} %>>여행
					<input type="checkbox" name="hobby" value="독서" <%if(hobby.contains("독서")){ %>checked="checked"<%} %>>독서
					<input type="checkbox" name="hobby" value="게임" <%if(hobby.contains("게임")){ %>checked="checked"<%} %>>게임
				</td>
			</tr>
			<tr>
				<td>가입동기</td>
				<td><textarea name="content" cols="40" rows="10"><%=rs.getString(9) %></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입">
					<input type="reset" value="초기화">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%
	rs.close();
	pstmt.close();
	con.close();
	
%>

