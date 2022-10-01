<%@page import="jsp10_board.BoardDTO"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String content =request.getParameter("content");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	String passwd = request.getParameter("passwd");

	BoardDAO dao = new BoardDAO();
	BoardDTO dto = new BoardDTO();
	
	dto.setContent(content);
	dto.setName(name);
	dto.setIdx(idx);
	dto.setSubject(subject);
	dto.setPasswd(passwd);
	
	int updateCount = dao.modify(dto);
	
	if(updateCount!=0){
		%>
		<script>
		alert("글이 수정되었습니다!");
		</script>
		<%
		response.sendRedirect("detail.jsp?idx="+idx);
	}else{
		%>
		<script>
		alert("패스워드 틀림!");
		history.back();
		</script>
		<%
	}
%>