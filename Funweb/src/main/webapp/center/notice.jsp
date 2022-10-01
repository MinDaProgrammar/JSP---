<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");		//글자 깨짐 방지를 위한 엔코딩
	BoardDAO dao = new BoardDAO();				//dao를 통해 selectInfo메서드를 호출하여 테이블 전체목록 조회
	//	ArrayList list = dao.selectInfo();			//selectInfo메서드에서 리턴된 리스트를 받음
	BoardDTO dto;								// 각 인덱스의 dto의 내용출력을 위해 dto 임시 생성
	int listCount = dao.selectListCount(); 
	
	int pageNum=1;
	int listLimit = 10 ;
	int pageLimit = 10;
	if(request.getParameter("pageNum")!=null){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	//-------------------------------------------------------------------------------
	//	int maxPage = (int)((double)listCount / listLimit+0.9);
	int maxPage = (int)Math.ceil((double)listCount / listLimit);
	
	int startPage = ((int)((double)pageNum / pageLimit+0.9) - 1) * pageLimit +1;
	
	int endPage = startPage + pageLimit - 1;
	if(maxPage<endPage){
		endPage=maxPage;
	}	
	//------------------------------------------------------------------------------
	List<BoardDTO> list = dao.selectInfo(pageNum,listLimit); 
	pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img_center"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="./notice.jsp">Notice</a></li>
				<li><a href="#">Public News</a></li>
				<li><a href="./driver.jsp">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>Notice</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Writer</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<%
				for(int i=0;i<list.size();i++){
					dto = (BoardDTO)list.get(i);
				%>
				<tr onclick = "location.href='notice_content.jsp?idx=<%=dto.getIdx()%>&pageNum=<%=pageNum%>'">
					<td><%=dto.getIdx() %></td>
					<td><%=dto.getSubject() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getDate() %></td>
					<td><%=dto.getReadcount() %></td>
				</tr>
				
				<%} %>
				<c:forEach var="board" items="${list }">
				<tr onclick = "location.href='notice_content.jsp?idx=${board.idx }&pageNum=${param.pageNum }'">
					<td>${board.idx }</td>
					<td>${board.subject }</td>
					<td>${board.name }</td>
					<td>${board.date }</td>
					<td>${board.readcount }</td>
				</tr>
				</c:forEach>
				
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" 
						onclick="location.href='./notice_write.jsp'">
			</div>
			<div id="table_search">
				<form action="./notice_search.jsp" method="get">
					<select name="search_type">
						<option value="subject"> 제목 </option>
						<option value="name"> 작성자</option>
						<option value="content"> 내용</option>
					</select>
					<input type="text" name="keyword" class="input_box">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>

			<div class="clear"></div>
			<div id="page_control">
				<%if(pageNum>1){ %><a href="notice.jsp?pageNum=<%=pageNum-1%>">Prev</a><%}else{%>
				 <a onclick="#">Prev</a> 
				 <%} %>
				<%for(int i=1;i<=maxPage;i++){ 
					if(pageNum!=i){
				%> 
						<a href="notice.jsp?pageNum=<%=i%>"><%=i %></a>
				<%
					}else{
					%>
					<a onclick="#"><%=i %></a>
					<%	
					}
				}
				%>
				<%if(pageNum<maxPage){ %>
					<a href="notice.jsp?pageNum=<%=pageNum+1%>">Next</a>
				<%}else{%>
				 <a onclick="#">Next</a> 
				<%} %>

			</div>
		</article>

		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


