<%@page import="board.FileBoardDTO"%>
<%@page import="board.FileBoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main/main.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 들어가는곳 -->
		  
		<div class="clear"></div>   
		<!-- 본문들어가는 곳 -->
		<!-- 메인 이미지 -->
		<div id="main_img"><img src="../images/universe.jpg" width="971" height="303"></div>
		<!-- 본문 내용 -->
		<article id="front">
		  	<div id="solution">
		  		<div id="hosting">
		  			<h3>Web Hosting Solution</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		  		</div>
		  		<div id="security">
		  		  	<h3>Web Security Solution</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		  		</div>
		  		<div id="payment">
		  			<h3>Web Payment Solution</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		  		</div>
		  	</div>
		  	<div class="clear"></div>
			<div id="news_notice">
				<h3><span class="orange">Driver</span> Download</h3>
				<table>
				<%
					FileBoardDAO fileDao =new FileBoardDAO();
					List recentFileBoardList = fileDao.selectFileInfo(1, 5);
					for(Object o : recentFileBoardList){
						FileBoardDTO fdto = (FileBoardDTO)o;
					%>
					<tr>
						<td class="notice_title"><a href="../center/driver_content.jsp?idx=<%=fdto.getIdx()%>&pageNum=1"><%=fdto.getName() %></a></td>
						<td class="notice_date"><%=fdto.getDate() %></td>
					</tr>
					
					<%	
					}
				%>
				</table>
			</div>
		
			<div id="news_notice">
		  		<h3 class="brown">News &amp; Notice</h3>
		  		<table>
		  		<% 
		  			BoardDAO dao = new BoardDAO();
		  			List recentBoardList = dao.selectInfo(1, 5);
		  			for(Object o : recentBoardList){
		  				BoardDTO dto = (BoardDTO)o;
		  		%>	
				<tr>
					<td class="notice_title"><a href="../center/notice_content.jsp?idx=<%=dto.getIdx()%>&pageNum=1"><%=dto.getSubject() %></a></td> 
					<td class="notice_date"><%=dto.getDate() %> </td>
				</tr>
				<%
		  			}
		  		%>
		  		</table>
		  	</div>
	  	</article>
		  
		<div class="clear"></div>  
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


