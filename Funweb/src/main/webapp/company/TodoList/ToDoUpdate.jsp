<%@page import="ToDoList.todolistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	todolistDAO dao = new todolistDAO();
	dao.update(Integer.parseInt(request.getParameter("idx"))); 
	response.sendRedirect("To-do-list.jsp");
%>
