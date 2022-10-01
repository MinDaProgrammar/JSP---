<%@page import="jsp9_jdbc.TestDAO"%>
<%@page import="jsp9_jdbc.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int idx=Integer.parseInt(request.getParameter("idx"));
	String name= request.getParameter("name");

	TestDTO dto = new TestDTO();
	dto.setIdx(idx);
	dto.setName(name);

	TestDAO dao = new TestDAO();
// 	dao.insert(idx,name);
	int insertCount = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro.jsp</h1>
<%-- 	<h3>번호: <%=dto.getIdx()%>,<%=idx %></h3> --%>
<%-- 	<h3>이름: <%=dto.getName()%>,<%=name %></h3> --%>
	<%if(insertCount>0){ %>
		<h3>INSERT 작업 성공!</h3>
	<%}else{ %>
		<h3>INSERT 작업 실패!</h3>
	<%} %>
	<button onclick="location.href='test2.jsp?idx=<%=idx%>'">test2.jsp 로 이동</button>
</body>
</html>