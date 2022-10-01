<%@page import="jsp10_board.MemberDAO"%>
<%@page import="jsp10_board.BoardReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp10_board.BoardDTO"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idx = Integer.parseInt(request.getParameter("idx"));	//목록 페이지에서 받아온 글번호를 정수로 저장
	
	BoardDAO dao = new BoardDAO();
	dao.updateReadcount(idx);	//조회수를 증가시키는 updateRead를 먼저 호출함. 
	
	BoardDTO dto = dao.selectDetail(idx);	//dao의 selectDetail로 내용만 뽑아오는 메서드를 받아서 dto에 저장
	
	//현재 게시물의 댓글 목록 조회
	ArrayList list = dao.selectReplyList(idx);
	MemberDAO mdao = MemberDAO.getInstance(); 	//작성자의 이름 출력을 받아오기위한 mdao 생성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	#articleForm {
		width: 600px;
		height: 550px;
		border: 1px solid red;
		margin: auto;
	}
	
	h1 {
		text-align: center;
	}
	
	table {
	 	width: 600px;
	}
	
	tr {
		height: 35px;
	}
	
	th {
		background: skyblue;
	}
	
	td {
		text-align: center;
	}
	
	#basicInfoArea {
		height: 55px;
		text-align: center;
	}
	
	#articleContentArea {
		background: orange;
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto;
		white-space: pre-line;
	}
	
	#commandCell {
		margin: 10px auto;
		width: 500px;
		text-align: center;
	}
	
	#replyArea {
		width: 600px;
		margin: auto;
	}
</style>
</head>
<body>
	<h1>글 상세 내용</h1>
	<section id="articleForm">
		<h1>글 상세내용</h1>
		<section id="basicInfoArea">
			<table>
				<tr>
					<th>제목</th><td colspan="6"><%=dto.getSubject() %></td>
				</tr>
				<tr>
					<th width="70">작성자</th><td><%=dto.getName() %></td>
					<th width="70">작성일</th><td width="90"><%=dto.getDate() %></td>
					<th width="70">조회수</th><td width="70"><%=dto.getReadcount() %></td>
				</tr>
			</table>
		</section>
		<section id="articleContentArea">
			<%=dto.getContent() %>
		</section>
		<section id="commandCell">
			<input type="button" value="수정" onclick="location.href='modify.jsp?idx=<%=dto.getIdx()%>'">
			<input type="button" value="삭제" onclick="location.href='delete.jsp?idx=<%=dto.getIdx()%>'">
			<input type="button" value="목록" onclick="location.href='list.jsp'">			
		</section>
	</section>
		
	<section id="replyArea">
		<%if(session.getAttribute("sId")!=null){ %>
		<!-- 댓글창 -->
		<section id="replyViewArea">
		<table border="1">
			<tr>
				<th>작성자</th>
				<th>댓글</th>
				<th>작성날짜</th>
			</tr>
			<%
			for (int i = 0; i < list.size(); i++) {
				BoardReplyDTO rdto = (BoardReplyDTO) list.get(i);
				String writer = mdao.getWriter(rdto.getId());
			%>
			<tr>
				<td><%=writer%></td>
				<td><%=rdto.getContent()%></td>
				<td><%=rdto.getDate() %></td>
			</tr>
			<%
			}
			%>
		</table>
		</section>
		 <section id="insertForm">
			<form action="writeDetailReply_pro.jsp">
			<input type="hidden" name="id" value="<%=session.getAttribute("sId")%>">
			<input type="hidden" name="idx" value="<%=idx %>">
			<textarea rows="3" cols="82" name="replyContent"></textarea>
			<input type="submit" value="댓글등록">
			</form>
		 </section>
		<%} %>
	</section>
	
</body>
</html>