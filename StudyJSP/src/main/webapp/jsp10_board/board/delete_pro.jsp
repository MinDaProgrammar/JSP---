<%@page import="jsp10_board.BoardDAO"%>
<%@page import="jsp10_board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passwd = request.getParameter("passwd");	
	out.println(idx+passwd);
		
	BoardDTO dto = new BoardDTO();
	dto.setPasswd(request.getParameter("passwd"));
	dto.setIdx(Integer.parseInt(request.getParameter("idx")));
	
	BoardDAO dao = new BoardDAO();
	int deleteCount = dao.delete(dto);
	
	if(deleteCount!=0){
		%>
		<script>
		alert("삭제 완료!");
		location.href="list.jsp";
		</script>
		<%
	}else{
		%>
		<script>
		alert("비밀번호 불일치!");
		history.back();
		</script>
		<%
	}
%>