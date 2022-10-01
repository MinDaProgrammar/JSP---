<%@page import="board.FileBoardDTO"%>
<%@page import="board.FileBoardDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//검색어의 타입 (제목, 내용) 정해서 검색하기 기능 추가!

	request.setCharacterEncoding("UTF-8");		//글자 깨짐 방지를 위한 엔코딩
	//검색어 키워드 가져오기
	String keyword = request.getParameter("keyword");
	FileBoardDAO dao = new FileBoardDAO();				//dao를 통해 selectInfo메서드를 호출하여 테이블 전체목록 조회
	//	ArrayList list = dao.selectInfo();			//selectInfo메서드에서 리턴된 리스트를 받음
	FileBoardDTO dto;								// 각 인덱스의 dto의 내용출력을 위해 dto 임시 생성
	String search_type = request.getParameter("search_type");
	int listCount = dao.selectFileListCount(keyword);	//검색어에 해당하는 키워드의 개수만 가지고 옴
	int pageNum=1;
	int listLimit = 10 ;
	int pageLimit = 10;
	if(request.getParameter("pageNum")!=null){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	//-------------------------------------------------------------------------------
		//	int maxPage = (int)((double)listCount / listLimit+0.9);
		int maxPage = (int)Math.ceil((double)listCount / listLimit);	//전체 페이지의 수를 계산
		if(maxPage == 0){
			maxPage=1;	//전체 게시물이 0일때도 1페이지가 떠야함
		}
		int startPage = ((int)((double)pageNum / pageLimit+0.9) - 1) * pageLimit +1;	//한 페이지에 나올 수 있는 숫자의 첫번째 계산
		
		int endPage = startPage + pageLimit - 1;
		if(maxPage<endPage){
			endPage=maxPage;
		}	
		//------------------------------------------------------------------------------
		List list = null;
	if(search_type.equals("subject")){
		 list= dao.selectFileInfo(pageNum,listLimit,keyword); //제목으로 검색
	}else if(search_type.equals("name")){
		list = dao.selectFileInfo(keyword,pageNum,listLimit); //작성자로 검색 
	}else{
		list= dao.selectFileInfo(pageNum,keyword,listLimit); //내용으로 검색 
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/driver_search.jsp</title>
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
			<h1>Driver Download</h1>
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
				for(Object o : list){
					dto = (FileBoardDTO)o;
				%>
				<tr onclick = "location.href='driver_content.jsp?idx=<%=dto.getIdx()%>&pageNum=<%=pageNum%>'">
					<td><%=dto.getIdx() %></td>
					<td><%=dto.getSubject() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getDate() %></td>
					<td><%=dto.getReadcount() %></td>
				</tr>
				
				<%} %>
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" 
						onclick="location.href='./driver_write.jsp'">
			</div>
			<div id="table_search">
				<form action="./driver_search.jsp" method="get">
					<input type="hidden" value="<%=pageNum %>" name="pageNum"> 
					<select name="search_type">
						<option value="subject"> 제목 </option>
						<option value="name"> 작성자</option>
						<option value="content"> 내용</option>
					</select>
					<input type="text" name="keyword" class="input_box" value="<%=keyword %>">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>

			<div class="clear"></div>
			<div id="page_control">
				<%if(pageNum>1){ %><a href="driver_search.jsp?pageNum=<%=pageNum-1%>&keyword=<%=keyword%>">Prev</a><%}else{%>
				 <a onclick="#">Prev</a> 
				 <%} 
				
				for(int i=1;i<=maxPage;i++){ 
					if(pageNum!=i){
				%> 
						<a href="driver_search.jsp?pageNum=<%=i%>&keyword=<%=keyword%>"><%=i %></a>
				<%
					}else{
					%>
					<a onclick="#"><%=i %></a>
					<%	
					}
				}
				%>
				<%if(pageNum<maxPage){ %>
					<a href="driver_search.jsp?pageNum=<%=pageNum+1%>&keyword=<%=keyword%>">Next</a>
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
