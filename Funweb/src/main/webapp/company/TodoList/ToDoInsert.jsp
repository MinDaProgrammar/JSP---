<%@page import="ToDoList.todolistDAO"%>
<%@page import="ToDoList.todolistDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sId= (String)session.getAttribute("sId");
	if(sId==null){
		%>
		<script>
			alert("로그인을 해주세요!");
			location.href="history.back()";
		</script>
		<%
	}
	todolistDTO dto = new todolistDTO();
	dto.setContent(request.getParameter("content"));
	dto.setId(sId);
	todolistDAO dao = new todolistDAO();
	dao.insert(dto);
	response.sendRedirect("To-do-list.jsp");
%>
