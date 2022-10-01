<%@page import="jsp10_board.MemberDAO"%>
<%@page import="jsp10_board.MemberDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String jumin = request.getParameter("jumin1")+"-"+request.getParameter("jumin2");
	String email = request.getParameter("email1")+"@"+request.getParameter("email2");
	String job = request.getParameter("job");
	String gender = request.getParameter("gender");
	String content = request.getParameter("content");

	//전달받은 파라미터 MemberDTO에 저장
	MemberDTO mdto = new MemberDTO();
	MemberDAO mdao = MemberDAO.getInstance();
	mdto.setName(name);
	mdto.setId(id);
	mdto.setPasswd(passwd);
	mdto.setJumin(jumin);
	mdto.setEmail(email);
	mdto.setJob(job);
	mdto.setGender(gender);
	mdto.setContent(content);
	//MemberDTO 의 insertMember 메서드 호출하여 저장
	int insertCount = mdao.insertMember(mdto);	
	//작업완료 후 insertCount 리턴값 판별 (0일 경우 회원추가 실패, 아니면 성공)
	if(insertCount==0){
		%>
		<script>
			alert("회원 추가 실패!");
			history.back();
		</script>
		<%
	}else{
		response.sendRedirect("../main.jsp");
	}
	%>
