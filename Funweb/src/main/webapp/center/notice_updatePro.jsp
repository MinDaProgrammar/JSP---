<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BoardDTO dto = new BoardDTO();
	dto.setContent(request.getParameter("content"));
	dto.setName(request.getParameter("name"));
	dto.setPass(request.getParameter("pass"));
	dto.setSubject(request.getParameter("subject"));
	dto.setIdx(idx);
	// 	out.println(idx+dto.getName()+dto.getContent()+dto.getPass()+dto.getSubject());
	BoardDAO dao = new BoardDAO();
	boolean isPassTrue = dao.checkPass(dto);	//비밀번호 일치 or 불일치
	
	
	if(isPassTrue){
	int updateCount = dao.updateBoard(dto);
	
	// 	int updateCount=1;
		if(updateCount ==0){
			%>
			<script>
				alert("업데이트 실패!");
				history.back();
			</script>
			<%
		}else{
			response.sendRedirect("notice_content.jsp?idx="+idx+"&pageNum="+pageNum);
		}
	}else{
		%>
		<script>
			alert("비밀번호가 불일치 합니다!");
			history.back();
		</script>
		<%
	}
%>
