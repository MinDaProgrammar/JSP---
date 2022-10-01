<%@page import="board.FileBoardDAO"%>
<%@page import="board.FileBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	FileBoardDTO dto = new FileBoardDTO();
	dto.setPass(request.getParameter("pass"));
	dto.setIdx(idx);
	
	FileBoardDAO dao = new FileBoardDAO();
	boolean isCorrectPass = dao.checkPass(dto);
	
	
	
	if(isCorrectPass){
		int deleteCount = dao.deleteFileBoard(dto); 
		if(deleteCount==0){
			%>
			<script>
				alert("삭제 실패!");
				history.back();
			</script>
			<%
		}else{
		response.sendRedirect("driver.jsp?pageNum="+pageNum);			
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