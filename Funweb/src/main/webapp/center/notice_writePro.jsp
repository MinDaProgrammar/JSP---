<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO();
	
	dto.setName(request.getParameter("name"));
	dto.setPass(request.getParameter("pass"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	
	out.println(dto.getName()+dto.getPass()+dto.getSubject()+dto.getContent());
	int insertCount = dao.insert(dto);

	if(insertCount==0){
		%>
		<script>
			alert("글쓰기 실패!");
			history.back();
		</script>
		<%
	}else{
		response.sendRedirect("notice.jsp");
	}
%>