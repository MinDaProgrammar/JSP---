<%@page import="jsp11_dbcp.BoardDAO"%>
<%@page import="jsp11_dbcp.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");			//한글 깨짐 방지를 위한 엔코딩
	BoardDTO dto = new BoardDTO();					//dto에 form에서 받아온 값을 저장하여 dao 에 전달
	dto.setName(request.getParameter("name"));		
	dto.setPasswd(request.getParameter("passwd"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));

	BoardDAO dao = new BoardDAO();			//dao를 생성하여 insert 메서드 호출해서 데이터베이스에 값 저장
	int insertCount = dao.insert(dto); 
	
	if(insertCount==0){		//만약 쿼리가 0이라면 insert 실패 후 이전 페이지로 돌아가기
		%>
		<script>
		alert("글쓰기 실패!");
		history.back();
		</script>
		<%
	}else{
		response.sendRedirect("list.jsp");		//쿼리가 성공적으로 입력됬을 시 list.jsp (글 목록) 페이지로 이동
	}
%>