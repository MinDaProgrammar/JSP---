<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: beige;">
	<h1 style="color: grey">requestPro3.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String strName= request.getParameter("name");
	String strId = request.getParameter("id");
	String strPasswd = request.getParameter("passwd");
// 	String strJumin1 = request.getParameter("jumin1");
// 	String strJumin2 = request.getParameter("jumin2");
	String Jumin = request.getParameter("jumin1") + "-" +request.getParameter("jumin2");
	
// 	String strEmail1 = request.getParameter("email1");
// 	String strEmail2 = request.getParameter("email2");
	String Email = request.getParameter("email1")+"@"+request.getParameter("email2");
	String strJob = request.getParameter("job");
	String strGender = request.getParameter("gender");
	String [] strHobbies = request.getParameterValues("hobby");
	String content = request.getParameter("content");
	
	if(strId.equals("admin")){
	%>
	<script>
	alert("이미 존재하는 아이디입니다!");
	history.back();
	</script>
	<%} %>
	<table border="1" style="color: #A50533; background-color: chocolate;">
		<tr>
			<th>이름</th>
			<td><%= strName %></td>
		</tr>
		
		<tr>
			<th>ID</th>
			<td><%= strId %></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><%=strPasswd %></td>
		</tr>
		
		<tr>
			<th>주민번호</th>
			<td><%=Jumin %></td>
		</tr>
		
		<tr>
			<th>E-mail</th>
			<td><%=Email %></td>
		</tr>
		
		<tr>
			<th>직업</th>
			<td><%=strJob %></td>
		</tr>
		
		<tr>
			<th>성별</th>
			<td><%=strGender %></td>
		</tr>
		
		<tr>
			<th>취미</th>
			<td>
			<%
			if(strHobbies==null){
			
			}else{
				for(int i=0;i<strHobbies.length;i++){
					out.print(strHobbies[i]+" ");
				}
			}
			%>
			</td>
			
			<tr>
				<th>가입동기</th>
				<td><%=content %></td>	
			</tr>
			
	</table>
</body>
</html>