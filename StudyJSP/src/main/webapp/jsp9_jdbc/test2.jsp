<%@page import="jsp9_jdbc.TestDTO"%>
<%@page import="jsp9_jdbc.TestDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int idx = Integer.parseInt(request.getParameter("idx")); 
	TestDAO dao = new TestDAO();
	TestDTO dto = new TestDTO();
	dto = dao.selectInfo(idx);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp - 회원 정보</h1>
	<h3>idx: <%=idx %></h3>
	<h3>TestDTO.idx(번호) = <%=dto.getIdx() %></h3>
	<h3>TestDTO.name(이름) = <%=dto.getName() %></h3>
</body>
</html>