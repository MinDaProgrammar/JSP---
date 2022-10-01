<%@page import="jsp10_board.MemberDAO"%>
<%@page import="jsp10_board.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	out.println(id+" ,"+ passwd);
	
	MemberDTO mdto = new MemberDTO();
	mdto.setId(id);
	mdto.setPasswd(passwd);
	
	//MemberDAO 객체에 checkUser() 메서드 호출하여 로그인 수행
	MemberDAO mdao = MemberDAO.getInstance();
	boolean isLoginSuccess = mdao.checkUser(mdto);
	isLoginSuccess = true;
	if(isLoginSuccess){
		response.sendRedirect("../main.jsp");
		session.setAttribute("sId", mdto.getId());
	}else{
		%>
		<script>
		alert("로그인 실패!");
		history.back();
		</script>
		<%
	}
%>
