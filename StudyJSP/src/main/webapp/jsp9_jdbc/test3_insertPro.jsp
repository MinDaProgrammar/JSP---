<%@page import="jsp9_jdbc.Test8_1DAO"%>
<%@page import="jsp9_jdbc.Test8_1DTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String[] hobby = request.getParameterValues("hobby");
	String gender = request.getParameter("gender");
// 	out.println("이름: "+name+"<br>");
// 	out.println("나이: "+age+"<br>");
// 	out.println("성별: "+gender+"<br>");
// 	out.println("취미: ");
// 	for(int i=0;i<hobby.length;i++){
// 		if(hobby[i]!=null){
// 		out.println(hobby[i]+"\t");
// 		}
// 	}
	String hob="";
	for(String item : hobby){
		hob +=item+"/";
	}
	
	Test8_1DTO dto = new Test8_1DTO();
	dto.setName(name);
	dto.setAge(age);
	dto.setGender(gender);
	dto.setHobby(hob);
	
	Test8_1DAO dao = new Test8_1DAO(); 
	int insertCount = dao.insert(dto);
	%>
	<h1>test3_insertPro.jsp</h1>
	<h3>이름: <%=dto.getName() %></h3>
	<h3>나이: <%=dto.getAge() %></h3>
	<h3>성별: <%=dto.getGender()%></h3>
	<h3>취미: <%=dto.getHobby() %></h3>
	<% if(insertCount>0){%>
	<h3>성공! Query Ok. <%=insertCount %>rows affected</h3>
	<%} %>
	<button onclick="location.href='test3_selectInfo.jsp?name=<%=dto.getName()%>'">추가된 회원 정보 확인</button>
	
</body>
</html>