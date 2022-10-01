<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>requestPro1.jsp - request 객체 처리 페이지</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("name");
	out.print(str);
	%>
	<h3>str = <%=str %></h3>
	
	<%
	String strAge = request.getParameter("age");
	out.print(strAge+"<br>");
	String strGender = request.getParameter("gender");
	out.print(strGender);
	
	int age = Integer.parseInt(strAge);
// 	String strHobby = request.getParameter("hobby");
	String [] strHobbies = request.getParameterValues("hobby");
	
	%>
	
	
	
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=str %></td>
		</tr>

		<tr>
			<th>나이</th>
			<td><%=strAge %>, <%=age %></td>
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
				%>
				<script> 
				alert("취미를 1개 이상 선택하세요!");
				history.back();
				</script>
				<%
				}else{
				for(int i=0;i<strHobbies.length;i++){ %>
				<%=	strHobbies[i] %>
				<%
					} 
				}%>
			</td>
		</tr>
		</table>
	
</body>
</html>