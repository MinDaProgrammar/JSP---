<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String mobile = request.getParameter("mobile");
	

	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPass(pass);
	dto.setName(name);
	dto.setEmail(email);
	dto.setAddress(address);
	dto.setPhone(phone);
	dto.setMobile(mobile);
	
	MemberDAO dao = new MemberDAO();
	int insertCount = dao.insert(dto);
	
	if(insertCount==0){
		%>
		<script>
		alert("회원가입 실패!");
		history.back();
		</script>
		<%
	}else{
		response.sendRedirect("joinSuccess.jsp");
	}
	
%>