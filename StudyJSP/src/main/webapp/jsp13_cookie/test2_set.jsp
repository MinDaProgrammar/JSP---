<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String language = request.getParameter("lang");
	Cookie cookie = new Cookie("language",language);
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	response.sendRedirect("test2.jsp");
%>