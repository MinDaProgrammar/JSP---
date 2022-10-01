<%@page import="jsp10_board.BoardReplyDTO"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String replyContent = request.getParameter("replyContent");
	int idx = Integer.parseInt(request.getParameter("idx"));
// 	out.println(id + replyContent);

	BoardDAO dao = new BoardDAO();
	BoardReplyDTO dto = new BoardReplyDTO();
	dto.setContent(replyContent);
	dto.setId(id);
	dto.setRef(idx);
	
	int insertCount = dao.insertReply(dto);
	
	if(insertCount==0){
		%>
		<script>
		alert("댓글 등록 실패!");
		history.back();
		</script>
		<% 
	}else{
		response.sendRedirect("detail.jsp?idx="+idx);
	}
	
	
%>