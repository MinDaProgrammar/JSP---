<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));
	dto.setPass(request.getParameter("pass"));
	MemberDAO dao = new MemberDAO();
	boolean isLoginSuccess = dao.login(dto);
	if(isLoginSuccess){
		session.setAttribute("sId", dto.getId());
		response.sendRedirect("../main/main.jsp");
	}else{
		%>
		<script>
			alert("로그인 실패!");
			history.back();
		</script>
		<%
	}
	
	
%>