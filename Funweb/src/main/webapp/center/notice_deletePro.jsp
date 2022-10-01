<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BoardDTO dto = new BoardDTO();
	dto.setPass(request.getParameter("pass"));
	dto.setIdx(idx);
	
	BoardDAO dao = new BoardDAO();
	boolean isCorrectPass = dao.checkPass(dto);
	
	
	
	if(isCorrectPass){
		int deleteCount = dao.deleteBoard(dto);
		if(deleteCount==0){
			%>
			<script>
				alert("삭제 실패!");
				history.back();
			</script>
			<%
		}else{
		response.sendRedirect("notice.jsp?pageNum="+pageNum);			
		}
	}else{
		%>
		<script>
			alert("비밀번호 불일치!");
			history.back();
		</script>
		<%
	}
%>