<%@page import="jsp10_board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");		//글자 깨짐 방지를 위한 엔코딩
BoardDAO dao = new BoardDAO();				//dao를 통해 selectInfo메서드를 호출하여 테이블 전체목록 조회
//	ArrayList list = dao.selectInfo();			//selectInfo메서드에서 리턴된 리스트를 받음
BoardDTO dto = new BoardDTO();								// 각 인덱스의 dto의 내용출력을 위해 dto 임시 생성
int listCount = dao.selectListCount();


int pageNum=1;
int listLimit = 5 ;
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
ArrayList list = dao.selectInfo(pageNum,listLimit);
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style>
	/*간단한 꾸미기 */
	#listForm {
		width: 1024px;
		max-height: 600px;
		margin: auto;
	}
	
	h1 {
		text-align: center;
	}
	
	table {
		width: 1024px;
		margin: auto;
	}
	
	#tr_top {
		text-align: center;
		background: orange;
	}
	
	table td {
		text-align: center;
	}
	
	#subject {
		text-align: center;
		padding-left: 20px;
	}
	
	#buttonArea {
		width: 1024px;
		text-align: right;
		margin: auto;
	}
	
	#pageList {
		width: 1024px;
		text-align: center;
		margin: auto;
	}
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<section id="listForm">
		<h1 align="center">글 목록</h1>
		<table border="1">
			<tr id="tr_top">
		<!--  게시판 출력 내용 -->
				<th width="100px">작성 번호</th>
				<th>제목</th>
				<th width="150px">작성자</th>
				<th width="150px">비밀번호</th>
				<th width="150px">작성날짜</th>
				<th width="150px">조회수</th>
			</tr>
		<%if(list == null||list.size()==0){%>
			<tr>
				<th>게시물이 없습니다.</th>
			</tr>
		<%}else{ 
			for(int i=0;i<list.size();i++){ 
				dto = (BoardDTO)list.get(i);	//반복문을 통해 arrayList에 저장된 dto를 각 인덱스마다 불러와서 출력 
 				//이 때 주의할점은 리스트.get메서드를 사용하여 dto를 불러오는데, 리턴 타입이 object이기에 형변환 필요! 
 		%>
			<tr>
				<td><%=dto.getIdx() %></td>
				<td><a href="../board/detail.jsp?idx=<%=dto.getIdx()%>"><%=dto.getSubject() %></a></td>	<!-- 이름 클릭 시 내용을 보여줄 detail페이지로 이동 -->
				<td><%=dto.getName() %></td>
				<td><%=dto.getPasswd() %></td>
				<td><%=dto.getDate() %></td>
				<td><%=dto.getReadcount() %></td>
			</tr>
			<%}
		}%>
		</table>
	</section>
	<section id="buttonArea">
		<input type="button" value="메인화면" onclick="location.href='../main.jsp'">
		<input type="button" value="글쓰기" onclick="location.href='write_form.jsp'">	<!-- 글쓰기 작성시 글쓰기 페이지로 이동 -->
	</section>
	<section id="pageList">
		<input type="button" value="이전" <%if(pageNum>1){ %>onclick="location.href='member_management.jsp?pageNum=<%=pageNum-1%>'"<%}else{ %>disabled="disabled"<%} %>>
		<%for(int i=startPage;i<=endPage;i++){ 
			if(pageNum==i){
				out.println(i);
			}else{
		%>
			
			<a href="list.jsp?pageNum=<%=i%>"><%=i %></a> 
		<%	}
		}%>
<!-- 		|| -->
<%-- 		<% --%>
<!-- // 		for(int i=startPage;i<=endPage;i++){  -->
<!-- // 			if(pageNum==i){ -->
<!-- // 				out.println(i); -->
<!-- // 			}else{ -->
<!-- // 				out.println("<a href='list.jsp?pageNum="+i+"'>"+i+"</a>"); -->
<!-- // 			} -->
<!-- // 		} -->
<%-- 		%> --%>
		<input type="button" value="다음" <%if(pageNum<maxPage){ %>onclick="location.href='member_management.jsp?pageNum=<%=pageNum+1%>'"<%} else{%>disabled="disabled"<%} %>>
	</section>
</body>
</html>