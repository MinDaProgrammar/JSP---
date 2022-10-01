<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));
	MemberDAO dao = new MemberDAO();
	boolean overlap = dao.checkDup(dto);
	
	response.sendRedirect("check_id.jsp?id="+dto.getId()+"&overlap="+overlap);
	
%>